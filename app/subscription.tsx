import { useEffect, useRef, useState } from 'react';
import { Linking, ScrollView, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Stack, router } from 'expo-router';
import { Button } from '../components/ui/Button';
import { Input } from '../components/ui/Input';
import { useAppTheme } from '../hooks/use-app-theme';
import { useSubscription, useStartCheckout } from '../hooks/queries/use-subscription';
import { fonts, radius, spacing } from '../constants/theme';

const BENEFITS = [
  'Tuteur IA illimité : chat, correction et préparation de devoirs',
  'Exercices corrigés sur toutes tes leçons',
  "Création de decks de flashcards personnalisés",
];

const PRICE_LABEL = '2 000 FCFA / mois';

type MobileMoneyProvider = 'wave' | 'mtn' | 'orange';

const PROVIDERS: { id: MobileMoneyProvider; label: string }[] = [
  { id: 'wave', label: 'Wave' },
  { id: 'mtn', label: 'MTN Mobile Money' },
  { id: 'orange', label: 'Orange Money' },
];

export default function Subscription() {
  const theme = useAppTheme();
  const { isPremium, subscription, refetch } = useSubscription();
  const startCheckout = useStartCheckout();
  const [selected, setSelected] = useState<MobileMoneyProvider | null>(null);
  const [phone, setPhone] = useState('');
  const [error, setError] = useState<string | null>(null);
  const [waitingForPush, setWaitingForPush] = useState(false);
  const pollRef = useRef<ReturnType<typeof setInterval> | null>(null);

  useEffect(() => {
    return () => {
      if (pollRef.current) clearInterval(pollRef.current);
    };
  }, []);

  useEffect(() => {
    if (waitingForPush && isPremium) {
      if (pollRef.current) clearInterval(pollRef.current);
      setWaitingForPush(false);
      router.back();
    }
  }, [waitingForPush, isPremium]);

  async function handlePay() {
    if (!selected) return;
    setError(null);

    if (selected === 'mtn' && phone.replace(/\D/g, '').length < 8) {
      setError('Entre un numéro de téléphone Mobile Money valide.');
      return;
    }

    try {
      const result = await startCheckout.mutateAsync({
        provider: selected,
        phone: selected === 'mtn' ? `+225${phone.replace(/\D/g, '')}` : undefined,
      });

      if (result.type === 'redirect') {
        await Linking.openURL(result.checkoutUrl);
      } else {
        setWaitingForPush(true);
        pollRef.current = setInterval(() => refetch(), 5000);
      }
    } catch (e) {
      setError(e instanceof Error ? e.message : "Le paiement n'a pas pu être initié.");
    }
  }

  if (isPremium && subscription) {
    return (
      <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
        <Stack.Screen options={{ headerShown: true, title: 'Premium' }} />
        <View style={styles.content}>
          <Text style={[styles.title, { color: theme.text, fontFamily: fonts.display }]}>
            Tu es Premium ✓
          </Text>
          <Text style={[styles.subtitle, { color: theme.textMuted }]}>
            Actif jusqu'au {new Date(subscription.current_period_end).toLocaleDateString('fr-FR')}.
          </Text>
        </View>
      </SafeAreaView>
    );
  }

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <Stack.Screen options={{ headerShown: true, title: 'Premium' }} />
      <ScrollView contentContainerStyle={styles.content}>
        <Text style={[styles.title, { color: theme.text, fontFamily: fonts.display }]}>Passe Premium</Text>
        <Text style={[styles.price, { color: theme.primary }]}>{PRICE_LABEL}</Text>

        <View style={styles.benefits}>
          {BENEFITS.map((b) => (
            <View key={b} style={styles.benefitRow}>
              <Text style={{ color: theme.primary, fontFamily: fonts.bodySemiBold }}>✓</Text>
              <Text style={[styles.benefitText, { color: theme.text }]}>{b}</Text>
            </View>
          ))}
        </View>

        <Text style={[styles.sectionLabel, { color: theme.textMuted }]}>Moyen de paiement</Text>
        <View style={styles.providerRow}>
          {PROVIDERS.map((p) => (
            <Text
              key={p.id}
              onPress={() => {
                setSelected(p.id);
                setError(null);
              }}
              style={[
                styles.providerChip,
                {
                  borderColor: selected === p.id ? theme.primary : theme.border,
                  backgroundColor: selected === p.id ? theme.primaryTint : theme.card,
                  color: selected === p.id ? theme.primary : theme.text,
                },
              ]}
            >
              {p.label}
            </Text>
          ))}
        </View>

        {selected === 'mtn' ? (
          <Input
            placeholder="07 58 XX XX XX"
            keyboardType="phone-pad"
            value={phone}
            onChangeText={setPhone}
          />
        ) : null}

        {waitingForPush ? (
          <Text style={[styles.pushMessage, { color: theme.textMuted }]}>
            Valide la demande de paiement sur ton téléphone. Cette page se mettra à jour automatiquement.
          </Text>
        ) : null}

        {error ? <Text style={{ color: theme.error, fontSize: 13 }}>{error}</Text> : null}
      </ScrollView>

      <View style={styles.footer}>
        <Button
          label={waitingForPush ? 'En attente de validation…' : 'Payer'}
          disabled={!selected || waitingForPush}
          loading={startCheckout.isPending}
          onPress={handlePay}
        />
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1 },
  content: { padding: spacing.lg, gap: spacing.sm },
  title: { fontSize: 26 },
  subtitle: { fontFamily: fonts.body, fontSize: 15 },
  price: { fontFamily: fonts.dataBold, fontSize: 20, marginBottom: spacing.sm },
  benefits: { gap: spacing.sm, marginBottom: spacing.md },
  benefitRow: { flexDirection: 'row', gap: spacing.sm, alignItems: 'flex-start' },
  benefitText: { flex: 1, fontFamily: fonts.body, fontSize: 15, lineHeight: 21 },
  sectionLabel: {
    fontFamily: fonts.bodySemiBold,
    fontSize: 13,
    textTransform: 'uppercase',
    letterSpacing: 0.5,
    marginTop: spacing.sm,
  },
  providerRow: { flexDirection: 'row', flexWrap: 'wrap', gap: spacing.sm },
  providerChip: {
    borderWidth: 1.5,
    borderRadius: radius.full,
    paddingVertical: spacing.sm,
    paddingHorizontal: spacing.md,
    fontFamily: fonts.bodySemiBold,
    fontSize: 14,
    overflow: 'hidden',
  },
  pushMessage: { fontFamily: fonts.body, fontSize: 14, marginTop: spacing.sm },
  footer: { padding: spacing.lg },
});
