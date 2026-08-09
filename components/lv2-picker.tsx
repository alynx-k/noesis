import { StyleSheet, View } from 'react-native';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ThemedText } from '@/components/themed-text';
import { RADIUS } from '@/constants/design';
import { LV2_OPTIONS, Lv2Id } from '@/constants/lv2';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

type Lv2PickerProps = {
  selected?: Lv2Id | null;
  onSelect: (lv2: Lv2Id) => void;
};

export function Lv2Picker({ selected, onSelect }: Lv2PickerProps) {
  const COLORS = useThemeColors();
  const styles = StyleSheet.create({
    list: {
      gap: 10,
    },
    row: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      paddingVertical: 14,
      paddingHorizontal: 16,
      ...cardBorder(COLORS),
    },
    rowSelected: {
      backgroundColor: COLORS.accent,
      borderColor: COLORS.accent,
    },
    rowText: {
      fontSize: 16,
      fontWeight: '700',
      color: COLORS.text,
    },
    rowTextSelected: {
      color: COLORS.accentText,
    },
  });

  return (
    <View style={styles.list}>
      {LV2_OPTIONS.map((option) => {
        const isSelected = option.id === selected;

        return (
          <BouncyPressable
            key={option.id}
            style={[styles.row, isSelected && styles.rowSelected]}
            onPress={() => onSelect(option.id)}>
            <ThemedText style={[styles.rowText, isSelected && styles.rowTextSelected]}>{option.label}</ThemedText>
          </BouncyPressable>
        );
      })}
    </View>
  );
}
