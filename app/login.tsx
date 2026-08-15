import Ionicons from '@expo/vector-icons/Ionicons';
import { LinearGradient } from 'expo-linear-gradient';
import { useEffect } from 'react';
import { ActivityIndicator, Image, KeyboardAvoidingView, Platform, StyleSheet, View } from 'react-native';
import Animated, {
  Easing,
  FadeInDown,
  useAnimatedStyle,
  useSharedValue,
  withRepeat,
  withTiming,
} from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ThemedText } from '@/components/themed-text';
import { Button } from '@/components/ui/button';
import { Halo } from '@/components/ui/halo';
import { TextField } from '@/components/ui/input';
import { Screen } from '@/components/ui/screen';
import { ELEVATION, GRADIENTS, HALO_COLORS, PILL_RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useLoginForm } from '@/hooks/use-login-form';
import { useThemeColors } from '@/hooks/use-theme-colors';

const LOGO_ASSET = require('../assets/images/splash-logo.png');

export default function LoginScreen() {
  const COLORS = useThemeColors();
  const {
    mode,
    setMode,
    email,
    setEmail,
    password,
    setPassword,
    prenom,
    setPrenom,
    errors,
    submitting,
    oauthLoading,
    handleSignIn,
    handleSignUp,
    handleOAuth,
    pendingConfirmationEmail,
    resending,
    resendMessage,
    handleResendConfirmation,
    dismissConfirmationPending,
  } = useLoginForm();
  // True while any auth request is in flight — email/password or OAuth —
  // so the two mechanisms can't be triggered on top of each other.
  const anyLoading = submitting || oauthLoading !== null;

  // A slow, continuous spin — the brand mark itself is orbital rings, so this
  // is an ambient motif that means something, not a generic mount effect.
  const ringRotation = useSharedValue(0);
  useEffect(() => {
    ringRotation.value = withRepeat(withTiming(360, { duration: 22000, easing: Easing.linear }), -1);
  }, [ringRotation]);
  const ringStyle = useAnimatedStyle(() => ({ transform: [{ rotate: `${ringRotation.value}deg` }] }));

  const styles = StyleSheet.create({
    container: {
      flex: 1,
      justifyContent: 'center',
    },
    haloWrap: {
      position: 'absolute',
      top: -120,
      alignSelf: 'center',
      alignItems: 'center',
    },
    logoStage: {
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: SPACING.element,
      height: 108,
    },
    ring: {
      position: 'absolute',
      width: 108,
      height: 108,
      borderRadius: 54,
      borderWidth: 1.5,
      borderColor: COLORS.borderStrong,
      borderRightColor: 'transparent',
      borderTopColor: 'transparent',
    },
    logoBadge: {
      width: 72,
      height: 72,
      borderRadius: 20,
      alignItems: 'center',
      justifyContent: 'center',
      ...ELEVATION.md,
      shadowColor: HALO_COLORS.violet,
    },
    logoImage: {
      width: 40,
      height: 40,
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
    tabRow: {
      flexDirection: 'row',
      backgroundColor: COLORS.lockedBackground,
      borderRadius: PILL_RADIUS,
      padding: 4,
      marginBottom: SPACING.section,
    },
    tab: {
      flex: 1,
      paddingVertical: 10,
      borderRadius: PILL_RADIUS,
      alignItems: 'center',
    },
    tabActive: {
      backgroundColor: COLORS.surface,
      ...ELEVATION.sm,
    },
    tabText: {
      fontSize: 14,
      fontWeight: '700',
      color: COLORS.mutedText,
    },
    tabTextActive: {
      color: COLORS.text,
    },
    generalError: {
      color: COLORS.danger,
      marginBottom: SPACING.element,
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
      borderRadius: 999,
      paddingVertical: 16,
      marginTop: SPACING.element,
      backgroundColor: COLORS.surface,
      borderWidth: 1,
      borderColor: COLORS.border,
    },
    oauthButtonText: {
      color: COLORS.text,
      fontSize: 16,
      fontWeight: '700',
    },
    confirmIconBadge: {
      width: 72,
      height: 72,
      borderRadius: 36,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
      alignSelf: 'center',
      marginBottom: SPACING.element,
    },
    confirmEmail: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      textAlign: 'center',
      marginBottom: SPACING.section,
    },
    resendMessage: {
      color: COLORS.accent,
      textAlign: 'center',
      marginTop: SPACING.tight,
      marginBottom: SPACING.tight,
    },
    backLink: {
      alignSelf: 'center',
      marginTop: SPACING.element,
    },
    backLinkText: {
      color: COLORS.mutedText,
      fontSize: 14,
      fontWeight: '600',
    },
  });

  return (
    <Screen scroll edges={['top', 'bottom']} contentContainerStyle={{ flexGrow: 1, justifyContent: 'center' }}>
      <View style={styles.haloWrap} pointerEvents="none">
        <Halo color={HALO_COLORS.violet} size={260} opacity={0.28} />
      </View>

      <KeyboardAvoidingView style={styles.container} behavior={Platform.OS === 'ios' ? 'padding' : undefined}>
        {/* One coordinated entrance for the whole screen — not a staircase of
            per-section fades. */}
        <Animated.View entering={FadeInDown.duration(550).springify().damping(18)}>
          <View style={styles.logoStage}>
            <Animated.View style={[styles.ring, ringStyle]} />
            <LinearGradient
              colors={GRADIENTS.hero}
              start={{ x: 0, y: 0 }}
              end={{ x: 1, y: 1 }}
              style={styles.logoBadge}>
              <Image source={LOGO_ASSET} style={styles.logoImage} resizeMode="contain" />
            </LinearGradient>
          </View>
          <ThemedText style={styles.title}>Noesis</ThemedText>

          {pendingConfirmationEmail ? (
            <>
              <View style={styles.confirmIconBadge}>
                <Ionicons name="mail-outline" size={32} color={COLORS.accent} />
              </View>
              <ThemedText style={styles.subtitle}>Vérifie ta boîte mail pour activer ton compte.</ThemedText>
              <ThemedText style={styles.confirmEmail}>{pendingConfirmationEmail}</ThemedText>

              <Button label="Renvoyer l'e-mail" onPress={handleResendConfirmation} loading={resending} variant="secondary" />
              {resendMessage ? <ThemedText style={styles.resendMessage}>{resendMessage}</ThemedText> : null}
              {errors.general ? <ThemedText style={styles.generalError}>{errors.general}</ThemedText> : null}

              <BouncyPressable style={styles.backLink} onPress={dismissConfirmationPending}>
                <ThemedText style={styles.backLinkText}>‹ Retour à la connexion</ThemedText>
              </BouncyPressable>
            </>
          ) : (
            <>
          <ThemedText style={styles.subtitle}>
            Connecte-toi ou crée un compte pour suivre ta progression.
          </ThemedText>

          <View style={styles.tabRow}>
            <BouncyPressable style={[styles.tab, mode === 'signin' && styles.tabActive]} onPress={() => setMode('signin')}>
              <ThemedText style={[styles.tabText, mode === 'signin' && styles.tabTextActive]}>Connexion</ThemedText>
            </BouncyPressable>
            <BouncyPressable style={[styles.tab, mode === 'signup' && styles.tabActive]} onPress={() => setMode('signup')}>
              <ThemedText style={[styles.tabText, mode === 'signup' && styles.tabTextActive]}>
                Créer un compte
              </ThemedText>
            </BouncyPressable>
          </View>

          {mode === 'signup' ? (
            <TextField
              label="Prénom"
              autoCapitalize="words"
              value={prenom}
              onChangeText={setPrenom}
              error={errors.prenom}
              editable={!anyLoading}
            />
          ) : null}
          <TextField
            label="E-mail"
            autoCapitalize="none"
            keyboardType="email-address"
            value={email}
            onChangeText={setEmail}
            error={errors.email}
            editable={!anyLoading}
          />
          <TextField
            label="Mot de passe"
            secureTextEntry
            value={password}
            onChangeText={setPassword}
            error={errors.password}
            editable={!anyLoading}
          />

          {errors.general ? <ThemedText style={styles.generalError}>{errors.general}</ThemedText> : null}

          {mode === 'signin' ? (
            <Button label="Se connecter" onPress={handleSignIn} loading={submitting} disabled={oauthLoading !== null} />
          ) : (
            <Button label="Créer mon compte" onPress={handleSignUp} loading={submitting} disabled={oauthLoading !== null} />
          )}

          <View style={styles.dividerRow}>
            <View style={styles.dividerLine} />
            <ThemedText style={styles.dividerText}>ou</ThemedText>
            <View style={styles.dividerLine} />
          </View>

          <BouncyPressable style={styles.oauthButton} onPress={() => handleOAuth('google')} disabled={anyLoading}>
            {oauthLoading === 'google' ? (
              <ActivityIndicator color={COLORS.text} />
            ) : (
              <>
                <Ionicons name="logo-google" size={20} color={COLORS.text} />
                <ThemedText style={styles.oauthButtonText}>Continuer avec Google</ThemedText>
              </>
            )}
          </BouncyPressable>

          {Platform.OS === 'ios' ? (
            <BouncyPressable style={styles.oauthButton} onPress={() => handleOAuth('apple')} disabled={anyLoading}>
              {oauthLoading === 'apple' ? (
                <ActivityIndicator color={COLORS.text} />
              ) : (
                <>
                  <Ionicons name="logo-apple" size={20} color={COLORS.text} />
                  <ThemedText style={styles.oauthButtonText}>Continuer avec Apple</ThemedText>
                </>
              )}
            </BouncyPressable>
          ) : null}
            </>
          )}
        </Animated.View>
      </KeyboardAvoidingView>
    </Screen>
  );
}
