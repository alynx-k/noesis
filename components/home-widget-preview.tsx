import { router } from 'expo-router';
import { useEffect, useState } from 'react';
import { StyleSheet, View } from 'react-native';
import Animated, {
  cancelAnimation,
  Easing,
  useAnimatedStyle,
  useSharedValue,
  withRepeat,
  withSequence,
  withTiming,
} from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { StreakBadge } from '@/components/streak-badge';
import { ThemedText } from '@/components/themed-text';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { Skeleton } from '@/components/ui/skeleton';
import { ELEVATION, HALO_COLORS, PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useWidgetData } from '@/hooks/queries/use-widget-data';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { getMillisecondsUntilMidnight, WidgetState } from '@/lib/home-widget';

// NEW's title is personalized with the prénom, so it's built at render
// time (see HomeWidgetPreview) rather than living in this static map.
const STATE_COPY: Partial<Record<WidgetState, { title: string; subtitle: string }>> = {
  COMPLETED: { title: 'Bien joué !', subtitle: 'Série sauvée pour aujourd’hui.' },
  MORNING: { title: 'On commence ?', subtitle: 'Quelques minutes suffisent.' },
  AFTERNOON: { title: 'Toujours là ?', subtitle: 'Ta session du jour attend.' },
  NIGHT_DANGER: { title: 'Ça urge.', subtitle: 'Ta série est en jeu.' },
  BROKEN: { title: 'Série perdue.', subtitle: 'On en recommence une ?' },
};

const EYE_COLOR: Record<WidgetState, string> = {
  COMPLETED: HALO_COLORS.gold,
  MORNING: '#8FE3A8',
  AFTERNOON: HALO_COLORS.violet,
  NIGHT_DANGER: '#FF5A4E',
  BROKEN: 'rgba(255,255,255,0.32)',
  NEW: HALO_COLORS.gold,
};

const PANTHER_SIZE = 92;

// A code-drawn stand-in for the black panther mascot (no illustrated asset
// exists in the app yet) — dark silhouette, pointed ears, glowing eyes
// whose color and motion change with the widget state: a light bouncy pop
// for COMPLETED, a slow alert tilt for MORNING, a calm breathing scale for
// AFTERNOON, a fast nervous shake for NIGHT_DANGER, a slow ghostly drift
// for BROKEN. Continuous ambient motion tied to state, not a mount-time
// entrance effect — same discipline as the login screen's rotating ring
// and the AI chat's ThinkingPill.
export function MascotPanther({ state }: { state: WidgetState }) {
  const motion = useSharedValue(0);

  useEffect(() => {
    switch (state) {
      case 'COMPLETED':
      case 'NEW':
        motion.value = withRepeat(
          withSequence(
            withTiming(1, { duration: 260, easing: Easing.out(Easing.quad) }),
            withTiming(0, { duration: 260, easing: Easing.in(Easing.quad) }),
          ),
          -1,
          true,
        );
        break;
      case 'NIGHT_DANGER':
        motion.value = withRepeat(
          withSequence(withTiming(1, { duration: 90 }), withTiming(-1, { duration: 90 })),
          -1,
          true,
        );
        break;
      case 'BROKEN':
        motion.value = withRepeat(withTiming(1, { duration: 1800, easing: Easing.inOut(Easing.ease) }), -1, true);
        break;
      default:
        motion.value = withRepeat(withTiming(1, { duration: 1400, easing: Easing.inOut(Easing.ease) }), -1, true);
    }
    // Cancel the infinite loop on unmount — see components/ui/skeleton.tsx
    // for why (a stray post-unmount style write on web throws a
    // CSSStyleDeclaration error). This mascot lives on Home, which
    // unmounts on every tab/screen navigation away from it — exactly the
    // condition that triggers this.
    return () => cancelAnimation(motion);
  }, [state, motion]);

  const bodyStyle = useAnimatedStyle(() => {
    if (state === 'COMPLETED' || state === 'NEW') {
      return { transform: [{ translateY: -motion.value * 6 }, { scale: 1 + motion.value * 0.04 }] };
    }
    if (state === 'NIGHT_DANGER') {
      return { transform: [{ rotate: `${motion.value * 4}deg` }] };
    }
    if (state === 'BROKEN') {
      return { transform: [{ translateY: motion.value * 5 }], opacity: 0.55 + motion.value * 0.1 };
    }
    return { transform: [{ scale: 1 + motion.value * 0.02 }] };
  });

  const eyeColor = EYE_COLOR[state];

  return (
    <View style={mascotStyles.wrapper}>
      <Animated.View style={[mascotStyles.body, bodyStyle]}>
        <View style={[mascotStyles.ear, mascotStyles.earLeft]} />
        <View style={[mascotStyles.ear, mascotStyles.earRight]} />
        <View style={mascotStyles.face}>
          <View style={[mascotStyles.eye, { backgroundColor: eyeColor }]} />
          <View style={[mascotStyles.eye, { backgroundColor: eyeColor }]} />
        </View>
        {state === 'NIGHT_DANGER' ? (
          <View style={mascotStyles.badge}>
            <IconSymbol name="flame.fill" size={16} color="#FF7A30" />
          </View>
        ) : null}
        {state === 'COMPLETED' ? (
          <View style={mascotStyles.badge}>
            <IconSymbol name="sparkles" size={14} color={HALO_COLORS.gold} />
          </View>
        ) : null}
        {state === 'NEW' ? (
          <View style={mascotStyles.badge}>
            <IconSymbol name="heart.fill" size={14} color={HALO_COLORS.gold} />
          </View>
        ) : null}
      </Animated.View>
      {state === 'NIGHT_DANGER' ? (
        <View style={mascotStyles.tears}>
          <View style={mascotStyles.tearDrop} />
          <View style={mascotStyles.tearDrop} />
        </View>
      ) : null}
    </View>
  );
}

const mascotStyles = StyleSheet.create({
  wrapper: {
    alignItems: 'center',
    justifyContent: 'center',
    height: PANTHER_SIZE + 26,
    marginVertical: SPACING.tight,
  },
  body: {
    width: PANTHER_SIZE,
    height: PANTHER_SIZE,
    borderRadius: PANTHER_SIZE / 2,
    backgroundColor: '#0B0C10',
    alignItems: 'center',
    justifyContent: 'center',
    ...ELEVATION.md,
  },
  ear: {
    position: 'absolute',
    top: -9,
    width: 20,
    height: 20,
    borderRadius: 6,
    backgroundColor: '#0B0C10',
    transform: [{ rotate: '45deg' }],
  },
  earLeft: {
    left: 12,
  },
  earRight: {
    right: 12,
  },
  face: {
    flexDirection: 'row',
    gap: 14,
  },
  eye: {
    width: 11,
    height: 11,
    borderRadius: 6,
  },
  badge: {
    position: 'absolute',
    bottom: -4,
    right: -4,
    width: 28,
    height: 28,
    borderRadius: 14,
    backgroundColor: '#1A1B20',
    alignItems: 'center',
    justifyContent: 'center',
  },
  tears: {
    flexDirection: 'row',
    gap: 18,
    marginTop: 2,
  },
  tearDrop: {
    width: 6,
    height: 10,
    borderRadius: 3,
    backgroundColor: '#5AC8FA',
  },
});

function formatCountdown(ms: number): string {
  const totalMinutes = Math.max(0, Math.floor(ms / 60000));
  const hours = Math.floor(totalMinutes / 60);
  const minutes = totalMinutes % 60;
  return hours > 0 ? `${hours} h ${minutes} min` : `${minutes} min`;
}

// In-app preview of what a real home-screen widget (iOS WidgetKit / Android
// Glance) would show — see lib/home-widget.ts for why it isn't a real OS
// widget yet (managed Expo workflow, no native ios/android project). Reads
// through useWidgetData(), which also refreshes the shared-storage bridge
// every time it's queried.
export function HomeWidgetPreview() {
  const COLORS = useThemeColors();
  const widgetQuery = useWidgetData();
  const [now, setNow] = useState(() => new Date());

  useEffect(() => {
    if (widgetQuery.data?.state !== 'NIGHT_DANGER') {
      return;
    }
    const interval = setInterval(() => setNow(new Date()), 30_000);
    return () => clearInterval(interval);
  }, [widgetQuery.data?.state]);

  const styles = StyleSheet.create({
    card: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      alignItems: 'center',
      marginBottom: SPACING.element,
      ...cardBorder(COLORS),
    },
    headerRow: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      alignSelf: 'stretch',
    },
    matiereText: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
      flexShrink: 1,
      textAlign: 'right',
      marginLeft: SPACING.tight,
    },
    title: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
      textAlign: 'center',
    },
    subtitle: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
      textAlign: 'center',
      marginTop: 2,
    },
    countdown: {
      ...TYPOGRAPHY.caption,
      color: '#FF5A4E',
      fontWeight: '700',
      marginTop: SPACING.tight,
    },
    ctaButton: {
      backgroundColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 10,
      paddingHorizontal: 20,
      marginTop: SPACING.element,
    },
    ctaText: {
      color: COLORS.accentText,
      fontWeight: '700',
      fontSize: 14,
    },
  });

  if (widgetQuery.isPending) {
    return <Skeleton height={220} radius={RADIUS} style={{ marginBottom: SPACING.element }} />;
  }

  // Decorative preview — fail silently rather than showing an error card on
  // Home for a widget nobody explicitly asked to see load-state feedback for.
  if (widgetQuery.isError || !widgetQuery.data) {
    return null;
  }

  const data = widgetQuery.data;
  const copy =
    data.state === 'NEW'
      ? { title: `Bienvenue ${data.prenom} !`, subtitle: 'Prêt pour ta première session ? 🚀' }
      : STATE_COPY[data.state]!;

  return (
    <View style={styles.card}>
      <View style={styles.headerRow}>
        <StreakBadge streak={data.streak} />
        <ThemedText style={styles.matiereText} numberOfLines={1}>
          {data.matiere}
        </ThemedText>
      </View>

      <MascotPanther state={data.state} />

      <ThemedText style={styles.title}>{copy.title}</ThemedText>
      <ThemedText style={styles.subtitle}>{copy.subtitle}</ThemedText>

      {data.state === 'NIGHT_DANGER' ? (
        <ThemedText style={styles.countdown}>{formatCountdown(getMillisecondsUntilMidnight(now))} avant minuit</ThemedText>
      ) : null}

      {data.state === 'BROKEN' ? (
        <BouncyPressable style={styles.ctaButton} onPress={() => router.push('/cours')}>
          <ThemedText style={styles.ctaText}>Relancer ma série</ThemedText>
        </BouncyPressable>
      ) : null}
    </View>
  );
}
