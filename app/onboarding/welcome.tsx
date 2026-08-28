import { router } from 'expo-router';
import { Image, StyleSheet, View } from 'react-native';
import Animated, { FadeInDown } from 'react-native-reanimated';

import { ThemedText } from '@/components/themed-text';
import { Button } from '@/components/ui/button';
import { Screen } from '@/components/ui/screen';
import { SPACING, TYPOGRAPHY } from '@/constants/design';
import { useThemeColors } from '@/hooks/use-theme-colors';

const STUDENT_ILLUSTRATION = require('@/assets/images/3d/student-desk.png');

export default function OnboardingWelcomeScreen() {
  const COLORS = useThemeColors();

  const styles = StyleSheet.create({
    content: {
      flex: 1,
      justifyContent: 'center',
      alignItems: 'center',
    },
    illustration: {
      width: 220,
      height: 220,
      marginBottom: SPACING.section,
    },
    title: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
      textAlign: 'center',
      marginBottom: SPACING.tight,
    },
    titleAccent: {
      color: COLORS.accent,
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      textAlign: 'center',
      marginBottom: SPACING.section,
    },
    footer: {
      width: '100%',
      gap: SPACING.tight,
    },
  });

  return (
    <Screen>
      <Animated.View entering={FadeInDown.duration(400)} style={styles.content}>
        <Image source={STUDENT_ILLUSTRATION} style={styles.illustration} resizeMode="contain" />
        <ThemedText style={styles.title}>
          Bienvenue sur <ThemedText style={[styles.title, styles.titleAccent]}>noesis</ThemedText>
        </ThemedText>
        <ThemedText style={styles.subtitle}>
          Ton espace pour apprendre, comprendre et devenir la meilleure version de toi-même.
        </ThemedText>
      </Animated.View>
      <View style={styles.footer}>
        <Button label="Commencer" onPress={() => router.push('/onboarding/why')} />
      </View>
    </Screen>
  );
}
