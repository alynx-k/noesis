import { Pressable, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { router } from 'expo-router';
import { useAuth } from '../../context/auth';
import { useStreak } from '../../hooks/queries/use-streak';
import { useAppTheme } from '../../hooks/use-app-theme';
import { GRADE_LABELS, SERIE_LABELS } from '../../constants/grades';
import { fonts, radius, spacing } from '../../constants/theme';

export default function Accueil() {
  const theme = useAppTheme();
  const { profile } = useAuth();
  const streak = useStreak();

  const gradeLabel = profile?.grade ? GRADE_LABELS[profile.grade] : null;
  const serieLabel = profile?.serie ? SERIE_LABELS[profile.serie] : null;
  const currentStreak = streak.data?.current_streak ?? 0;

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <View style={styles.content}>
        <View style={styles.headerRow}>
          <View>
            <Text style={[styles.greeting, { color: theme.text, fontFamily: fonts.display }]}>
              Salut{profile?.email ? `, ${profile.email.split('@')[0]}` : ''} 👋
            </Text>
            <Text style={[styles.subtitle, { color: theme.textMuted }]}>
              {gradeLabel ? `${gradeLabel}${serieLabel ? ` · ${serieLabel}` : ''}` : 'Profil en cours de configuration'}
            </Text>
          </View>
          <View style={[styles.streakChip, { backgroundColor: theme.primaryTint }]}>
            <Text style={{ color: theme.primary, fontFamily: fonts.dataBold, fontSize: 14 }}>
              🔥 {currentStreak}
            </Text>
          </View>
        </View>

        <Pressable
          onPress={() => router.push('/cours')}
          style={[styles.card, { backgroundColor: theme.card, borderColor: theme.border }]}
        >
          <Text style={[styles.cardTitle, { color: theme.text }]}>Reprendre mes révisions</Text>
          <Text style={[styles.cardBody, { color: theme.textMuted }]}>
            {currentStreak > 0
              ? `Ta série est à ${currentStreak} jour${currentStreak > 1 ? 's' : ''}. Termine une leçon aujourd'hui pour la continuer.`
              : "Termine une leçon aujourd'hui pour démarrer ta série."}
          </Text>
        </Pressable>

        <Pressable
          onPress={() => router.push('/ai-chat')}
          style={[styles.card, { backgroundColor: theme.card, borderColor: theme.border }]}
        >
          <Text style={[styles.cardTitle, { color: theme.text }]}>Demander au tuteur IA</Text>
          <Text style={[styles.cardBody, { color: theme.textMuted }]}>
            Une question sur une leçon ou un exercice ? Discute avec le tuteur IA.
          </Text>
        </Pressable>

        <Pressable
          onPress={() => router.push('/focus-session')}
          style={[styles.card, { backgroundColor: theme.card, borderColor: theme.border }]}
        >
          <Text style={[styles.cardTitle, { color: theme.text }]}>Lancer une session de concentration</Text>
          <Text style={[styles.cardBody, { color: theme.textMuted }]}>
            Révise sans interruption et gagne de l'XP à la fin.
          </Text>
        </Pressable>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1 },
  content: { padding: spacing.lg, gap: spacing.md },
  headerRow: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'flex-start' },
  greeting: { fontSize: 24 },
  subtitle: { fontFamily: fonts.body, fontSize: 15, marginTop: 2 },
  streakChip: {
    borderRadius: radius.full,
    paddingHorizontal: spacing.sm + 2,
    paddingVertical: spacing.xs + 2,
  },
  card: {
    borderWidth: 1,
    borderRadius: radius.lg,
    padding: spacing.lg,
    gap: spacing.xs,
  },
  cardTitle: { fontFamily: fonts.bodySemiBold, fontSize: 16 },
  cardBody: { fontFamily: fonts.body, fontSize: 14, lineHeight: 20 },
});
