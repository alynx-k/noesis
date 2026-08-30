import { Pressable, StyleSheet, Text } from 'react-native';
import { router, usePathname } from 'expo-router';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import { useFocusSession } from '../context/focus-session';
import { useAppTheme } from '../hooks/use-app-theme';
import { fonts, radius, spacing } from '../constants/theme';

// Bandeau flottant visible sur tout le reste de l'app pendant qu'une session
// de concentration tourne en arrière-plan (l'élève peut naviguer ailleurs
// pour faire une leçon/exercice sans perdre le minuteur), et quand elle vient
// de se terminer pour qu'il puisse revenir voir son résumé XP.
export function FocusSessionBanner() {
  const theme = useAppTheme();
  const insets = useSafeAreaInsets();
  const pathname = usePathname();
  const { phase, remainingMs } = useFocusSession();

  if (phase === 'idle' || pathname === '/focus-session') return null;

  const totalSeconds = Math.ceil(remainingMs / 1000);
  const mm = String(Math.floor(totalSeconds / 60)).padStart(2, '0');
  const ss = String(totalSeconds % 60).padStart(2, '0');

  return (
    <Pressable
      onPress={() => router.push('/focus-session')}
      style={[
        styles.banner,
        { backgroundColor: theme.primary, bottom: insets.bottom + spacing.md },
      ]}
    >
      <Text style={styles.text}>
        {phase === 'running' ? `🎯 Concentration en cours — ${mm}:${ss}` : '🎉 Session terminée — voir le résumé'}
      </Text>
    </Pressable>
  );
}

const styles = StyleSheet.create({
  banner: {
    position: 'absolute',
    left: spacing.lg,
    right: spacing.lg,
    borderRadius: radius.full,
    paddingVertical: spacing.sm + 2,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.2,
    shadowRadius: 6,
    elevation: 4,
  },
  text: {
    color: '#FFFFFF',
    fontFamily: fonts.bodySemiBold,
    fontSize: 13.5,
  },
});
