import { router } from 'expo-router';
import { useState } from 'react';
import { StyleSheet } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { FadeInDown } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { GradePicker } from '@/components/grade-picker';
import { GridBackground } from '@/components/grid-background';
import { ScreenBackground } from '@/components/screen-background';
import { SeriePicker } from '@/components/serie-picker';
import { ThemedText } from '@/components/themed-text';
import { SPACING, TYPOGRAPHY } from '@/constants/design';
import { GradeId, isLyceeGrade, SeriesId } from '@/constants/grades';
import { useAuth } from '@/context/auth';
import { useThemeColors } from '@/hooks/use-theme-colors';
import { setInitialGrade } from '@/lib/grade';

export default function SelectGradeScreen() {
  const COLORS = useThemeColors();
  const { user } = useAuth();
  const [pendingGrade, setPendingGrade] = useState<GradeId | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [saving, setSaving] = useState(false);

  const finalize = async (grade: GradeId, serie: SeriesId | null) => {
    if (!user || saving) {
      return;
    }
    setError(null);
    setSaving(true);
    const { error } = await setInitialGrade(user.id, grade, serie);
    setSaving(false);
    if (error) {
      setError(error);
      return;
    }
    router.replace('/');
  };

  const handleSelectGrade = (grade: GradeId) => {
    if (isLyceeGrade(grade)) {
      setPendingGrade(grade);
      return;
    }
    finalize(grade, null);
  };

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    container: {
      flex: 1,
      padding: SPACING.screen,
    },
    title: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
      marginBottom: 8,
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      marginBottom: SPACING.section,
    },
    error: {
      color: COLORS.danger,
      marginBottom: SPACING.element,
    },
    backLink: {
      marginBottom: SPACING.element,
    },
    backLinkText: {
      ...TYPOGRAPHY.body,
      color: COLORS.accent,
      fontWeight: '600',
    },
  });

  if (pendingGrade) {
    return (
      <ScreenBackground>
        <GridBackground />
        <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
          <Animated.View style={styles.container} entering={FadeInDown.duration(400).springify().damping(16)}>
            <BouncyPressable style={styles.backLink} onPress={() => setPendingGrade(null)}>
              <ThemedText style={styles.backLinkText}>‹ Changer de classe</ThemedText>
            </BouncyPressable>
            <ThemedText style={styles.title}>Quelle est ta série ?</ThemedText>
            <ThemedText style={styles.subtitle}>Les matières changent selon ta série.</ThemedText>

            {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}

            <SeriePicker grade={pendingGrade} onSelect={(serie) => finalize(pendingGrade, serie)} />
          </Animated.View>
        </SafeAreaView>
      </ScreenBackground>
    );
  }

  return (
    <ScreenBackground>
      <GridBackground />
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <Animated.View style={styles.container} entering={FadeInDown.duration(400).springify().damping(16)}>
          <ThemedText style={styles.title}>Dans quelle classe es-tu ?</ThemedText>
          <ThemedText style={styles.subtitle}>
            Choisis ta classe pour commencer à réviser.
          </ThemedText>

          {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}

          <GradePicker onSelect={handleSelectGrade} />
        </Animated.View>
      </SafeAreaView>
    </ScreenBackground>
  );
}
