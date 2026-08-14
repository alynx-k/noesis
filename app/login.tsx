import Ionicons from '@expo/vector-icons/Ionicons';
import { LinearGradient } from 'expo-linear-gradient';
import { router } from 'expo-router';
import { useState } from 'react';
import { Image, KeyboardAvoidingView, Platform, ScrollView, StyleSheet, TextInput, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { FadeInDown } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { GridBackground } from '@/components/grid-background';
import { ThemedText } from '@/components/themed-text';
import { ScreenBackground } from '@/components/screen-background';
import { GRADIENTS, PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useAuth } from '@/context/auth';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

const LOGO_ASSET = require('../assets/images/splash-logo.png');

export default function LoginScreen() {
  const COLORS = useThemeColors();
  const { signIn, signUp, signInWithGoogle, signInWithApple } = useAuth();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState<string | null>(null);
  const [submitting, setSubmitting] = useState(false);

  const handleSignIn = async () => {
    setError(null);
    setSubmitting(true);
    const { error } = await signIn(email, password);
    setSubmitting(false);
    if (error) {
      setError(error);
      return;
    }
    router.replace('/');
  };

  const handleSignUp = async () => {
    setError(null);
    setSubmitting(true);
    const { error } = await signUp(email, password);
    setSubmitting(false);
    if (error) {
      setError(error);
      return;
    }
    router.replace('/');
  };

  const handleOAuth = async (provider: 'google' | 'apple') => {
    setError(null);
    setSubmitting(true);
    const { error } = await (provider === 'google' ? signInWithGoogle() : signInWithApple());
    setSubmitting(false);
    if (error) {
      setError(error);
      return;
    }
    router.replace('/');
  };

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    container: {
      flex: 1,
    },
    scrollContent: {
      padding: SPACING.screen,
      flexGrow: 1,
      justifyContent: 'center',
    },
    logoBadge: {
      width: 76,
      height: 76,
      borderRadius: 22,
      alignSelf: 'center',
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: SPACING.element,
      shadowColor: '#000',
      shadowOpacity: 0.18,
      shadowRadius: 16,
      shadowOffset: { width: 0, height: 8 },
      elevation: 6,
    },
    logoImage: {
      width: 44,
      height: 44,
    },
    title: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
      textAlign: 'center',
      marginBottom: 8,
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      textAlign: 'center',
      marginBottom: SPACING.section,
    },
    input: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: 16,
      fontSize: 16,
      color: COLORS.text,
      marginBottom: SPACING.element,
      ...cardBorder(COLORS),
    },
    error: {
      color: COLORS.danger,
      marginBottom: SPACING.element,
    },
    primaryButton: {
      backgroundColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 16,
      alignItems: 'center',
      marginTop: SPACING.element,
      shadowColor: COLORS.accent,
      shadowOpacity: 0.3,
      shadowRadius: 12,
      shadowOffset: { width: 0, height: 6 },
      elevation: 3,
    },
    primaryButtonText: {
      color: COLORS.accentText,
      fontSize: 16,
      fontWeight: '700',
    },
    secondaryButton: {
      borderWidth: 1.5,
      borderColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 16,
      alignItems: 'center',
      marginTop: SPACING.element,
    },
    secondaryButtonText: {
      color: COLORS.accent,
      fontSize: 16,
      fontWeight: '700',
    },
    dividerRow: {
      flexDirection: 'row',
      alignItems: 'center',
      marginTop: SPACING.section,
      marginBottom: SPACING.element,
    },
    dividerLine: {
      flex: 1,
      height: StyleSheet.hairlineWidth,
      backgroundColor: COLORS.mutedText,
    },
    dividerText: {
      color: COLORS.mutedText,
      marginHorizontal: 12,
    },
    oauthButton: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'center',
      gap: 10,
      backgroundColor: COLORS.surface,
      borderRadius: PILL_RADIUS,
      paddingVertical: 16,
      marginTop: SPACING.element,
      ...cardBorder(COLORS),
    },
    oauthButtonText: {
      color: COLORS.text,
      fontSize: 16,
      fontWeight: '700',
    },
  });

  return (
    <ScreenBackground>
      <GridBackground />
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <KeyboardAvoidingView style={styles.container} behavior={Platform.OS === 'ios' ? 'padding' : undefined}>
          <ScrollView contentContainerStyle={styles.scrollContent} keyboardShouldPersistTaps="handled">
            <Animated.View entering={FadeInDown.duration(500).springify().damping(16)}>
              <LinearGradient
                colors={GRADIENTS.hero}
                start={{ x: 0, y: 0 }}
                end={{ x: 1, y: 1 }}
                style={styles.logoBadge}>
                <Image source={LOGO_ASSET} style={styles.logoImage} resizeMode="contain" />
              </LinearGradient>
              <ThemedText style={styles.title}>Noesis</ThemedText>
              <ThemedText style={styles.subtitle}>
                Connecte-toi ou crée un compte pour suivre ta progression.
              </ThemedText>
            </Animated.View>

            <Animated.View entering={FadeInDown.delay(80).duration(500).springify().damping(16)}>
              <TextInput
                style={styles.input}
                placeholder="Email"
                placeholderTextColor={COLORS.placeholderText}
                autoCapitalize="none"
                keyboardType="email-address"
                value={email}
                onChangeText={setEmail}
              />
              <TextInput
                style={styles.input}
                placeholder="Mot de passe"
                placeholderTextColor={COLORS.placeholderText}
                secureTextEntry
                value={password}
                onChangeText={setPassword}
              />

              {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}

              <BouncyPressable style={styles.primaryButton} onPress={handleSignIn} disabled={submitting}>
                <ThemedText style={styles.primaryButtonText}>Se connecter</ThemedText>
              </BouncyPressable>

              <BouncyPressable style={styles.secondaryButton} onPress={handleSignUp} disabled={submitting}>
                <ThemedText style={styles.secondaryButtonText}>Créer un compte</ThemedText>
              </BouncyPressable>
            </Animated.View>

            <Animated.View entering={FadeInDown.delay(160).duration(500).springify().damping(16)}>
              <View style={styles.dividerRow}>
                <View style={styles.dividerLine} />
                <ThemedText style={styles.dividerText}>ou</ThemedText>
                <View style={styles.dividerLine} />
              </View>

              <BouncyPressable
                style={styles.oauthButton}
                onPress={() => handleOAuth('google')}
                disabled={submitting}
              >
                <Ionicons name="logo-google" size={20} color={COLORS.text} />
                <ThemedText style={styles.oauthButtonText}>Continuer avec Google</ThemedText>
              </BouncyPressable>

              {Platform.OS === 'ios' ? (
                <BouncyPressable
                  style={styles.oauthButton}
                  onPress={() => handleOAuth('apple')}
                  disabled={submitting}
                >
                  <Ionicons name="logo-apple" size={20} color={COLORS.text} />
                  <ThemedText style={styles.oauthButtonText}>Continuer avec Apple</ThemedText>
                </BouncyPressable>
              ) : null}
            </Animated.View>
          </ScrollView>
        </KeyboardAvoidingView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
