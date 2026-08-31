import { Alert, Linking, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Stack } from 'expo-router';
import { useThemeSettings, type ThemePreference } from '../context/theme';
import { SelectableCard } from '../components/ui/SelectableCard';
import { Button } from '../components/ui/Button';
import { useAppTheme } from '../hooks/use-app-theme';
import { useAuth } from '../context/auth';
import { fonts, spacing } from '../constants/theme';
import { SUPPORT_WHATSAPP_NUMBER } from '../constants/support';

const OPTIONS: { value: ThemePreference; label: string }[] = [
  { value: 'system', label: 'Système' },
  { value: 'light', label: 'Clair' },
  { value: 'dark', label: 'Sombre' },
];

export default function Settings() {
  const theme = useAppTheme();
  const { preference, setPreference } = useThemeSettings();
  const { profile } = useAuth();

  async function handleContactSupport() {
    const contact = profile?.email ?? profile?.phone ?? 'inconnu';
    const message = `Bonjour, je suis élève sur Noesis (contact : ${contact}). J'ai un problème / avis à signaler :`;
    const url = `https://wa.me/${SUPPORT_WHATSAPP_NUMBER}?text=${encodeURIComponent(message)}`;
    const canOpen = await Linking.canOpenURL(url);
    if (!canOpen) {
      Alert.alert(
        'WhatsApp non disponible',
        "WhatsApp n'est pas installé sur cet appareil. Installe WhatsApp pour contacter le support."
      );
      return;
    }
    await Linking.openURL(url);
  }

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <Stack.Screen
        options={{
          headerShown: true,
          title: 'Réglages',
          headerStyle: { backgroundColor: theme.background },
          headerTintColor: theme.text,
        }}
      />
      <View style={styles.content}>
        <Text style={[styles.sectionLabel, { color: theme.textMuted }]}>Apparence</Text>
        <View style={styles.options}>
          {OPTIONS.map((option) => (
            <SelectableCard
              key={option.value}
              label={option.label}
              selected={preference === option.value}
              onPress={() => setPreference(option.value)}
            />
          ))}
        </View>

        <Text style={[styles.sectionLabel, { color: theme.textMuted, marginTop: spacing.lg }]}>Support</Text>
        <Button label="Signaler un problème / donner un avis" variant="secondary" onPress={handleContactSupport} />
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1 },
  content: { padding: spacing.lg, gap: spacing.sm },
  sectionLabel: {
    fontFamily: fonts.bodySemiBold,
    fontSize: 13,
    textTransform: 'uppercase',
    letterSpacing: 0.5,
    marginBottom: spacing.xs,
  },
  options: { gap: spacing.sm },
});
