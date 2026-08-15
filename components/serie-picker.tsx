import { StyleSheet, View } from 'react-native';

import { SelectableCard } from '@/components/ui/selectable-card';
import { GradeId, SERIES_BY_GRADE, SeriesId } from '@/constants/grades';

type SeriePickerProps = {
  grade: GradeId;
  selectedSerie?: SeriesId | null;
  onSelect: (serie: SeriesId) => void;
};

export function SeriePicker({ grade, selectedSerie, onSelect }: SeriePickerProps) {
  const series = SERIES_BY_GRADE[grade] ?? [];

  return (
    <View style={styles.list}>
      {series.map((serie) => (
        <SelectableCard
          key={serie.id}
          label={serie.label}
          selected={serie.id === selectedSerie}
          onPress={() => onSelect(serie.id)}
        />
      ))}
    </View>
  );
}

const styles = StyleSheet.create({
  list: {
    gap: 10,
  },
});
