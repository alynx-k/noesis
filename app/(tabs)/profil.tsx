import { useState } from 'react';
import { Share, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { router } from 'expo-router';
import { useAuth } from '../../context/auth';
import { useOnboarding } from '../../context/onboarding';
import { useSubscription } from '../../hooks/queries/use-subscription';
import { useReferralStats, useRedeemReferralCode } from '../../hooks/queries/use-referral';
import { Button } from '../../components/ui/Button';
import { Input } from '../../components/ui/Input';
import { useAppTheme } from '../../hooks/use-app-theme';
import { GRADE_LABELS, SERIE_LABELS } from '../../constants/grades';
import { fonts, radius, spacing } from '../../constants/theme';

export default function Profil() {
  const theme = useAppTheme();
  const { profile, signOut } = useAuth();
  const { reset } = useOnboarding();
  const { isPremium } = useSubscription();
  const referralStats = useReferralStats();
  const redeemCode = useRedeemReferralCode();

  const [codeInput, setCodeInput] = useState('');
  const [redeemError, setRedeemError] = useState<string | null>(null);
  const [redeemSuccess, setRedeemSuccess] = useState<string | null>(null);

  async function handleSignOut() {
    await signOut();
    reset();
    router.replace('/onboarding/welcome');
  }

  async function handleShareCode() {
    if (!profile?.referral_code) return;
    await Share.share({
      message: `Rejoins-moi sur Noesis pour réviser et gagner des points ! Utilise mon code de parrainage ${profile.referral_code} à l'inscription : vous recevrez chacun 7 jours de Premium offerts.`,
    });
  }

  async function handleRedeemCode() {
    setRedeemError(null);
    setRedeemSuccess(null);
    try {
      const result = await redeemCode.mutateAsync(codeInput.trim());
      setRedeemSuccess(`Code validé ! +${result.granted_days} jours de Premium offerts.`);
      setCodeInput('');
    } catch (e) {
      setRedeemError(e instanceof Error ? e.message : 'Code invalide.');
    }
  }

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <View style={styles.content}>
        <Text style={[styles.title, { color: theme.text, fontFamily: fonts.display }]}>Profil</Text>

        <InfoRow label="Contact" value={profile?.email ?? profile?.phone ?? '—'} />
        <InfoRow label="Classe" value={profile?.grade ? GRADE_LABELS[profile.grade] : '—'} />
        {profile?.serie ? <InfoRow label="Série" value={SERIE_LABELS[profile.serie]} /> : null}
        <InfoRow label="Premium" value={isPremium ? 'Actif' : 'Inactif'} />

        <View style={[styles.card, { backgroundColor: theme.card, borderColor: theme.border }]}>
          <Text style={[styles.cardTitle, { color: theme.text }]}>Parrainage</Text>
          <Text style={[styles.cardBody, { color: theme.textMuted }]}>
            Partage ton code : toi et ton filleul recevez chacun 7 jours de Premium offerts.
          </Text>
          {profile?.referral_code ? (
            <View style={[styles.codeBox, { backgroundColor: theme.primaryTint }]}>
              <Text style={{ color: theme.primary, fontFamily: fonts.dataBold, fontSize: 18, letterSpacing: 2 }}>
                {profile.referral_code}
              </Text>
            </View>
          ) : null}
          <Button label="Partager mon code" variant="secondary" onPress={handleShareCode} />
          {(referralStats.data?.referredCount ?? 0) > 0 ? (
            <Text style={[styles.referredCount, { color: theme.textMuted }]}>
              {referralStats.data!.referredCount} filleul{referralStats.data!.referredCount > 1 ? 's' : ''} parrainé
              {referralStats.data!.referredCount > 1 ? 's' : ''}
            </Text>
          ) : null}

          {referralStats.data && !referralStats.data.hasRedeemed ? (
            <View style={{ marginTop: spacing.md, gap: spacing.sm }}>
              <Input
                label="Un code de parrainage ?"
                placeholder="Ex : AB12CD"
                autoCapitalize="characters"
                value={codeInput}
                onChangeText={setCodeInput}
                errorMessage={redeemError ?? undefined}
              />
              {redeemSuccess ? (
                <Text style={{ color: theme.success, fontFamily: fonts.bodySemiBold, fontSize: 13 }}>
                  {redeemSuccess}
                </Text>
              ) : null}
              <Button
                label="Valider le code"
                variant="secondary"
                disabled={!codeInput.trim()}
                loading={redeemCode.isPending}
                onPress={handleRedeemCode}
              />
            </View>
          ) : null}
        </View>

        <View style={{ marginTop: spacing.lg, gap: spacing.sm }}>
          {!isPremium ? (
            <Button label="Passer Premium" onPress={() => router.push('/subscription')} />
          ) : null}
          <Button label="Réglages" variant="secondary" onPress={() => router.push('/settings')} />
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
  card: { borderWidth: 1, borderRadius: radius.md, padding: spacing.md, gap: spacing.sm, marginTop: spacing.md },
  cardTitle: { fontFamily: fonts.bodySemiBold, fontSize: 15 },
  cardBody: { fontFamily: fonts.body, fontSize: 13.5, lineHeight: 19 },
  codeBox: { borderRadius: radius.sm, paddingVertical: spacing.sm, alignItems: 'center' },
  referredCount: { fontFamily: fonts.body, fontSize: 12.5, textAlign: 'center' },
});
