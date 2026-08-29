import { Pressable, StyleSheet, Text } from 'react-native';
import { useAppTheme } from '../../hooks/use-app-theme';
import { fonts, radius, spacing } from '../../constants/theme';

type Props = {
  label: string;
  selected: boolean;
  onPress: () => void;
};

export function SelectableCard({ label, selected, onPress }: Props) {
  const theme = useAppTheme();

  return (
    <Pressable
      accessibilityRole="button"
      accessibilityState={{ selected }}
      onPress={onPress}
      style={[
        styles.card,
        {
          backgroundColor: selected ? theme.primaryTint : theme.card,
          borderColor: selected ? theme.primary : theme.border,
        },
      ]}
    >
      <Text style={[styles.label, { color: selected ? theme.primary : theme.text }]}>{label}</Text>
    </Pressable>
  );
}

const styles = StyleSheet.create({
  card: {
    borderWidth: 1.5,
    borderRadius: radius.md,
    paddingVertical: spacing.md,
    paddingHorizontal: spacing.md,
  },
  label: {
    fontFamily: fonts.bodySemiBold,
    fontSize: 15,
  },
});
