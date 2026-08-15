import { StyleSheet, View } from 'react-native';

import { ThemedText } from '@/components/themed-text';
import { SelectableCard } from '@/components/ui/selectable-card';
import { RADIUS } from '@/constants/design';
import { GRADES, GradeId } from '@/constants/grades';
import { useThemeColors } from '@/hooks/use-theme-colors';

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
    rowDisabled: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      backgroundColor: COLORS.lockedBackground,
      borderRadius: RADIUS,
      borderWidth: 2,
      borderColor: COLORS.lockedBackground,
      paddingVertical: 14,
      paddingHorizontal: 16,
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
      {GRADES.map((grade) => {
        if (!grade.available) {
          return (
            <View key={grade.id} style={styles.rowDisabled}>
              <ThemedText style={styles.rowTextDisabled}>{grade.label}</ThemedText>
              <ThemedText style={styles.badge}>Bientôt disponible</ThemedText>
            </View>
          );
        }

        return (
          <SelectableCard
            key={grade.id}
            label={grade.label}
            selected={grade.id === selectedGrade}
            onPress={() => onSelect(grade.id)}
          />
        );
      })}
    </View>
  );
}
