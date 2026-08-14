import { useState } from 'react';
import { StyleSheet } from 'react-native';
import Animated, { FadeInDown } from 'react-native-reanimated';

import { Lv2Picker } from '@/components/lv2-picker';
import { ThemedText } from '@/components/themed-text';
import { Screen } from '@/components/ui/screen';
import { SPACING, TYPOGRAPHY } from '@/constants/design';
import { Lv2Id } from '@/constants/lv2';
import { useSetLv2 } from '@/hooks/queries/use-onboarding';
import { useThemeColors } from '@/hooks/use-theme-colors';

export default function SelectLanguageScreen() {
  const COLORS = useThemeColors();
  const [error, setError] = useState<string | null>(null);
  const setLv2 = useSetLv2();

  const handleSelect = async (lv2: Lv2Id) => {
    if (setLv2.isPending) {
      return;
    }
    setError(null);
    const result = await setLv2.mutateAsync(lv2);
    if (result.error) {
      setError(result.error);
    }
  };

  const styles = StyleSheet.create({
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
    <Screen>
      <Animated.View entering={FadeInDown.duration(400).springify().damping(16)}>
        <ThemedText style={styles.title}>Quelle LV2 étudies-tu ?</ThemedText>
        <ThemedText style={styles.subtitle}>Espagnol ou Allemand, selon ce que tu apprends à l&apos;école.</ThemedText>
        {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}
      </Animated.View>
      <Lv2Picker onSelect={handleSelect} />
    </Screen>
  );
}
