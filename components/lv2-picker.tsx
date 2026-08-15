import { StyleSheet, View } from 'react-native';

import { SelectableCard } from '@/components/ui/selectable-card';
import { LV2_OPTIONS, Lv2Id } from '@/constants/lv2';

type Lv2PickerProps = {
  selected?: Lv2Id | null;
  onSelect: (lv2: Lv2Id) => void;
};

export function Lv2Picker({ selected, onSelect }: Lv2PickerProps) {
  return (
    <View style={styles.list}>
      {LV2_OPTIONS.map((option) => (
        <SelectableCard
          key={option.id}
          label={option.label}
          selected={option.id === selected}
          onPress={() => onSelect(option.id)}
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
