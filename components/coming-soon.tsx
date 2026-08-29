import { StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useAppTheme } from '../hooks/use-app-theme';
import { fonts, spacing } from '../constants/theme';

export function ComingSoon({ title }: { title: string }) {
  const theme = useAppTheme();
  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <Text style={[styles.title, { color: theme.text, fontFamily: fonts.display }]}>{title}</Text>
      <Text style={[styles.subtitle, { color: theme.textMuted }]}>Bientôt disponible.</Text>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, alignItems: 'center', justifyContent: 'center', gap: spacing.xs, padding: spacing.lg },
  title: { fontSize: 22 },
  subtitle: { fontFamily: fonts.body, fontSize: 15 },
});
