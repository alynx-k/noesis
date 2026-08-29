import { StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { router } from 'expo-router';
import { Button } from '../../components/ui/Button';
import { useAppTheme } from '../../hooks/use-app-theme';
import { fonts, spacing } from '../../constants/theme';

export default function Welcome() {
  const theme = useAppTheme();

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <View style={styles.content}>
        <Text style={[styles.hero, { color: theme.text, fontFamily: fonts.displayBlack }]}>
          Noesis<Text style={{ color: theme.primary }}>.</Text>
        </Text>
        <Text style={[styles.subtitle, { color: theme.textMuted }]}>
          Révise ton programme de collège ou de lycée chaque jour, gagne de l'XP et grimpe dans ta ligue.
        </Text>
      </View>

      <View style={styles.footer}>
        <Button label="Commencer" onPress={() => router.push('/onboarding/classe')} />
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1, justifyContent: 'space-between' },
  content: {
    flex: 1,
    justifyContent: 'center',
    paddingHorizontal: spacing.lg,
    gap: spacing.md,
  },
  hero: {
    fontSize: 56,
    lineHeight: 60,
  },
  subtitle: {
    fontFamily: fonts.body,
    fontSize: 17,
    lineHeight: 24,
    maxWidth: 320,
  },
  footer: {
    padding: spacing.lg,
  },
});
