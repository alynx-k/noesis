import { router } from 'expo-router';
import { useEffect, useState } from 'react';
import { KeyboardAvoidingView, Platform, ScrollView, StyleSheet, TextInput, View } from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { useAnimatedStyle, useSharedValue, withTiming } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { CelebrationBurst } from '@/components/celebration-burst';
import { LiftoffSequence } from '@/components/liftoff-sequence';
import { RocketIcon } from '@/components/rocket-icon';
import { ThemedText } from '@/components/themed-text';
import { ScreenBackground } from '@/components/screen-background';
import { GRADIENTS, PILL_RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useFocusSession } from '@/context/focus-session';
import { useThemeColors } from '@/hooks/use-theme-colors';
import { playLaunchSound } from '@/lib/sound';

const QUICK_DURATIONS = [10, 25, 45];

const PREVIEW_STAR_POSITIONS = [
  { top: '6%', left: '22%' },
  { top: '10%', left: '68%' },
  { top: '16%', left: '42%' },
  { top: '4%', left: '55%' },
  { top: '22%', left: '15%' },
  { top: '14%', left: '85%' },
  { top: '28%', left: '60%' },
  { top: '20%', left: '32%' },
  { top: '32%', left: '78%' },
  { top: '9%', left: '10%' },
] as const;

const SKY_STAR_POSITIONS = [
  { top: '4%', left: '12%', size: 3 },
  { top: '8%', left: '82%', size: 2 },
  { top: '3%', left: '48%', size: 2 },
  { top: '14%', left: '25%', size: 3 },
  { top: '18%', left: '90%', size: 2 },
  { top: '11%', left: '65%', size: 3 },
  { top: '22%', left: '8%', size: 2 },
  { top: '2%', left: '75%', size: 2 },
  { top: '40%', left: '15%', size: 3 },
  { top: '46%', left: '88%', size: 2 },
  { top: '52%', left: '10%', size: 2 },
  { top: '38%', left: '92%', size: 3 },
  { top: '58%', left: '20%', size: 2 },
  { top: '62%', left: '78%', size: 3 },
  { top: '30%', left: '38%', size: 2 },
  { top: '35%', left: '58%', size: 2 },
  { top: '68%', left: '40%', size: 2 },
  { top: '72%', left: '65%', size: 3 },
  { top: '26%', left: '70%', size: 2 },
  { top: '48%', left: '48%', size: 2 },
] as const;

function formatTime(totalSeconds: number): string {
  const minutes = Math.floor(totalSeconds / 60);
  const seconds = totalSeconds % 60;
  return `${minutes}:${seconds.toString().padStart(2, '0')}`;
}

function milestoneLabel(progress: number): string {
  if (progress >= 0.97) {
    return 'Atterrissage sur Mars !';
  }
  if (progress >= 0.7) {
    return 'Direction Mars';
  }
  if (progress >= 0.4) {
    return 'Cap sur la Lune';
  }
  if (progress >= 0.12) {
    return 'En orbite';
  }
  return 'Décollage';
}

// Small preview of the launch track shown before the session starts (idle
// phase) — the full-screen night sky only appears once "inside" a running
// session, per the user's request.
function LaunchPreview() {
  return (
    <View style={previewStyles.wrapper}>
      <LinearGradient
        colors={['#0B0F2B', '#2B2560', '#F2A65A']}
        locations={[0, 0.62, 1]}
        start={{ x: 0, y: 0 }}
        end={{ x: 0, y: 1 }}
        style={previewStyles.track}>
        {PREVIEW_STAR_POSITIONS.map((position, index) => (
          <View key={index} style={[previewStyles.star, position]} />
        ))}
        <View style={previewStyles.mars} />
        <View style={previewStyles.moon} />
        <View style={previewStyles.rocket}>
          <RocketIcon size={40} floating />
        </View>
      </LinearGradient>
    </View>
  );
}

const previewStyles = StyleSheet.create({
  wrapper: {
    alignItems: 'center',
    marginBottom: SPACING.section,
  },
  track: {
    width: 220,
    height: 300,
    borderRadius: 24,
    overflow: 'hidden',
    // Fallback so the track is never invisible if the gradient fails to paint.
    backgroundColor: '#2B2560',
  },
  star: {
    position: 'absolute',
    width: 3,
    height: 3,
    borderRadius: 2,
    backgroundColor: '#FFFFFF',
  },
  moon: {
    position: 'absolute',
    top: '5%',
    right: '14%',
    width: 22,
    height: 22,
    borderRadius: 11,
    backgroundColor: '#D9D9E3',
  },
  mars: {
    position: 'absolute',
    top: '1%',
    left: '56%',
    width: 16,
    height: 16,
    borderRadius: 8,
    backgroundColor: '#D96A4A',
  },
  rocket: {
    position: 'absolute',
    left: '50%',
    bottom: '18%',
    marginLeft: -20,
  },
});

// Full-screen night sky BACKDROP (no content) shown while a session is
// running or has just succeeded: purple gradient, visible stars, a large
// destination planet, and a rocket that climbs toward it and visibly lands
// on it at 100%. Mounted outside SafeAreaView (see the root ScreenBackground
// below) so it reaches the true screen edges; text/buttons render
// separately, inside SafeAreaView, over this backdrop.
function NightSkyBackdrop({
  progress,
  landed,
  celebrate,
}: {
  progress: number;
  landed: boolean;
  celebrate?: boolean;
}) {
  const bottom = useSharedValue(4);

  useEffect(() => {
    bottom.value = withTiming(4 + progress * 66, { duration: 900 });
  }, [progress, bottom]);

  const flightStyle = useAnimatedStyle(() => ({
    bottom: `${bottom.value}%`,
  }));

  return (
    <View style={nightStyles.container} pointerEvents="none">
      <LinearGradient colors={GRADIENTS.night} style={StyleSheet.absoluteFill} start={{ x: 0, y: 0 }} end={{ x: 0.3, y: 1 }} />

      {SKY_STAR_POSITIONS.map((star, index) => (
        <View
          key={index}
          style={[
            nightStyles.star,
            { top: star.top, left: star.left, width: star.size, height: star.size, borderRadius: star.size },
          ]}
        />
      ))}

      <View style={nightStyles.planetWrapper}>
        <LinearGradient
          colors={['#F2A65A', '#C1502E']}
          start={{ x: 0.3, y: 0 }}
          end={{ x: 0.7, y: 1 }}
          style={nightStyles.planet}>
          <View style={nightStyles.crater1} />
          <View style={nightStyles.crater2} />
          <View style={nightStyles.crater3} />
        </LinearGradient>
      </View>

      {landed ? (
        <View style={nightStyles.rocketLanded}>
          <RocketIcon size={34} floating />
        </View>
      ) : (
        <Animated.View style={[nightStyles.rocketFlying, flightStyle]}>
          <RocketIcon size={44} />
        </Animated.View>
      )}

      {celebrate ? <CelebrationBurst /> : null}
    </View>
  );
}

const nightStyles = StyleSheet.create({
  container: {
    ...StyleSheet.absoluteFillObject,
    overflow: 'hidden',
    // Fallback so the sky is never invisible if the gradient fails to paint
    // (otherwise the screen would fall back to the navigation theme's
    // background, which can be plain black).
    backgroundColor: '#1C1650',
  },
  star: {
    position: 'absolute',
    backgroundColor: '#FFFFFF',
    opacity: 0.9,
  },
  planetWrapper: {
    position: 'absolute',
    top: '9%',
    left: '50%',
    marginLeft: -85,
    width: 170,
    height: 170,
    alignItems: 'center',
    justifyContent: 'center',
  },
  planet: {
    width: 170,
    height: 170,
    borderRadius: 85,
    overflow: 'hidden',
    // Fallback so the planet is never invisible if the gradient fails to paint.
    backgroundColor: '#D9723D',
  },
  crater1: {
    position: 'absolute',
    top: 28,
    left: 34,
    width: 28,
    height: 28,
    borderRadius: 14,
    backgroundColor: 'rgba(0,0,0,0.12)',
  },
  crater2: {
    position: 'absolute',
    top: 92,
    left: 100,
    width: 20,
    height: 20,
    borderRadius: 10,
    backgroundColor: 'rgba(0,0,0,0.1)',
  },
  crater3: {
    position: 'absolute',
    top: 60,
    left: 120,
    width: 14,
    height: 14,
    borderRadius: 7,
    backgroundColor: 'rgba(0,0,0,0.1)',
  },
  rocketFlying: {
    position: 'absolute',
    left: '50%',
    marginLeft: -22,
  },
  rocketLanded: {
    position: 'absolute',
    top: '17%',
    left: '50%',
    marginLeft: -17,
  },
});

// A gentle, static-feeling "it's okay" visual for the failed phase — the
// rocket on its side, softly rocking, rather than just bare text on an
// otherwise empty screen. Deliberately calmer than LaunchPreview/NightSky
// (no stars, no destination): this moment is a reassurance, not a
// spectacle.
function FallenRocketIllustration() {
  const rock = useSharedValue(0);

  useEffect(() => {
    rock.value = withTiming(1, { duration: 900 });
  }, [rock]);

  const wobbleStyle = useAnimatedStyle(() => ({
    transform: [{ rotate: `${100 + rock.value * 6}deg` }, { translateY: rock.value * -4 }],
  }));

  return (
    <View style={fallenStyles.wrapper}>
      <View style={fallenStyles.shadow} />
      <Animated.View style={wobbleStyle}>
        <RocketIcon size={48} />
      </Animated.View>
    </View>
  );
}

const fallenStyles = StyleSheet.create({
  wrapper: {
    alignItems: 'center',
    justifyContent: 'flex-end',
    height: 100,
    marginBottom: SPACING.element,
  },
  shadow: {
    position: 'absolute',
    bottom: 6,
    width: 64,
    height: 12,
    borderRadius: 8,
    backgroundColor: 'rgba(0,0,0,0.1)',
  },
});

export default function FocusSessionScreen() {
  const COLORS = useThemeColors();
  const { phase, durationMinutes, remainingSeconds, destinationReached, destinationJustUnlocked, start, reset } =
    useFocusSession();
  const [durationInput, setDurationInput] = useState('25');
  // A short scripted beat (LiftoffSequence) between pressing "Lancer" and
  // the actual session starting — start() only fires once it completes, so
  // the running screen's own instant flip to phase 'running' lands exactly
  // when the liftoff animation (and its synchronized sound) finish, rather
  // than racing ahead of them.
  const [launching, setLaunching] = useState(false);

  const totalSeconds = durationMinutes * 60;
  const progress =
    phase === 'running' ? 1 - remainingSeconds / totalSeconds : phase === 'success' ? 1 : 0;

  const parsedMinutes = parseInt(durationInput, 10);
  const canStart = Number.isFinite(parsedMinutes) && parsedMinutes > 0 && parsedMinutes <= 240;

  const handleStart = () => {
    if (!canStart) {
      return;
    }
    playLaunchSound();
    setLaunching(true);
  };

  const handleLiftoffComplete = () => {
    setLaunching(false);
    start(parsedMinutes);
  };

  const handleRestart = () => {
    reset();
  };

  const handleBackHome = () => {
    reset();
    router.replace('/');
  };

  const handleBrowseElsewhere = () => {
    router.replace('/');
  };

  const handleViewAtlas = () => {
    reset();
    router.replace('/garden');
  };

  const isNight = phase === 'running' || phase === 'success' || launching;

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    centered: {
      flex: 1,
      alignItems: 'center',
      justifyContent: 'center',
      padding: SPACING.screen,
    },
    // Same shape as `centered`, but as a ScrollView contentContainerStyle
    // (flexGrow instead of flex) for the idle phase — that's the one phase
    // with a TextInput above the "Lancer" button, so it's the one that needs
    // to be scrollable: when the keyboard opens, KeyboardAvoidingView alone
    // isn't enough on Android (edge-to-edge is on in app.json, which makes
    // the usual automatic window resize unreliable), so the content also
    // needs to be scrollable for the button to always be reachable.
    idleScrollContent: {
      flexGrow: 1,
      alignItems: 'center',
      justifyContent: 'center',
      padding: SPACING.screen,
    },
    nightContentArea: {
      flex: 1,
      justifyContent: 'flex-end',
      alignItems: 'center',
      padding: SPACING.screen,
    },
    title: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
      textAlign: 'center',
      marginBottom: 8,
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      textAlign: 'center',
      marginBottom: SPACING.section,
    },
    durationInputRow: {
      flexDirection: 'row',
      alignItems: 'baseline',
      gap: 8,
      marginBottom: SPACING.element,
    },
    durationInput: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
      backgroundColor: COLORS.surface,
      borderRadius: PILL_RADIUS,
      paddingVertical: 8,
      paddingHorizontal: 24,
      minWidth: 100,
      textAlign: 'center',
      borderWidth: 1.5,
      borderColor: COLORS.borderStrong,
    },
    durationInputLabel: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
    },
    durationRow: {
      flexDirection: 'row',
      gap: 10,
      marginBottom: SPACING.section,
    },
    durationChip: {
      backgroundColor: COLORS.surface,
      borderRadius: PILL_RADIUS,
      paddingVertical: 8,
      paddingHorizontal: 16,
      borderWidth: 1.5,
      borderColor: COLORS.borderStrong,
    },
    durationChipSelected: {
      backgroundColor: COLORS.accent,
      borderColor: COLORS.accent,
    },
    durationChipText: {
      fontSize: 14,
      fontWeight: '700',
      color: COLORS.text,
    },
    durationChipTextSelected: {
      color: COLORS.accentText,
    },
    primaryButton: {
      backgroundColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 16,
      paddingHorizontal: 32,
      alignItems: 'center',
    },
    primaryButtonText: {
      color: COLORS.accentText,
      fontSize: 16,
      fontWeight: '700',
    },
    secondaryButton: {
      paddingVertical: 14,
      alignItems: 'center',
      marginTop: SPACING.tight,
    },
    secondaryButtonText: {
      color: COLORS.mutedText,
      fontSize: 14,
      fontWeight: '600',
      textDecorationLine: 'underline',
    },
    unlockBadge: {
      backgroundColor: '#F2C879',
      borderRadius: PILL_RADIUS,
      paddingVertical: 6,
      paddingHorizontal: 14,
      marginBottom: SPACING.tight,
    },
    unlockBadgeText: {
      fontSize: 13,
      fontWeight: '700',
      color: '#4A3400',
    },
    nightTitle: {
      ...TYPOGRAPHY.title,
      color: '#FFFFFF',
      textAlign: 'center',
      marginBottom: 8,
    },
    nightTimer: {
      ...TYPOGRAPHY.largeTitle,
      fontSize: 44,
      // TYPOGRAPHY.largeTitle's lineHeight (34) is smaller than this
      // fontSize, which clips the digits top/bottom — override both together.
      lineHeight: 52,
      color: '#FFFFFF',
      marginBottom: 4,
    },
    nightMilestone: {
      ...TYPOGRAPHY.label,
      color: '#C9B8FF',
      textTransform: 'uppercase',
      marginBottom: SPACING.tight,
    },
    nightSubtitle: {
      ...TYPOGRAPHY.body,
      color: '#C9C3E8',
      textAlign: 'center',
      marginBottom: SPACING.element,
    },
    nightSecondaryButton: {
      paddingVertical: 12,
      paddingHorizontal: 20,
      borderRadius: PILL_RADIUS,
      borderWidth: 1.5,
      borderColor: 'rgba(255,255,255,0.4)',
      marginVertical: SPACING.tight,
    },
    nightSecondaryButtonText: {
      color: '#FFFFFF',
      fontSize: 14,
      fontWeight: '700',
    },
  });

  return (
    <ScreenBackground color={isNight ? '#1C1650' : COLORS.background}>
      {phase === 'running' ? <NightSkyBackdrop progress={progress} landed={false} /> : null}
      {phase === 'success' ? <NightSkyBackdrop progress={1} landed celebrate /> : null}
      {launching ? <LiftoffSequence onComplete={handleLiftoffComplete} /> : null}

      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        {phase === 'idle' && !launching ? (
          <KeyboardAvoidingView style={{ flex: 1 }} behavior={Platform.OS === 'ios' ? 'padding' : undefined}>
            <ScrollView contentContainerStyle={styles.idleScrollContent} keyboardShouldPersistTaps="handled">
              <LaunchPreview />
              <ThemedText style={styles.title}>Session de concentration</ThemedText>
              <ThemedText style={styles.subtitle}>
                Choisis une durée. La fusée décolle et s&apos;éloigne pendant la session — elle retombe si tu quittes
                Noesis (autre app, verrouillage) avant la fin.
              </ThemedText>

              <View style={styles.durationInputRow}>
                <TextInput
                  style={styles.durationInput}
                  keyboardType="number-pad"
                  value={durationInput}
                  onChangeText={setDurationInput}
                  maxLength={3}
                />
                <ThemedText style={styles.durationInputLabel}>minutes</ThemedText>
              </View>

              <View style={styles.durationRow}>
                {QUICK_DURATIONS.map((minutes) => (
                  <BouncyPressable
                    key={minutes}
                    style={[styles.durationChip, durationInput === String(minutes) && styles.durationChipSelected]}
                    onPress={() => setDurationInput(String(minutes))}>
                    <ThemedText
                      style={[
                        styles.durationChipText,
                        durationInput === String(minutes) && styles.durationChipTextSelected,
                      ]}>
                      {minutes} min
                    </ThemedText>
                  </BouncyPressable>
                ))}
              </View>

              <BouncyPressable style={styles.primaryButton} onPress={handleStart} disabled={!canStart}>
                <ThemedText style={styles.primaryButtonText}>Lancer la fusée</ThemedText>
              </BouncyPressable>
            </ScrollView>
          </KeyboardAvoidingView>
        ) : null}

        {phase === 'running' ? (
          <View style={styles.nightContentArea}>
            <ThemedText style={styles.nightTimer}>{formatTime(remainingSeconds)}</ThemedText>
            <BouncyPressable style={styles.nightSecondaryButton} onPress={handleBrowseElsewhere}>
              <ThemedText style={styles.nightSecondaryButtonText}>Continuer sur Noesis</ThemedText>
            </BouncyPressable>
            <ThemedText style={styles.nightMilestone}>{milestoneLabel(progress)}</ThemedText>
            <ThemedText style={styles.nightSubtitle}>
              Tu peux consulter d&apos;autres écrans de Noesis, la fusée continue son vol. Elle retombe seulement si
              tu quittes l&apos;app.
            </ThemedText>
          </View>
        ) : null}

        {phase === 'success' ? (
          <View style={styles.nightContentArea}>
            {destinationJustUnlocked && destinationReached ? (
              <View style={styles.unlockBadge}>
                <ThemedText style={styles.unlockBadgeText}>🎉 Nouvelle destination débloquée</ThemedText>
              </View>
            ) : null}
            <ThemedText style={styles.nightTitle}>
              {destinationReached ? `Arrivée sur ${destinationReached.name} !` : 'Fusée arrivée à destination !'}
            </ThemedText>
            <ThemedText style={styles.nightSubtitle}>
              Tu es resté concentré {durationMinutes} minutes complètes. Bravo.
            </ThemedText>
            <BouncyPressable style={styles.primaryButton} onPress={handleBackHome}>
              <ThemedText style={styles.primaryButtonText}>Retour à l&apos;accueil</ThemedText>
            </BouncyPressable>
            <BouncyPressable style={styles.nightSecondaryButton} onPress={handleViewAtlas}>
              <ThemedText style={styles.nightSecondaryButtonText}>Voir mon atlas spatial</ThemedText>
            </BouncyPressable>
          </View>
        ) : null}

        {phase === 'failed' ? (
          <View style={styles.centered}>
            <FallenRocketIllustration />
            <ThemedText style={styles.title}>La fusée est retombée</ThemedText>
            <ThemedText style={styles.subtitle}>Pas de panique, on retente quand tu veux !</ThemedText>
            <BouncyPressable style={styles.primaryButton} onPress={handleRestart}>
              <ThemedText style={styles.primaryButtonText}>Réessayer</ThemedText>
            </BouncyPressable>
            <BouncyPressable style={styles.secondaryButton} onPress={handleBackHome}>
              <ThemedText style={styles.secondaryButtonText}>Retour à l&apos;accueil</ThemedText>
            </BouncyPressable>
          </View>
        ) : null}
      </SafeAreaView>
    </ScreenBackground>
  );
}
