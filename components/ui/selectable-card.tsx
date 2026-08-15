import { StyleSheet, View } from 'react-native';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ThemedText } from '@/components/themed-text';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { RADIUS } from '@/constants/design';
import { useThemeColors } from '@/hooks/use-theme-colors';

type SelectableCardProps = {
  label: string;
  selected: boolean;
  onPress: () => void;
};

// The one "pick this option" row shared across onboarding (grade, série,
// LV2) and placement — a vivid colored border plus a lightly tinted fill
// (not a solid block of color) and a small checkmark badge once selected,
// so the selected state reads as "chosen", not just "a different color".
export function SelectableCard({ label, selected, onPress }: SelectableCardProps) {
  const COLORS = useThemeColors();

  const styles = StyleSheet.create({
    row: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      borderWidth: 2,
      borderColor: COLORS.border,
      paddingVertical: 14,
      paddingHorizontal: 16,
    },
    rowSelected: {
      backgroundColor: COLORS.accentSoft,
      borderColor: COLORS.accent,
    },
    label: {
      fontSize: 16,
      fontWeight: '700',
      color: COLORS.text,
    },
    labelSelected: {
      color: COLORS.accent,
    },
    badge: {
      width: 24,
      height: 24,
      borderRadius: 12,
      backgroundColor: COLORS.accent,
      alignItems: 'center',
      justifyContent: 'center',
    },
  });

  return (
    <BouncyPressable style={[styles.row, selected && styles.rowSelected]} onPress={onPress}>
      <ThemedText style={[styles.label, selected && styles.labelSelected]}>{label}</ThemedText>
      {selected ? (
        <View style={styles.badge}>
          <IconSymbol name="checkmark" size={14} color={COLORS.accentText} />
        </View>
      ) : null}
    </BouncyPressable>
  );
}
