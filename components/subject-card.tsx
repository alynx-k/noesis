import { Pressable, StyleSheet, Text, View } from 'react-native';
import { useAppTheme } from '../hooks/use-app-theme';
import { fonts, radius, spacing } from '../constants/theme';

type Props = {
  name: string;
  completed: number;
  total: number;
  onPress: () => void;
};

export function SubjectCard({ name, completed, total, onPress }: Props) {
  const theme = useAppTheme();
  const progress = total > 0 ? completed / total : 0;

  return (
    <Pressable
      onPress={onPress}
      style={[styles.card, { backgroundColor: theme.card, borderColor: theme.border }]}
    >
      <View style={styles.header}>
        <Text style={[styles.name, { color: theme.text }]}>{name}</Text>
        <Text style={[styles.count, { color: theme.textMuted }]}>
          {completed}/{total}
        </Text>
      </View>
      <View style={[styles.track, { backgroundColor: theme.border }]}>
        <View style={[styles.fill, { width: `${progress * 100}%`, backgroundColor: theme.primary }]} />
      </View>
    </Pressable>
  );
}

const styles = StyleSheet.create({
  card: {
    borderWidth: 1,
    borderRadius: radius.md,
    padding: spacing.md,
    gap: spacing.xs,
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  name: {
    fontFamily: fonts.bodySemiBold,
    fontSize: 15,
  },
  count: {
    fontFamily: fonts.data,
    fontSize: 13,
  },
  track: {
    height: 5,
    borderRadius: radius.full,
    overflow: 'hidden',
  },
  fill: {
    height: '100%',
  },
});
