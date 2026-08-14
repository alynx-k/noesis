import { StyleSheet, View } from 'react-native';
import Animated, { FadeInDown } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ThemedText } from '@/components/themed-text';
import { RADIUS } from '@/constants/design';
import { GRADES, GradeId } from '@/constants/grades';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

type GradePickerProps = {
  selectedGrade?: GradeId | null;
  onSelect: (grade: GradeId) => void;
};

export function GradePicker({ selectedGrade, onSelect }: GradePickerProps) {
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
    rowDisabled: {
      backgroundColor: COLORS.lockedBackground,
      borderColor: COLORS.lockedBackground,
    },
    rowTextDisabled: {
      fontSize: 16,
      fontWeight: '600',
      color: COLORS.locked,
    },
    badge: {
      fontSize: 12,
      fontWeight: '600',
      color: COLORS.locked,
    },
  });

  return (
    <View style={styles.list}>
      {GRADES.map((grade, index) => {
        const isSelected = grade.id === selectedGrade;

        if (!grade.available) {
          return (
            <Animated.View key={grade.id} entering={FadeInDown.delay(index * 50).springify().damping(16)}>
              <View style={[styles.row, styles.rowDisabled]}>
                <ThemedText style={styles.rowTextDisabled}>{grade.label}</ThemedText>
                <ThemedText style={styles.badge}>Bientôt disponible</ThemedText>
              </View>
            </Animated.View>
          );
        }

        return (
          <Animated.View key={grade.id} entering={FadeInDown.delay(index * 50).springify().damping(16)}>
            <BouncyPressable
              style={[styles.row, isSelected && styles.rowSelected]}
              onPress={() => onSelect(grade.id)}>
              <ThemedText style={[styles.rowText, isSelected && styles.rowTextSelected]}>{grade.label}</ThemedText>
            </BouncyPressable>
          </Animated.View>
        );
      })}
    </View>
  );
}
