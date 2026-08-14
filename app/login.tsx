import Ionicons from '@expo/vector-icons/Ionicons';
import { LinearGradient } from 'expo-linear-gradient';
import { Image, KeyboardAvoidingView, Platform, StyleSheet, View } from 'react-native';
import Animated, { FadeInDown } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ThemedText } from '@/components/themed-text';
import { Button } from '@/components/ui/button';
import { Screen } from '@/components/ui/screen';
import { TextField } from '@/components/ui/input';
import { toast } from '@/components/ui/toast';
import { GRADIENTS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useLoginForm } from '@/hooks/use-login-form';
import { useThemeColors } from '@/hooks/use-theme-colors';

const LOGO_ASSET = require('../assets/images/splash-logo.png');

export default function LoginScreen() {
  const COLORS = useThemeColors();
  const {
    email,
    setEmail,
    password,
    setPassword,
    error,
    submitting,
    handleSignIn,
    handleSignUp,
    handleOAuth,
  } = useLoginForm();

  const styles = StyleSheet.create({
    container: {
      flex: 1,
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
    error: {
      color: COLORS.danger,
      marginBottom: SPACING.element,
    },
    secondaryButton: {
      marginTop: SPACING.element,
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
  });

  const onOAuthPress = async (provider: 'google' | 'apple') => {
    const result = await handleOAuth(provider);
    if (result?.error) {
      toast.show(result.error, { variant: 'error' });
    }
  };

  return (
    <Screen scroll edges={['top', 'bottom']} contentContainerStyle={{ flexGrow: 1, justifyContent: 'center' }}>
      <KeyboardAvoidingView style={styles.container} behavior={Platform.OS === 'ios' ? 'padding' : undefined}>
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
          <TextField
            label="E-mail"
            placeholder="toi@exemple.com"
            autoCapitalize="none"
            keyboardType="email-address"
            value={email}
            onChangeText={setEmail}
          />
          <TextField
            label="Mot de passe"
            placeholder="••••••••"
            secureTextEntry
            value={password}
            onChangeText={setPassword}
          />

          {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}

          <Button label="Se connecter" onPress={handleSignIn} loading={submitting} />
          <Button
            label="Créer un compte"
            onPress={handleSignUp}
            variant="secondary"
            loading={submitting}
            style={styles.secondaryButton}
          />
        </Animated.View>

        <Animated.View entering={FadeInDown.delay(160).duration(500).springify().damping(16)}>
          <View style={styles.dividerRow}>
            <View style={styles.dividerLine} />
            <ThemedText style={styles.dividerText}>ou</ThemedText>
            <View style={styles.dividerLine} />
          </View>

          <BouncyPressable style={styles.oauthButton} onPress={() => onOAuthPress('google')} disabled={submitting}>
            <Ionicons name="logo-google" size={20} color={COLORS.text} />
            <ThemedText style={styles.oauthButtonText}>Continuer avec Google</ThemedText>
          </BouncyPressable>

          {Platform.OS === 'ios' ? (
            <BouncyPressable style={styles.oauthButton} onPress={() => onOAuthPress('apple')} disabled={submitting}>
              <Ionicons name="logo-apple" size={20} color={COLORS.text} />
              <ThemedText style={styles.oauthButtonText}>Continuer avec Apple</ThemedText>
            </BouncyPressable>
          ) : null}
        </Animated.View>
      </KeyboardAvoidingView>
    </Screen>
  );
}
