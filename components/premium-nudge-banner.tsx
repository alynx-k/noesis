import { LinearGradient } from 'expo-linear-gradient';
import { Link } from 'expo-router';
import { useEffect, useState } from 'react';
import { StyleSheet, View } from 'react-native';
import Animated, { FadeIn, FadeOut } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ThemedText } from '@/components/themed-text';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { GRADIENTS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useAccessStatus } from '@/hooks/queries/use-access-status';
import { shouldShowPremiumNudge, suppressPremiumNudge } from '@/lib/subscription';

// A softer, occasional reminder for free accounts — distinct from
// PremiumUpsellCard, which only shows at the exact moment a daily AI limit
// is hit. This one surfaces on Home at most once a week (see
// shouldShowPremiumNudge's cooldown), so it reads as a periodic nudge, not
// nagging on every visit. Renders nothing once dismissed, tapped through,
// or once the account is already Premium.
export function PremiumNudgeBanner() {
  const accessStatusQuery = useAccessStatus();
  const [visible, setVisible] = useState(false);

  useEffect(() => {
    if (accessStatusQuery.data !== 'gratuit_limite') {
      return;
    }
    shouldShowPremiumNudge().then(setVisible);
  }, [accessStatusQuery.data]);

  const handleDismiss = () => {
    setVisible(false);
    suppressPremiumNudge();
  };

  if (!visible) {
    return null;
  }

  const styles = StyleSheet.create({
    wrapper: {
      borderRadius: RADIUS,
      overflow: 'hidden',
      marginBottom: SPACING.element,
    },
    card: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      padding: SPACING.element,
      // Fallback so the card is never invisible if the gradient fails to paint.
      backgroundColor: '#C9971F',
    },
    linkRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      flex: 1,
    },
    iconBadge: {
      width: 36,
      height: 36,
      borderRadius: 18,
      backgroundColor: 'rgba(255,255,255,0.28)',
      alignItems: 'center',
      justifyContent: 'center',
    },
    text: {
      flex: 1,
    },
    title: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: '#3A2A00',
    },
    subtitle: {
      ...TYPOGRAPHY.caption,
      color: '#5C4300',
      marginTop: 2,
    },
    dismissButton: {
      padding: 4,
    },
  });

  return (
    <Animated.View entering={FadeIn.duration(250)} exiting={FadeOut.duration(200)} style={styles.wrapper}>
      <LinearGradient colors={GRADIENTS.gold} start={{ x: 0, y: 0 }} end={{ x: 1, y: 1 }} style={styles.card}>
        <Link href="/subscription" asChild>
          <BouncyPressable style={styles.linkRow} onPress={suppressPremiumNudge}>
            <View style={styles.iconBadge}>
              <IconSymbol name="crown.fill" size={18} color="#3A2A00" />
            </View>
            <View style={styles.text}>
              <ThemedText style={styles.title}>Passe Premium</ThemedText>
              <ThemedText style={styles.subtitle}>IA illimitée, sans limite quotidienne</ThemedText>
            </View>
          </BouncyPressable>
        </Link>
        <BouncyPressable style={styles.dismissButton} onPress={handleDismiss} hitSlop={8}>
          <IconSymbol name="xmark" size={16} color="#3A2A00" />
        </BouncyPressable>
      </LinearGradient>
    </Animated.View>
  );
}
