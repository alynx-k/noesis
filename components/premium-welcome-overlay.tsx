import { useEffect, useState } from 'react';
import { StyleSheet, View } from 'react-native';
import Animated, { FadeIn } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { CelebrationBurst } from '@/components/celebration-burst';
import { ThemedText } from '@/components/themed-text';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY, Z_INDEX } from '@/constants/design';
import { useAuth } from '@/context/auth';
import { useTour } from '@/context/tour';
import { useAccessStatus } from '@/hooks/queries/use-access-status';
import { useThemeColors } from '@/hooks/use-theme-colors';
import { playAchievementSound } from '@/lib/sound';
import { checkForPremiumTransition } from '@/lib/subscription';

// Mounted once at the root (app/_layout.tsx), same as TourOverlay, so it can
// fire regardless of which screen the account happens to be on the moment
// access_status flips to 'premium' server-side. checkForPremiumTransition
// only returns true once per real transition (see lib/subscription.ts) —
// re-fetching the same 'premium' status on every later app open never
// re-triggers this.
//
// No auto-dismiss timer, unlike the flashcard-deck celebration — this is a
// once-ever moment worth letting the student actually read, not a repeated
// action that needs to get out of the way quickly.
export function PremiumWelcomeOverlay() {
  const { user } = useAuth();
  const accessStatusQuery = useAccessStatus();
  const tour = useTour();
  const COLORS = useThemeColors();
  const [celebrating, setCelebrating] = useState(false);
  // Detecting the transition and showing the celebration for it are
  // deliberately split — checkForPremiumTransition consumes (marks as
  // seen) the transition the moment it's detected, so that part can't
  // just be skipped while the tour is active without losing the
  // celebration entirely. This flag holds the "yes, show it" verdict until
  // it's actually safe to.
  const [pendingCelebration, setPendingCelebration] = useState(false);

  useEffect(() => {
    if (!user || !accessStatusQuery.data) {
      return;
    }
    checkForPremiumTransition(user.id, accessStatusQuery.data).then((justBecamePremium) => {
      if (justBecamePremium) {
        setPendingCelebration(true);
      }
    });
  }, [user, accessStatusQuery.data]);

  // TourOverlay and this overlay both render at Z_INDEX.modal + 10 with no
  // mutual awareness — without this, an account that becomes Premium while
  // its guided tour is active (or replays the tour from Réglages right
  // after becoming Premium) could get both full-screen modals stacked at
  // once. Holding the celebration until the tour finishes guarantees it's
  // still shown, just not on top of/interrupting the tour.
  useEffect(() => {
    if (pendingCelebration && !tour.active) {
      playAchievementSound();
      setCelebrating(true);
      setPendingCelebration(false);
    }
  }, [pendingCelebration, tour.active]);

  if (!celebrating) {
    return null;
  }

  const styles = StyleSheet.create({
    overlay: {
      ...StyleSheet.absoluteFillObject,
      alignItems: 'center',
      justifyContent: 'center',
      backgroundColor: 'rgba(0,0,0,0.45)',
      padding: SPACING.screen,
      zIndex: Z_INDEX.modal + 10,
    },
    card: {
      width: '100%',
      maxWidth: 360,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.section,
      alignItems: 'center',
    },
    iconBadge: {
      width: 64,
      height: 64,
      borderRadius: 32,
      backgroundColor: 'rgba(201,151,31,0.16)',
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: SPACING.tight,
    },
    title: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
      textAlign: 'center',
      marginBottom: 8,
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      textAlign: 'center',
      marginBottom: SPACING.element,
    },
    button: {
      backgroundColor: '#C9971F',
      borderRadius: PILL_RADIUS,
      paddingVertical: 14,
      paddingHorizontal: 32,
    },
    buttonText: {
      color: '#3A2A00',
      fontSize: 16,
      fontWeight: '700',
    },
  });

  return (
    <View style={styles.overlay}>
      <CelebrationBurst />
      <Animated.View entering={FadeIn.duration(250)} style={styles.card}>
        <View style={styles.iconBadge}>
          <IconSymbol name="crown.fill" size={32} color="#C9971F" />
        </View>
        <ThemedText style={styles.title}>Bienvenue dans Premium !</ThemedText>
        <ThemedText style={styles.subtitle}>
          Ton accès à l’IA est désormais illimité — évaluations, corrections de devoirs et préparations de contrôle,
          sans compter. Merci de soutenir Noesis 🎉
        </ThemedText>
        <BouncyPressable style={styles.button} onPress={() => setCelebrating(false)}>
          <ThemedText style={styles.buttonText}>Commencer</ThemedText>
        </BouncyPressable>
      </Animated.View>
    </View>
  );
}
