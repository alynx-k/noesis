import { StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useAuth } from '../../context/auth';
import { useAppTheme } from '../../hooks/use-app-theme';
import { GRADE_LABELS, SERIE_LABELS } from '../../constants/grades';
import { fonts, radius, spacing } from '../../constants/theme';

export default function Accueil() {
  const theme = useAppTheme();
  const { profile } = useAuth();

  const gradeLabel = profile?.grade ? GRADE_LABELS[profile.grade] : null;
  const serieLabel = profile?.serie ? SERIE_LABELS[profile.serie] : null;

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <View style={styles.content}>
        <Text style={[styles.greeting, { color: theme.text, fontFamily: fonts.display }]}>
          Salut{profile?.email ? `, ${profile.email.split('@')[0]}` : ''} 👋
        </Text>
        <Text style={[styles.subtitle, { color: theme.textMuted }]}>
          {gradeLabel ? `${gradeLabel}${serieLabel ? ` · ${serieLabel}` : ''}` : 'Profil en cours de configuration'}
        </Text>

        <View style={[styles.card, { backgroundColor: theme.card, borderColor: theme.border }]}>
          <Text style={[styles.cardTitle, { color: theme.text }]}>Ton parcours commence ici</Text>
          <Text style={[styles.cardBody, { color: theme.textMuted }]}>
            Les cours, les fiches de révision et ta ligue hebdomadaire arrivent dans les prochaines phases.
            Ton compte et ton profil sont déjà prêts à les recevoir.
          </Text>
        </View>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1 },
  content: { padding: spacing.lg, gap: spacing.sm },
  greeting: { fontSize: 24 },
  subtitle: { fontFamily: fonts.body, fontSize: 15, marginBottom: spacing.sm },
  card: {
    borderWidth: 1,
    borderRadius: radius.lg,
    padding: spacing.lg,
    gap: spacing.xs,
  },
  cardTitle: { fontFamily: fonts.bodySemiBold, fontSize: 16 },
  cardBody: { fontFamily: fonts.body, fontSize: 14, lineHeight: 20 },
});
