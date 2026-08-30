import { ActivityIndicator, FlatList, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useMyLeagueBoard } from '../../hooks/queries/use-league';
import { TIER_LABELS } from '../../constants/leagues';
import { ErrorState } from '../../components/ui/ErrorState';
import { EmptyState } from '../../components/ui/EmptyState';
import { useAppTheme } from '../../hooks/use-app-theme';
import { fonts, radius, spacing } from '../../constants/theme';

const MONTHS = [
  'janvier', 'février', 'mars', 'avril', 'mai', 'juin',
  'juillet', 'août', 'septembre', 'octobre', 'novembre', 'décembre',
];

function formatWeekLabel(weekStart: string): string {
  const date = new Date(weekStart + 'T00:00:00');
  return `Semaine du ${date.getDate()} ${MONTHS[date.getMonth()]}`;
}

export default function Ligue() {
  const theme = useAppTheme();
  const board = useMyLeagueBoard();

  if (board.isLoading) {
    return (
      <SafeAreaView style={[styles.center, { backgroundColor: theme.background }]}>
        <ActivityIndicator color={theme.primary} />
      </SafeAreaView>
    );
  }

  if (board.isError) {
    return (
      <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
        <ErrorState onRetry={() => board.refetch()} />
      </SafeAreaView>
    );
  }

  const rows = board.data ?? [];

  if (rows.length === 0) {
    return (
      <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
        <Text style={[styles.title, { color: theme.text, fontFamily: fonts.display }]}>Ligue</Text>
        <EmptyState
          title="Pas encore de ligue active"
          message="Ta classe n'a pas encore de ligue cette semaine. Termine ton inscription ou reviens un peu plus tard."
        />
      </SafeAreaView>
    );
  }

  const tier = rows[0].tier;
  const weekLabel = formatWeekLabel(rows[0].week_start);

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <View style={styles.header}>
        <Text style={[styles.title, { color: theme.text, fontFamily: fonts.display }]}>
          Ligue {TIER_LABELS[tier]}
        </Text>
        <Text style={[styles.subtitle, { color: theme.textMuted }]}>{weekLabel}</Text>
      </View>

      <FlatList
        data={rows}
        keyExtractor={(item) => String(item.rank)}
        contentContainerStyle={styles.list}
        renderItem={({ item }) => (
          <View
            style={[
              styles.row,
              {
                backgroundColor: item.is_me ? theme.primaryTint : theme.card,
                borderColor: item.is_me ? theme.primary : theme.border,
              },
            ]}
          >
            <Text style={[styles.rank, { color: theme.textMuted }]}>{item.rank}</Text>
            <Text style={[styles.name, { color: theme.text }]}>{item.is_me ? 'Toi' : `Élève ${item.rank}`}</Text>
            <Text style={[styles.xp, { color: theme.primary }]}>{item.xp} XP</Text>
          </View>
        )}
      />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1 },
  center: { flex: 1, alignItems: 'center', justifyContent: 'center' },
  header: { padding: spacing.lg, paddingBottom: spacing.sm },
  title: { fontSize: 22 },
  subtitle: { fontFamily: fonts.body, fontSize: 13.5, marginTop: 2 },
  list: { paddingHorizontal: spacing.lg, paddingBottom: spacing.xl, gap: spacing.sm },
  row: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: spacing.sm,
    borderWidth: 1,
    borderRadius: radius.md,
    padding: spacing.md,
  },
  rank: { fontFamily: fonts.dataBold, fontSize: 14, width: 24 },
  name: { fontFamily: fonts.bodySemiBold, fontSize: 14.5, flex: 1 },
  xp: { fontFamily: fonts.dataBold, fontSize: 14 },
});
