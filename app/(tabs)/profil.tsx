import { StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { router } from 'expo-router';
import { useAuth } from '../../context/auth';
import { useOnboarding } from '../../context/onboarding';
import { useSubscription } from '../../hooks/queries/use-subscription';
import { Button } from '../../components/ui/Button';
import { useAppTheme } from '../../hooks/use-app-theme';
import { GRADE_LABELS, SERIE_LABELS } from '../../constants/grades';
import { fonts, spacing } from '../../constants/theme';

export default function Profil() {
  const theme = useAppTheme();
  const { profile, signOut } = useAuth();
  const { reset } = useOnboarding();
  const { isPremium } = useSubscription();

  async function handleSignOut() {
    await signOut();
    reset();
    router.replace('/onboarding/welcome');
  }

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <View style={styles.content}>
        <Text style={[styles.title, { color: theme.text, fontFamily: fonts.display }]}>Profil</Text>

        <InfoRow label="Contact" value={profile?.email ?? profile?.phone ?? '—'} />
        <InfoRow label="Classe" value={profile?.grade ? GRADE_LABELS[profile.grade] : '—'} />
        {profile?.serie ? <InfoRow label="Série" value={SERIE_LABELS[profile.serie]} /> : null}
        <InfoRow label="Premium" value={isPremium ? 'Actif' : 'Inactif'} />

        <View style={{ marginTop: spacing.lg, gap: spacing.sm }}>
          {!isPremium ? (
            <Button label="Passer Premium" onPress={() => router.push('/subscription')} />
          ) : null}
          <Button label="Se déconnecter" variant="ghost" onPress={handleSignOut} />
        </View>
      </View>
    </SafeAreaView>
  );
}

function InfoRow({ label, value }: { label: string; value: string }) {
  const theme = useAppTheme();
  return (
    <View style={styles.row}>
      <Text style={[styles.rowLabel, { color: theme.textMuted }]}>{label}</Text>
      <Text style={[styles.rowValue, { color: theme.text }]}>{value}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1 },
  content: { padding: spacing.lg, gap: spacing.md },
  title: { fontSize: 24, marginBottom: spacing.sm },
  row: { flexDirection: 'row', justifyContent: 'space-between' },
  rowLabel: { fontFamily: fonts.body, fontSize: 14 },
  rowValue: { fontFamily: fonts.bodySemiBold, fontSize: 14 },
});
