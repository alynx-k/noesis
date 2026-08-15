import { useEffect, useMemo, useState } from 'react';
import * as Haptics from 'expo-haptics';
import { Modal, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Svg, { Path } from 'react-native-svg';
import Animated, {
  Easing,
  FadeIn,
  SharedValue,
  useAnimatedStyle,
  useSharedValue,
  withDelay,
  withSequence,
  withTiming,
  ZoomIn,
} from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { FlameIcon } from '@/components/flame-icon';
import { NeoMascot } from '@/components/neo-mascot';
import { ThemedText } from '@/components/themed-text';
import { Button } from '@/components/ui/button';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useThemeColors } from '@/hooks/use-theme-colors';
import { getStreakGoalDays, markStreakCelebrationSeen, setStreakGoalDays } from '@/lib/streak-celebration';

const WEEKDAY_LABELS = ['L', 'M', 'M', 'J', 'V', 'S', 'D'];

const GOAL_OPTIONS = [
  { days: 7, gems: 35 },
  { days: 14, gems: 140 },
  { days: 30, gems: 210 },
  { days: 50, gems: 350 },
] as const;

const SPARK_COUNT = 8;
const SPARK_ANGLES = Array.from({ length: SPARK_COUNT }, (_, i) => (i / SPARK_COUNT) * Math.PI * 2);

function SparkDot({ angle, burst, color }: { angle: number; burst: SharedValue<number>; color: string }) {
  const style = useAnimatedStyle(() => {
    const radius = burst.value * 44;
    return {
      opacity: 1 - burst.value,
      transform: [
        { translateX: Math.cos(angle) * radius },
        { translateY: Math.sin(angle) * radius },
        { scale: 1 - burst.value * 0.5 },
      ],
    };
  });

  return <Animated.View style={[styles.sparkDot, { backgroundColor: color }, style]} />;
}

// Cold/unlit flame silhouette — same teardrop silhouette as FlameIcon's
// outer path, flattened to a single grey fill (no gradient/glow) so it
// reads as "not lit yet" for the ignition beat's before-state.
function ColdFlame({ size, color }: { size: number; color: string }) {
  const height = size * 1.2;
  return (
    <View style={{ width: size, height, opacity: 0.5 }}>
      <FlameIconSilhouette size={size} height={height} color={color} />
    </View>
  );
}

// Flattens FlameIcon's outer teardrop path to a single flat fill (no
// gradient/glow) — same silhouette, "not lit yet" read.
function FlameIconSilhouette({ size, height, color }: { size: number; height: number; color: string }) {
  return (
    <Svg width={size} height={height} viewBox="0 0 32 38">
      <Path
        d="M16 2C16 2 26 14.5 26 23C26 29.0751 21.5228 34 16 34C10.4772 34 6 29.0751 6 23C6 14.5 16 2 16 2Z"
        fill={color}
      />
    </Svg>
  );
}

function IgniteFlame({ size }: { size: number }) {
  const COLORS = useThemeColors();
  const ignited = useSharedValue(0);
  const scale = useSharedValue(1);
  const burst = useSharedValue(0);

  useEffect(() => {
    ignited.value = withDelay(300, withTiming(1, { duration: 450 }));
    scale.value = withDelay(300, withSequence(withTiming(1.28, { duration: 220 }), withTiming(1, { duration: 220 })));
    burst.value = withDelay(320, withTiming(1, { duration: 520, easing: Easing.out(Easing.quad) }));
    const timer = setTimeout(() => Haptics.notificationAsync(Haptics.NotificationFeedbackType.Success), 320);
    return () => clearTimeout(timer);
  }, [ignited, scale, burst]);

  const coldStyle = useAnimatedStyle(() => ({ opacity: 1 - ignited.value }));
  const litStyle = useAnimatedStyle(() => ({ opacity: ignited.value, transform: [{ scale: scale.value }] }));

  return (
    <View style={styles.igniteWrapper}>
      {SPARK_ANGLES.map((angle, index) => (
        <SparkDot key={index} angle={angle} burst={burst} color="#F2A65A" />
      ))}
      <Animated.View style={[StyleSheet.absoluteFillObject, styles.igniteLayer, coldStyle]}>
        <ColdFlame size={size} color={COLORS.locked} />
      </Animated.View>
      <Animated.View style={[styles.igniteLayer, litStyle]}>
        <FlameIcon size={size} animated />
      </Animated.View>
    </View>
  );
}

function SpeechBubble({ text }: { text: string }) {
  const COLORS = useThemeColors();
  return (
    <Animated.View entering={ZoomIn.delay(1050).duration(350).springify().damping(14)} style={bubbleStyles.wrap}>
      <View style={[bubbleStyles.bubble, { backgroundColor: COLORS.surface }]}>
        <ThemedText style={[bubbleStyles.text, { color: COLORS.text }]}>{text}</ThemedText>
      </View>
      <View style={[bubbleStyles.tail, { backgroundColor: COLORS.surface }]} />
    </Animated.View>
  );
}

const bubbleStyles = StyleSheet.create({
  wrap: {
    alignItems: 'center',
    marginBottom: SPACING.tight,
  },
  bubble: {
    borderRadius: RADIUS,
    paddingVertical: 12,
    paddingHorizontal: 18,
    maxWidth: 300,
  },
  text: {
    ...TYPOGRAPHY.body,
    fontWeight: '600',
    textAlign: 'center',
  },
  tail: {
    width: 16,
    height: 16,
    marginTop: -9,
    transform: [{ rotate: '45deg' }],
  },
});

type StreakCelebrationProps = {
  visible: boolean;
  streak: number;
  weekDays: boolean[];
  onDone: () => void;
};

// Full-screen, one-time "ta série est née" flow (see lib/streak-celebration.ts
// for the lifetime gate that decides when this mounts): a flame ignition +
// streak count, then Neo + a speech bubble + this week's days, then a
// second screen to pick a streak goal — recreating the Duolingo streak
// onboarding beat with Neo standing in for Duo. Two internal steps rather
// than two routes: it's one continuous modal moment, not real navigation.
export function StreakCelebration({ visible, streak, weekDays, onDone }: StreakCelebrationProps) {
  const COLORS = useThemeColors();
  const [step, setStep] = useState<'birth' | 'goal'>('birth');
  const [selectedGoal, setSelectedGoal] = useState<number>(7);
  const todayIndex = useMemo(() => (new Date().getDay() + 6) % 7, []); // Monday = 0

  useEffect(() => {
    if (visible) {
      setStep('birth');
      getStreakGoalDays().then((saved) => {
        if (saved) {
          setSelectedGoal(saved);
        }
      });
    }
  }, [visible]);

  const dismiss = () => {
    markStreakCelebrationSeen();
    onDone();
  };

  const handleValidateGoal = () => {
    setStreakGoalDays(selectedGoal);
    markStreakCelebrationSeen();
    onDone();
  };

  const bornTitle = streak <= 1 ? 'Une série est née !' : 'Ta série continue !';

  return (
    <Modal visible={visible} animationType="fade" transparent={false} onRequestClose={dismiss}>
      <View style={[styles.screen, { backgroundColor: COLORS.background }]}>
        <SafeAreaView style={styles.flex} edges={['top', 'bottom']}>
          <View style={styles.closeRow}>
            <BouncyPressable style={styles.closeButton} onPress={dismiss} hitSlop={8}>
              <IconSymbol name="xmark" size={18} color={COLORS.mutedText} />
            </BouncyPressable>
          </View>

          {step === 'birth' ? (
            <View style={styles.center}>
              <IgniteFlame size={64} />

              <Animated.View entering={ZoomIn.delay(650).duration(300)} style={styles.counterRow}>
                <ThemedText style={[styles.counterNumber, { color: COLORS.text }]}>{streak}</ThemedText>
                <ThemedText style={[styles.counterLabel, { color: COLORS.mutedText }]}>
                  jour{streak > 1 ? 's' : ''} !
                </ThemedText>
              </Animated.View>

              <Animated.View entering={ZoomIn.delay(900).duration(400).springify().damping(12)}>
                <NeoMascot size={104} floating />
              </Animated.View>

              <SpeechBubble text={`${bornTitle} Entraîne-toi chaque jour pour te créer une habitude.`} />

              <Animated.View entering={FadeIn.delay(1300).duration(300)} style={styles.weekRow}>
                {WEEKDAY_LABELS.map((label, index) => {
                  const done = weekDays[index];
                  const isToday = index === todayIndex;
                  return (
                    <View key={index} style={styles.weekDay}>
                      <View
                        style={[
                          styles.weekDayCircle,
                          { backgroundColor: COLORS.lockedBackground },
                          done && { backgroundColor: '#F2A65A' },
                          isToday && { borderWidth: 2, borderColor: COLORS.text },
                        ]}>
                        {done ? <IconSymbol name="checkmark" size={14} color="#FFFFFF" /> : null}
                      </View>
                      <ThemedText style={[styles.weekDayLabel, { color: COLORS.mutedText }]}>{label}</ThemedText>
                    </View>
                  );
                })}
              </Animated.View>

              <Animated.View entering={FadeIn.delay(1500).duration(300)} style={styles.footer}>
                <Button label="JE GARDE MA SÉRIE" onPress={() => setStep('goal')} />
              </Animated.View>
            </View>
          ) : (
            <View style={styles.center}>
              <View style={styles.goalBadgeRow}>
                <NeoMascot size={84} floating />
                <View style={[styles.goalBadge, { backgroundColor: COLORS.accentSoft }]}>
                  <ThemedText style={[styles.goalBadgeNumber, { color: COLORS.accent }]}>{selectedGoal}</ThemedText>
                  <ThemedText style={[styles.goalBadgeLabel, { color: COLORS.accent }]}>jours</ThemedText>
                  <View style={styles.goalBadgeFlame}>
                    <FlameIcon size={22} animated={false} />
                  </View>
                </View>
              </View>

              <SpeechBubble text="Fixe-toi un objectif de série pour te motiver !" />

              <Animated.View entering={FadeIn.delay(250).duration(300)} style={styles.goalList}>
                {GOAL_OPTIONS.map((option) => {
                  const selected = option.days === selectedGoal;
                  return (
                    <BouncyPressable
                      key={option.days}
                      style={[
                        styles.goalOption,
                        { backgroundColor: COLORS.surface, borderColor: COLORS.border },
                        selected && { borderColor: COLORS.accent, backgroundColor: COLORS.accentSoft },
                      ]}
                      onPress={() => setSelectedGoal(option.days)}>
                      <View>
                        <ThemedText style={[styles.goalOptionDays, { color: COLORS.text }]}>
                          {option.days} jours
                        </ThemedText>
                        <ThemedText style={[styles.goalOptionReward, { color: COLORS.mutedText }]}>
                          Gagne {option.gems} gemmes
                        </ThemedText>
                      </View>
                      {selected ? (
                        <View style={[styles.goalOptionCheck, { backgroundColor: COLORS.accent }]}>
                          <IconSymbol name="checkmark" size={14} color={COLORS.accentText} />
                        </View>
                      ) : null}
                    </BouncyPressable>
                  );
                })}
              </Animated.View>

              <Animated.View entering={FadeIn.delay(400).duration(300)} style={styles.footer}>
                <Button label="JE VALIDE MON OBJECTIF" onPress={handleValidateGoal} />
              </Animated.View>
            </View>
          )}
        </SafeAreaView>
      </View>
    </Modal>
  );
}

const styles = StyleSheet.create({
  screen: {
    flex: 1,
  },
  flex: {
    flex: 1,
  },
  closeRow: {
    alignItems: 'flex-end',
    paddingHorizontal: SPACING.screen,
    paddingTop: SPACING.tight,
  },
  closeButton: {
    width: 36,
    height: 36,
    alignItems: 'center',
    justifyContent: 'center',
  },
  center: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    paddingHorizontal: SPACING.screen,
  },
  igniteWrapper: {
    alignItems: 'center',
    justifyContent: 'center',
    width: 64,
    height: 80,
    marginBottom: SPACING.tight,
  },
  igniteLayer: {
    alignItems: 'center',
    justifyContent: 'center',
  },
  sparkDot: {
    position: 'absolute',
    width: 6,
    height: 6,
    borderRadius: 3,
  },
  counterRow: {
    flexDirection: 'row',
    alignItems: 'baseline',
    gap: 6,
    marginBottom: SPACING.element,
  },
  counterNumber: {
    ...TYPOGRAPHY.largeTitle,
    fontSize: 40,
    lineHeight: 46,
  },
  counterLabel: {
    ...TYPOGRAPHY.title,
  },
  weekRow: {
    flexDirection: 'row',
    gap: 10,
    marginTop: SPACING.element,
    marginBottom: SPACING.section,
  },
  weekDay: {
    alignItems: 'center',
    gap: 6,
  },
  weekDayCircle: {
    width: 28,
    height: 28,
    borderRadius: 14,
    alignItems: 'center',
    justifyContent: 'center',
  },
  weekDayLabel: {
    ...TYPOGRAPHY.caption,
    fontSize: 11,
  },
  footer: {
    alignSelf: 'stretch',
    marginTop: SPACING.element,
  },
  goalBadgeRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: SPACING.element,
    marginBottom: SPACING.element,
  },
  goalBadge: {
    width: 84,
    height: 84,
    borderRadius: RADIUS,
    alignItems: 'center',
    justifyContent: 'center',
  },
  goalBadgeNumber: {
    ...TYPOGRAPHY.largeTitle,
    fontSize: 30,
    lineHeight: 34,
  },
  goalBadgeLabel: {
    ...TYPOGRAPHY.caption,
    fontWeight: '700',
  },
  goalBadgeFlame: {
    position: 'absolute',
    top: -10,
    right: -8,
  },
  goalList: {
    alignSelf: 'stretch',
    gap: SPACING.tight,
  },
  goalOption: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    borderRadius: RADIUS,
    borderWidth: 2,
    paddingVertical: 12,
    paddingHorizontal: 16,
  },
  goalOptionDays: {
    fontSize: 16,
    fontWeight: '700',
  },
  goalOptionReward: {
    ...TYPOGRAPHY.caption,
    marginTop: 2,
  },
  goalOptionCheck: {
    width: 24,
    height: 24,
    borderRadius: 12,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
