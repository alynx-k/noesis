import { router } from 'expo-router';
import { StyleSheet, View } from 'react-native';
import Animated, { FadeInDown } from 'react-native-reanimated';

import { ThemedText } from '@/components/themed-text';
import { Button } from '@/components/ui/button';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { Screen } from '@/components/ui/screen';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { NIVEAU_WAITLIST_LABELS } from '@/constants/onboarding';
import { useProfile } from '@/hooks/queries/use-profile';
import { useThemeColors } from '@/hooks/use-theme-colors';
import { supabase } from '@/lib/supabase';

// There's no course content for "Supérieur"/"Autre" yet — this is an honest
// dead end, not a fake "coming soon" that quietly leads nowhere: it records
// real intent (profiles.niveau_waitlist, see lib/onboarding.ts) and lets the
// student either wait or go back and pick a real tier instead.
export default function OnboardingWaitlistScreen() {
  const COLORS = useThemeColors();
  const profileQuery = useProfile();
  const tier = profileQuery.data?.niveauWaitlist;

  const styles = StyleSheet.create({
    content: {
      flex: 1,
      justifyContent: 'center',
      alignItems: 'center',
    },
    iconBadge: {
      width: 72,
      height: 72,
      borderRadius: RADIUS,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: SPACING.section,
    },
    title: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
      textAlign: 'center',
      marginBottom: SPACING.tight,
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      textAlign: 'center',
      marginBottom: SPACING.tight,
    },
    tierLabel: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.accent,
      textAlign: 'center',
    },
    footer: {
      width: '100%',
      gap: SPACING.tight,
    },
  });

  return (
    <Screen>
      <Animated.View entering={FadeInDown.duration(400)} style={styles.content}>
        <View style={styles.iconBadge}>
          <IconSymbol name="hourglass" size={32} color={COLORS.accent} />
        </View>
        <ThemedText style={styles.title}>C&apos;est pour bientôt !</ThemedText>
        <ThemedText style={styles.subtitle}>
          noesis n&apos;est pas encore disponible pour ce niveau. On t&apos;écrira dès que ce sera prêt.
        </ThemedText>
        {tier ? <ThemedText style={styles.tierLabel}>{NIVEAU_WAITLIST_LABELS[tier]}</ThemedText> : null}
      </Animated.View>
      <View style={styles.footer}>
        <Button label="Choisir Collège ou Lycée à la place" variant="secondary" onPress={() => router.replace('/onboarding/niveau')} />
        <Button label="Se déconnecter" variant="ghost" onPress={() => supabase.auth.signOut()} />
      </View>
    </Screen>
  );
}
