import Ionicons from '@expo/vector-icons/Ionicons';
import { StyleSheet, View } from 'react-native';
import Animated, { FadeIn } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { Button } from '@/components/ui/button';
import { ThemedText } from '@/components/themed-text';
import { PILL_RADIUS, SPACING, STATUS_COLORS, TYPOGRAPHY } from '@/constants/design';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

type ErrorStateProps = {
  title?: string;
  description?: string;
  onRetry?: () => void;
  // Most callers pass onRetry for an actual retry (refetch), where
  // "Réessayer" is correct. A few use it for a terminal state with nothing
  // to retry (e.g. a missing route param) where the action is really "go
  // back" — this lets those override the label instead of misleadingly
  // reading "Réessayer" on a button that navigates away.
  retryLabel?: string;
};

// Full-screen replacement for a failed initial load — pairs with RetryBanner
// below for the "stale data still visible, background refetch failed" case.
export function ErrorState({
  title = 'Une erreur est survenue',
  description,
  onRetry,
  retryLabel = 'Réessayer',
}: ErrorStateProps) {
  const COLORS = useThemeColors();

  const styles = StyleSheet.create({
    container: {
      alignItems: 'center',
      paddingVertical: SPACING.section,
      paddingHorizontal: SPACING.element,
      gap: 8,
    },
    iconBadge: {
      width: 56,
      height: 56,
      borderRadius: 28,
      backgroundColor: `${STATUS_COLORS.error}1A`,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: 4,
    },
    title: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      textAlign: 'center',
    },
    description: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
      textAlign: 'center',
    },
    action: {
      marginTop: SPACING.tight,
    },
  });

  return (
    <Animated.View style={styles.container} entering={FadeIn.duration(300)}>
      <View style={styles.iconBadge}>
        <Ionicons name="alert-circle-outline" size={26} color={STATUS_COLORS.error} />
      </View>
      <ThemedText style={styles.title}>{title}</ThemedText>
      {description ? <ThemedText style={styles.description}>{description}</ThemedText> : null}
      {onRetry ? <Button label={retryLabel} onPress={onRetry} variant="secondary" style={styles.action} /> : null}
    </Animated.View>
  );
}

type RetryBannerProps = {
  message?: string;
  onRetry: () => void;
};

// Inline banner for when a background refetch fails but cached data is still
// shown — never blanks the screen, just flags that what's on screen may be stale.
export function RetryBanner({ message = 'Impossible de mettre à jour.', onRetry }: RetryBannerProps) {
  const COLORS = useThemeColors();

  const styles = StyleSheet.create({
    banner: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      gap: SPACING.tight,
      backgroundColor: `${STATUS_COLORS.warning}1A`,
      borderRadius: 12,
      paddingVertical: 10,
      paddingHorizontal: 14,
      marginBottom: SPACING.element,
      ...cardBorder(COLORS),
      borderColor: `${STATUS_COLORS.warning}55`,
    },
    text: {
      ...TYPOGRAPHY.caption,
      color: COLORS.text,
      flex: 1,
    },
    retry: {
      borderRadius: PILL_RADIUS,
      paddingVertical: 6,
      paddingHorizontal: 12,
      backgroundColor: STATUS_COLORS.warning,
    },
    retryText: {
      fontSize: 12,
      fontWeight: '700',
      color: '#FFFFFF',
    },
  });

  return (
    <Animated.View style={styles.banner} entering={FadeIn.duration(250)}>
      <Ionicons name="warning-outline" size={16} color={STATUS_COLORS.warning} />
      <ThemedText style={styles.text}>{message}</ThemedText>
      <BouncyPressable style={styles.retry} onPress={onRetry}>
        <ThemedText style={styles.retryText}>Réessayer</ThemedText>
      </BouncyPressable>
    </Animated.View>
  );
}
