import { StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { Stack } from 'expo-router';
import { useThemeSettings, type ThemePreference } from '../context/theme';
import { SelectableCard } from '../components/ui/SelectableCard';
import { useAppTheme } from '../hooks/use-app-theme';
import { fonts, spacing } from '../constants/theme';

const OPTIONS: { value: ThemePreference; label: string }[] = [
  { value: 'system', label: 'Système' },
  { value: 'light', label: 'Clair' },
  { value: 'dark', label: 'Sombre' },
];

export default function Settings() {
  const theme = useAppTheme();
  const { preference, setPreference } = useThemeSettings();

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
