import { router } from 'expo-router';
import { useState } from 'react';
import { StyleSheet } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { Lv2Picker } from '@/components/lv2-picker';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { SPACING, TYPOGRAPHY } from '@/constants/design';
import { Lv2Id } from '@/constants/lv2';
import { useAuth } from '@/context/auth';
import { useThemeColors } from '@/hooks/use-theme-colors';
import { setLv2 } from '@/lib/lv2';

export default function SelectLanguageScreen() {
  const COLORS = useThemeColors();
  const { user } = useAuth();
  const [error, setError] = useState<string | null>(null);
  const [saving, setSaving] = useState(false);

  const handleSelect = async (lv2: Lv2Id) => {
    if (!user || saving) {
      return;
    }
    setError(null);
    setSaving(true);
    const { error } = await setLv2(user.id, lv2);
    setSaving(false);
    if (error) {
      setError(error);
      return;
    }
    router.replace('/');
  };

  const styles = StyleSheet.create({
    container: {
      flex: 1,
    },
    safeArea: {
      flex: 1,
      padding: SPACING.screen,
    },
    title: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
      marginBottom: SPACING.tight,
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      marginBottom: SPACING.section,
    },
    error: {
      ...TYPOGRAPHY.body,
      color: COLORS.danger,
      marginBottom: SPACING.element,
    },
  });

  return (
    <ThemedView style={styles.container}>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <ThemedText style={styles.title}>Quelle LV2 étudies-tu ?</ThemedText>
        <ThemedText style={styles.subtitle}>Espagnol ou Allemand, selon ce que tu apprends à l'école.</ThemedText>
        {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}
        <Lv2Picker onSelect={handleSelect} />
      </SafeAreaView>
    </ThemedView>
  );
}
