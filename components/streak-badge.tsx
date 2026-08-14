import Ionicons from '@expo/vector-icons/Ionicons';
import { StyleSheet, View } from 'react-native';

import { ThemedText } from '@/components/themed-text';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { Skeleton } from '@/components/ui/skeleton';
import { PILL_RADIUS } from '@/constants/design';
import { useThemeColors } from '@/hooks/use-theme-colors';

type StreakBadgeProps = {
  streak: number;
  isPending?: boolean;
  isError?: boolean;
};

// The one streak pill shown everywhere on Home — the widget preview's
// header and the "Série de révision" card both render this exact
// component, flat flame icon and all, rather than each carrying its own
// take on "show the streak" (the card used to wrap a 3D/gradient
// FlameIcon in a violet gradient pill; that's gone in favor of this).
export function StreakBadge({ streak, isPending = false, isError = false }: StreakBadgeProps) {
  const COLORS = useThemeColors();

  const styles = StyleSheet.create({
    pill: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 6,
      borderRadius: PILL_RADIUS,
      paddingVertical: 4,
      paddingHorizontal: 12,
      backgroundColor: COLORS.lockedBackground,
    },
    text: {
      fontSize: 13,
      fontWeight: '700',
      color: COLORS.text,
    },
  });

  if (isPending) {
    return <Skeleton width={56} height={26} radius={PILL_RADIUS} />;
  }

  return (
    <View style={styles.pill}>
      {isError ? (
        <Ionicons name="warning" size={14} color={COLORS.text} />
      ) : (
        <IconSymbol name="flame.fill" size={16} color="#FF7A30" />
      )}
      <ThemedText style={styles.text}>{isError ? '—' : streak}</ThemedText>
    </View>
  );
}
