import { router } from 'expo-router';
import { useState } from 'react';
import { StyleSheet } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { GradePicker } from '@/components/grade-picker';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { SPACING, TYPOGRAPHY } from '@/constants/design';
import { GradeId } from '@/constants/grades';
import { useAuth } from '@/context/auth';
import { useThemeColors } from '@/hooks/use-theme-colors';
import { setInitialGrade } from '@/lib/grade';

export default function SelectGradeScreen() {
  const COLORS = useThemeColors();
  const { user } = useAuth();
  const [error, setError] = useState<string | null>(null);
  const [saving, setSaving] = useState(false);

  const handleSelect = async (grade: GradeId) => {
    if (!user || saving) {
      return;
    }
    setError(null);
    setSaving(true);
    const { error } = await setInitialGrade(user.id, grade);
    setSaving(false);
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
      backgroundColor: COLORS.background,
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
  });

  return (
    <ThemedView style={styles.container}>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <ThemedText style={styles.title}>Dans quelle classe es-tu ?</ThemedText>
        <ThemedText style={styles.subtitle}>
          Choisis ta classe pour commencer à réviser.
        </ThemedText>

        {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}

        <GradePicker onSelect={handleSelect} />
      </SafeAreaView>
    </ThemedView>
  );
}
