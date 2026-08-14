import { useState } from 'react';
import { StyleSheet } from 'react-native';
import Animated, { FadeInDown } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { GradePicker } from '@/components/grade-picker';
import { SeriePicker } from '@/components/serie-picker';
import { ThemedText } from '@/components/themed-text';
import { Screen } from '@/components/ui/screen';
import { SPACING, TYPOGRAPHY } from '@/constants/design';
import { GradeId, isLyceeGrade, SeriesId } from '@/constants/grades';
import { useSetInitialGrade } from '@/hooks/queries/use-onboarding';
import { useThemeColors } from '@/hooks/use-theme-colors';

export default function SelectGradeScreen() {
  const COLORS = useThemeColors();
  const [pendingGrade, setPendingGrade] = useState<GradeId | null>(null);
  const [error, setError] = useState<string | null>(null);
  const setInitialGrade = useSetInitialGrade();

  const finalize = async (grade: GradeId, serie: SeriesId | null) => {
    if (setInitialGrade.isPending) {
      return;
    }
    setError(null);
    const result = await setInitialGrade.mutateAsync({ grade, serie });
    if (result.error) {
      setError(result.error);
    }
    // No manual navigation: the profile query invalidation above makes the
    // root gate re-resolve, and Stack.Protected redirects automatically.
  };

  const handleSelectGrade = (grade: GradeId) => {
    if (isLyceeGrade(grade)) {
      setPendingGrade(grade);
      return;
    }
    finalize(grade, null);
  };

  const styles = StyleSheet.create({
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
      <Screen>
        <Animated.View entering={FadeInDown.duration(400).springify().damping(16)}>
          <BouncyPressable style={styles.backLink} onPress={() => setPendingGrade(null)}>
            <ThemedText style={styles.backLinkText}>‹ Changer de classe</ThemedText>
          </BouncyPressable>
          <ThemedText style={styles.title}>Quelle est ta série ?</ThemedText>
          <ThemedText style={styles.subtitle}>Les matières changent selon ta série.</ThemedText>

          {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}

          <SeriePicker grade={pendingGrade} onSelect={(serie) => finalize(pendingGrade, serie)} />
        </Animated.View>
      </Screen>
    );
  }

  return (
    <Screen>
      <Animated.View entering={FadeInDown.duration(400).springify().damping(16)}>
        <ThemedText style={styles.title}>Dans quelle classe es-tu ?</ThemedText>
        <ThemedText style={styles.subtitle}>Choisis ta classe pour commencer à réviser.</ThemedText>

        {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}

        <GradePicker onSelect={handleSelectGrade} />
      </Animated.View>
    </Screen>
  );
}
