import { useState } from 'react';
import { Alert, Linking, Platform, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { router, Stack } from 'expo-router';
import { useFocusSession } from '../context/focus-session';
import { FOCUS_SESSION_DURATIONS } from '../hooks/queries/use-focus-session';
import { SelectableCard } from '../components/ui/SelectableCard';
import { Button } from '../components/ui/Button';
import { useAppTheme } from '../hooks/use-app-theme';
import { fonts, radius, spacing } from '../constants/theme';

async function openNotificationSettings() {
  if (Platform.OS === 'android') {
    try {
      await Linking.sendIntent('android.settings.ZEN_MODE_SETTINGS');
      return;
    } catch {
      // certains fabricants n'exposent pas cet intent — repli sur les réglages génériques
    }
  }
  await Linking.openSettings();
}

export default function FocusSession() {
  const theme = useAppTheme();
  const { phase, durationMinutes, remainingMs, xpAwarded, startSession, abandonSession, dismissSummary } =
    useFocusSession();
  const [selectedDuration, setSelectedDuration] = useState<number>(FOCUS_SESSION_DURATIONS[1]);

  function handleAbandon() {
    Alert.alert('Abandonner la session ?', "Tu ne gagneras pas d'XP pour cette session.", [
      { text: 'Continuer la session', style: 'cancel' },
      { text: 'Abandonner', style: 'destructive', onPress: abandonSession },
    ]);
  }

  const headerOptions = {
    headerShown: true,
    title: 'Focus session',
    headerStyle: { backgroundColor: theme.background },
    headerTintColor: theme.text,
  } as const;

  if (phase === 'running') {
    const totalSeconds = Math.ceil(remainingMs / 1000);
    const mm = String(Math.floor(totalSeconds / 60)).padStart(2, '0');
    const ss = String(totalSeconds % 60).padStart(2, '0');
    return (
      <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
        <Stack.Screen options={headerOptions} />
        <View style={styles.center}>
          <Text style={[styles.timer, { color: theme.text, fontFamily: fonts.display }]}>
            {mm}:{ss}
          </Text>
          <Text style={[styles.timerHint, { color: theme.textMuted }]}>
            Tu peux naviguer dans l'app (leçons, exercices...) sans interrompre la session.
          </Text>
          <View style={{ marginTop: spacing.xl, gap: spacing.sm }}>
            <Button label="Continuer dans l'app" onPress={() => router.push('/cours')} />
            <Button label="Abandonner la session" variant="ghost" onPress={handleAbandon} />
          </View>
        </View>
      </SafeAreaView>
    );
  }

  if (phase === 'summary') {
    return (
      <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
        <Stack.Screen options={headerOptions} />
        <View style={styles.center}>
          <Text style={[styles.summaryTitle, { color: theme.text, fontFamily: fonts.display }]}>
            Session terminée !
          </Text>
          <Text style={{ color: theme.textMuted, fontFamily: fonts.body, fontSize: 15, marginTop: spacing.xs }}>
            {durationMinutes} minutes de concentration
          </Text>
          <View style={[styles.xpBanner, { backgroundColor: theme.primaryTint }]}>
            <Text style={{ color: theme.primary, fontFamily: fonts.bodySemiBold }}>+{xpAwarded} XP gagné !</Text>
          </View>
          <View style={{ marginTop: spacing.lg }}>
            <Button label="Terminer" onPress={dismissSummary} />
          </View>
        </View>
      </SafeAreaView>
    );
  }

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <Stack.Screen options={headerOptions} />
      <View style={styles.content}>
        <View style={[styles.card, { backgroundColor: theme.card, borderColor: theme.border }]}>
          <Text style={[styles.cardTitle, { color: theme.text }]}>
            {Platform.OS === 'ios' ? 'Active un Focus dédié' : 'Active Ne pas déranger'}
          </Text>
          <Text style={[styles.cardBody, { color: theme.textMuted }]}>
            {Platform.OS === 'ios'
              ? 'Noesis ne peut pas activer un Focus à ta place sur iOS. Va dans Réglages > Focus, crée ou choisis un Focus, puis autorise les notifications de ton choix pendant ta session.'
              : "Pour ne recevoir aucune notification pendant ta session, active le mode Ne pas déranger avant de commencer."}
          </Text>
          <View style={{ marginTop: spacing.sm }}>
            <Button label="Ouvrir les réglages" variant="secondary" onPress={openNotificationSettings} />
          </View>
        </View>

        <Text style={[styles.sectionLabel, { color: theme.textMuted }]}>Durée de la session</Text>
        <View style={styles.durationGrid}>
          {FOCUS_SESSION_DURATIONS.map((d) => (
            <View key={d} style={styles.durationItem}>
              <SelectableCard label={`${d} min`} selected={selectedDuration === d} onPress={() => setSelectedDuration(d)} />
            </View>
          ))}
        </View>

        <View style={{ marginTop: spacing.md }}>
          <Button label="Commencer" onPress={() => startSession(selectedDuration)} />
        </View>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1 },
  content: { flex: 1, padding: spacing.lg, gap: spacing.md },
  center: { flex: 1, alignItems: 'center', justifyContent: 'center', padding: spacing.lg },
  card: { borderWidth: 1, borderRadius: radius.md, padding: spacing.md },
  cardTitle: { fontFamily: fonts.bodySemiBold, fontSize: 15, marginBottom: spacing.xs },
  cardBody: { fontFamily: fonts.body, fontSize: 13.5, lineHeight: 19 },
  sectionLabel: {
    fontFamily: fonts.bodySemiBold,
    fontSize: 13,
    textTransform: 'uppercase',
    letterSpacing: 0.5,
    marginTop: spacing.sm,
  },
  durationGrid: { flexDirection: 'row', flexWrap: 'wrap', gap: spacing.sm },
  durationItem: { width: '47%' },
  timer: { fontSize: 64 },
  timerHint: { fontFamily: fonts.body, fontSize: 14, marginTop: spacing.sm, textAlign: 'center' },
  summaryTitle: { fontSize: 24 },
  xpBanner: { borderRadius: 12, padding: spacing.md, marginTop: spacing.lg },
});
