import AsyncStorage from '@react-native-async-storage/async-storage';
import * as aesjs from 'aes-js';
import * as SecureStore from 'expo-secure-store';
import 'react-native-get-random-values';
import { Platform } from 'react-native';

// Supabase's session payload (access + refresh token, user metadata) can
// exceed SecureStore's ~2048-byte per-item limit, so the raw JSON can't go
// into SecureStore directly. Standard workaround (Supabase's own recipe for
// Expo apps): encrypt the payload with a random AES-256 key, store the
// (unbounded-size) ciphertext in AsyncStorage, and keep only the small key
// itself in SecureStore — the one piece that actually needs OS-level
// (Keychain/Keystore) protection.
class LargeSecureStore {
  private async encrypt(key: string, value: string) {
    const encryptionKey = crypto.getRandomValues(new Uint8Array(256 / 8));
    const cipher = new aesjs.ModeOfOperation.ctr(encryptionKey, new aesjs.Counter(1));
    const encryptedBytes = cipher.encrypt(aesjs.utils.utf8.toBytes(value));

    await SecureStore.setItemAsync(key, aesjs.utils.hex.fromBytes(encryptionKey));

    return aesjs.utils.hex.fromBytes(encryptedBytes);
  }

  private async decrypt(key: string, value: string) {
    const encryptionKeyHex = await SecureStore.getItemAsync(key);
    if (!encryptionKeyHex) {
      return null;
    }
    const cipher = new aesjs.ModeOfOperation.ctr(aesjs.utils.hex.toBytes(encryptionKeyHex), new aesjs.Counter(1));
    const decryptedBytes = cipher.decrypt(aesjs.utils.hex.toBytes(value));

    return aesjs.utils.utf8.fromBytes(decryptedBytes);
  }

  async getItem(key: string) {
    const encrypted = await AsyncStorage.getItem(key);
    if (!encrypted) {
      return null;
    }
    return this.decrypt(key, encrypted);
  }

  async removeItem(key: string) {
    await AsyncStorage.removeItem(key);
    await SecureStore.deleteItemAsync(key);
  }

  async setItem(key: string, value: string) {
    const encrypted = await this.encrypt(key, value);
    await AsyncStorage.setItem(key, encrypted);
  }
}

// expo-secure-store has no web implementation (calling it throws), so the
// web build keeps plain AsyncStorage — no regression there, just no upgrade
// either, since there's no OS keychain for a browser tab to hand off to.
export const secureSessionStorage = Platform.OS === 'web' ? AsyncStorage : new LargeSecureStore();
