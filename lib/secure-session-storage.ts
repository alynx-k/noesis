import AsyncStorage from '@react-native-async-storage/async-storage';
import * as aesjs from 'aes-js';
import * as SecureStore from 'expo-secure-store';
import 'react-native-get-random-values';
import { Platform } from 'react-native';

// Serializes get/set/remove for a given key so concurrent calls (Supabase
// calls setItem/removeItem on every auth-state transition — sign-in,
// sign-out, token refresh — and a sign-out followed immediately by a
// sign-in is a real, reachable sequence) can't interleave their two-step
// SecureStore-key + AsyncStorage-ciphertext writes. Without this, one
// call's SecureStore.deleteItemAsync could land after a *later* call's
// SecureStore.setItemAsync for the same key, deleting the key a fresh
// session's ciphertext depends on — decrypt() would then silently find no
// key and the session that just "succeeded" would vanish.
const operationQueues = new Map<string, Promise<unknown>>();

function enqueue<T>(key: string, operation: () => Promise<T>): Promise<T> {
  const previous = operationQueues.get(key) ?? Promise.resolve();
  const run = previous.then(operation, operation);
  // The queue's own tail must never reject (a rejection would poison every
  // later operation on this key) — the real result/error still goes to
  // this call's own caller via the returned `run` promise.
  operationQueues.set(
    key,
    run.then(
      () => undefined,
      () => undefined,
    ),
  );
  return run;
}

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

  // Returns null (never throws) on any decode failure — a missing key and
  // a corrupted/out-of-sync ciphertext are both treated as "no session
  // here", which just sends the user back to the login screen, rather than
  // an uncaught exception (aes-js's UTF-8 decoder throws on invalid byte
  // sequences, which garbage decrypted bytes reliably produce) propagating
  // out of the storage adapter and into supabase-js.
  private async decrypt(key: string, value: string): Promise<string | null> {
    const encryptionKeyHex = await SecureStore.getItemAsync(key);
    if (!encryptionKeyHex) {
      return null;
    }
    try {
      const cipher = new aesjs.ModeOfOperation.ctr(aesjs.utils.hex.toBytes(encryptionKeyHex), new aesjs.Counter(1));
      const decryptedBytes = cipher.decrypt(aesjs.utils.hex.toBytes(value));
      return aesjs.utils.utf8.fromBytes(decryptedBytes);
    } catch (error) {
      console.error('Failed to decrypt stored session, treating as absent:', error);
      return null;
    }
  }

  async getItem(key: string) {
    return enqueue(key, async () => {
      const encrypted = await AsyncStorage.getItem(key);
      if (!encrypted) {
        return null;
      }
      return this.decrypt(key, encrypted);
    });
  }

  async removeItem(key: string) {
    return enqueue(key, async () => {
      await AsyncStorage.removeItem(key);
      await SecureStore.deleteItemAsync(key);
    });
  }

  async setItem(key: string, value: string) {
    return enqueue(key, async () => {
      const encrypted = await this.encrypt(key, value);
      await AsyncStorage.setItem(key, encrypted);
    });
  }
}

// expo-secure-store has no web implementation (calling it throws), so the
// web build keeps plain AsyncStorage — no regression there, just no upgrade
// either, since there's no OS keychain for a browser tab to hand off to.
export const secureSessionStorage = Platform.OS === 'web' ? AsyncStorage : new LargeSecureStore();
