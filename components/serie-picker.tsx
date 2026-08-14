import { StyleSheet, View } from 'react-native';
import Animated, { FadeInDown } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ThemedText } from '@/components/themed-text';
import { RADIUS } from '@/constants/design';
import { GradeId, SERIES_BY_GRADE, SeriesId } from '@/constants/grades';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

type SeriePickerProps = {
  grade: GradeId;
  selectedSerie?: SeriesId | null;
  onSelect: (serie: SeriesId) => void;
};

export function SeriePicker({ grade, selectedSerie, onSelect }: SeriePickerProps) {
  const COLORS = useThemeColors();
  const series = SERIES_BY_GRADE[grade] ?? [];

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
      {series.map((serie, index) => {
        const isSelected = serie.id === selectedSerie;
        return (
          <Animated.View key={serie.id} entering={FadeInDown.delay(index * 50).springify().damping(16)}>
            <BouncyPressable
              style={[styles.row, isSelected && styles.rowSelected]}
              onPress={() => onSelect(serie.id)}>
              <ThemedText style={[styles.rowText, isSelected && styles.rowTextSelected]}>{serie.label}</ThemedText>
            </BouncyPressable>
          </Animated.View>
        );
      })}
    </View>
  );
}
