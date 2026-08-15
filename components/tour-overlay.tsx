import { StyleSheet, useWindowDimensions, View } from 'react-native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import Animated, { FadeIn } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ThemedText } from '@/components/themed-text';
import { PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY, Z_INDEX } from '@/constants/design';
import { useTour } from '@/context/tour';
import { useThemeColors } from '@/hooks/use-theme-colors';

const SPOTLIGHT_PADDING = 10;
const SCRIM_COLOR = 'rgba(10,10,18,0.72)';
const TOOLTIP_HEIGHT_ESTIMATE = 200;
// This overlay is mounted at the root, outside the (tabs) navigator, so it
// can't call useBottomTabBarHeight() (that hook needs the tab navigator's
// own context) — this rough clearance stands in for "tab bar + home
// indicator" so the tooltip never lands underneath either.
const TAB_BAR_CLEARANCE_ESTIMATE = 90;

// Renders nothing until context/tour.tsx reports an active step — mounted
// once at the root (app/_layout.tsx), above the tab bar and every screen, so
// it can dim/spotlight regardless of which tab is showing underneath.
export function TourOverlay() {
  const { active, step, stepNumber, totalSteps, targets, next, skip } = useTour();
  const COLORS = useThemeColors();
  const { height } = useWindowDimensions();
  const insets = useSafeAreaInsets();

  if (!active || !step) {
    return null;
  }

  const target = step.kind === 'spotlight' ? targets[step.targetId] : null;
  const hole = target
    ? {
        x: target.x - SPOTLIGHT_PADDING,
        y: target.y - SPOTLIGHT_PADDING,
        width: target.width + SPOTLIGHT_PADDING * 2,
        height: target.height + SPOTLIGHT_PADDING * 2,
      }
    : null;

  const bottomLimit = height - insets.bottom - TAB_BAR_CLEARANCE_ESTIMATE;

  // Below the hole if there's room, otherwise above it — keeps the tooltip
  // on-screen regardless of where the target sits vertically. A step with
  // no hole (anchored, or a spotlight step whose target hasn't measured
  // yet) just sits near the bottom, clear of the tab bar.
  const tooltipTop = hole
    ? hole.y + hole.height + SPACING.element + TOOLTIP_HEIGHT_ESTIMATE < bottomLimit
      ? hole.y + hole.height + SPACING.element
      : Math.max(hole.y - TOOLTIP_HEIGHT_ESTIMATE - SPACING.element, insets.top + SPACING.element)
    : bottomLimit - TOOLTIP_HEIGHT_ESTIMATE;

  const styles = StyleSheet.create({
    root: {
      ...StyleSheet.absoluteFillObject,
      zIndex: Z_INDEX.modal + 10,
    },
    band: {
      position: 'absolute',
      backgroundColor: SCRIM_COLOR,
    },
    holeCutout: {
      position: 'absolute',
    },
    holeBorder: {
      position: 'absolute',
      borderRadius: RADIUS,
      borderWidth: 2,
      borderColor: COLORS.accent,
    },
    tooltip: {
      position: 'absolute',
      left: SPACING.screen,
      right: SPACING.screen,
      top: tooltipTop,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
    },
    stepLabel: {
      ...TYPOGRAPHY.label,
      color: COLORS.accent,
      textTransform: 'uppercase',
      marginBottom: 6,
    },
    title: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
      marginBottom: 6,
    },
    description: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      marginBottom: SPACING.element,
    },
    actionsRow: {
      flexDirection: 'row',
      justifyContent: 'space-between',
      alignItems: 'center',
    },
    skipText: {
      color: COLORS.mutedText,
      fontSize: 14,
      fontWeight: '600',
    },
    nextButton: {
      backgroundColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 10,
      paddingHorizontal: 20,
    },
    nextButtonText: {
      color: COLORS.accentText,
      fontSize: 14,
      fontWeight: '700',
    },
  });

  return (
    <Animated.View entering={FadeIn.duration(200)} style={styles.root}>
      {hole ? (
        <>
          <View style={[styles.band, { top: 0, left: 0, right: 0, height: Math.max(hole.y, 0) }]} />
          <View style={[styles.band, { top: hole.y + hole.height, left: 0, right: 0, bottom: 0 }]} />
          <View style={[styles.band, { top: hole.y, left: 0, width: Math.max(hole.x, 0), height: hole.height }]} />
          <View style={[styles.band, { top: hole.y, left: hole.x + hole.width, right: 0, height: hole.height }]} />
          {/* Transparent — just blocks taps reaching the real element
              underneath so it can't be triggered mid-tour, without dimming
              the exact area the scrim bands leave uncovered. */}
          <View
            style={[styles.holeCutout, { top: hole.y, left: hole.x, width: hole.width, height: hole.height }]}
          />
          <View style={[styles.holeBorder, { top: hole.y, left: hole.x, width: hole.width, height: hole.height }]} />
        </>
      ) : (
        <View style={[styles.band, StyleSheet.absoluteFillObject]} />
      )}

      <Animated.View key={step.id} entering={FadeIn.duration(220)} style={styles.tooltip}>
        <ThemedText style={styles.stepLabel}>
          Étape {stepNumber}/{totalSteps}
        </ThemedText>
        <ThemedText style={styles.title}>{step.title}</ThemedText>
        <ThemedText style={styles.description}>{step.description}</ThemedText>
        <View style={styles.actionsRow}>
          <BouncyPressable onPress={skip} hitSlop={8}>
            <ThemedText style={styles.skipText}>Passer</ThemedText>
          </BouncyPressable>
          <BouncyPressable style={styles.nextButton} onPress={next}>
            <ThemedText style={styles.nextButtonText}>{stepNumber === totalSteps ? 'Terminer' : 'Suivant'}</ThemedText>
          </BouncyPressable>
        </View>
      </Animated.View>
    </Animated.View>
  );
}
