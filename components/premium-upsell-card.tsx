import { Link } from 'expo-router';
import { StyleSheet, View } from 'react-native';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ThemedText } from '@/components/themed-text';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

type PremiumUpsellCardProps = {
  message: string;
};

// Shown at the exact moment a free account hits its daily AI cap — exercise
// grading, homework correction, and test prep all return a distinct
// 'limitReached' status at 3/day free (see the access_status migrations) —
// the natural, non-annoying place to mention Premium, since it's relevant
// right when the limit actually bites rather than an unprompted interruption.
export function PremiumUpsellCard({ message }: PremiumUpsellCardProps) {
  const COLORS = useThemeColors();

  const styles = StyleSheet.create({
    card: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      alignItems: 'center',
      marginBottom: SPACING.element,
      ...cardBorder(COLORS),
    },
    iconBadge: {
      width: 48,
      height: 48,
      borderRadius: 24,
      backgroundColor: 'rgba(201,151,31,0.16)',
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: SPACING.tight,
    },
    message: {
      ...TYPOGRAPHY.body,
      color: COLORS.text,
      textAlign: 'center',
      marginBottom: SPACING.element,
    },
    button: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 6,
      backgroundColor: '#C9971F',
      borderRadius: PILL_RADIUS,
      paddingVertical: 12,
      paddingHorizontal: 20,
    },
    buttonText: {
      color: '#3A2A00',
      fontSize: 14,
      fontWeight: '700',
    },
  });

  return (
    <View style={styles.card}>
      <View style={styles.iconBadge}>
        <IconSymbol name="crown.fill" size={22} color="#C9971F" />
      </View>
      <ThemedText style={styles.message}>{message}</ThemedText>
      <Link href="/subscription" asChild>
        <BouncyPressable style={styles.button}>
          <IconSymbol name="crown.fill" size={14} color="#3A2A00" />
          <ThemedText style={styles.buttonText}>Découvrir Premium</ThemedText>
        </BouncyPressable>
      </Link>
    </View>
  );
}
