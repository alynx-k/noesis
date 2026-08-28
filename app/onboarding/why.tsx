import { LinearGradient } from 'expo-linear-gradient';
import { router } from 'expo-router';
import { useState } from 'react';
import { LayoutChangeEvent, NativeScrollEvent, NativeSyntheticEvent, ScrollView, StyleSheet, View } from 'react-native';
import Animated, { FadeInDown } from 'react-native-reanimated';

import { OnboardingHeader } from '@/components/onboarding-header';
import { ThemedText } from '@/components/themed-text';
import { Button } from '@/components/ui/button';
import { IconSymbol, IconSymbolName } from '@/components/ui/icon-symbol';
import { Screen } from '@/components/ui/screen';
import { GRADIENTS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useThemeColors } from '@/hooks/use-theme-colors';

// Each reason maps to a feature that genuinely exists in the app (fiches =
// flashcards, séries = streak, assistant IA = ai-chat/homework help,
// statistiques = achievements/progress, sessions = focus-session, séries et
// badges = the XP/achievements system) — no invented capability. Each gets
// its own gradient (not all the same accent violet) so the carousel reads
// as distinct ideas rather than one repeated icon.
const REASONS: { icon: IconSymbolName; gradient: readonly [string, string, ...string[]]; title: string; description: string }[] = [
  {
    icon: 'doc.text.fill',
    gradient: GRADIENTS.badgeAzure,
    title: 'Ne perds plus de temps à chercher',
    description: 'Toutes tes fiches de révision, organisées par matière, au même endroit.',
  },
  {
    icon: 'clock.arrow.circlepath',
    gradient: GRADIENTS.badgeMint,
    title: 'Progresse chaque jour, sans y penser',
    description: 'Des séries de révision qui te tiennent motivé sur la durée, pas juste un jour.',
  },
  {
    icon: 'sparkles',
    gradient: GRADIENTS.badgeViolet,
    title: 'Un prof particulier, 24h/24',
    description: "Pose tes questions et prépare tes devoirs avec l'assistant IA, à toute heure.",
  },
  {
    icon: 'trophy.fill',
    gradient: GRADIENTS.gold,
    title: 'Sache exactement où tu en es',
    description: 'Des statistiques claires qui montrent tes points forts et ce qui reste à travailler.',
  },
  {
    icon: 'flame.fill',
    gradient: GRADIENTS.fire,
    title: 'Reste concentré, sans distraction',
    description: 'Des sessions de concentration chronométrées pour avancer sans te disperser.',
  },
  {
    icon: 'checkmark.circle.fill',
    gradient: GRADIENTS.badge,
    title: 'Vois tes efforts récompensés',
    description: 'Objectifs, séries et badges qui rendent ta progression visible, jour après jour.',
  },
];

export default function OnboardingWhyScreen() {
  const COLORS = useThemeColors();
  const [activeIndex, setActiveIndex] = useState(0);
  // Measured from the actual rendered container instead of guessed from
  // Dimensions.get('window') — the window width doesn't account for the
  // Screen component's own padding (or a centered max-width on wide/web
  // viewports), so a guessed slide width drifted narrower than the real
  // scroll container and let the next slide peek in.
  const [carouselWidth, setCarouselWidth] = useState(0);

  const handleCarouselLayout = (event: LayoutChangeEvent) => {
    setCarouselWidth(event.nativeEvent.layout.width);
  };

  const handleScroll = (event: NativeSyntheticEvent<NativeScrollEvent>) => {
    if (!carouselWidth) {
      return;
    }
    const index = Math.round(event.nativeEvent.contentOffset.x / carouselWidth);
    if (index !== activeIndex) {
      setActiveIndex(index);
    }
  };

  const styles = StyleSheet.create({
    title: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
      marginBottom: 8,
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      marginBottom: SPACING.section,
    },
    carousel: {
      flex: 1,
    },
    slide: {
      width: carouselWidth,
      alignItems: 'center',
      justifyContent: 'center',
      paddingHorizontal: SPACING.tight,
    },
    iconBadge: {
      width: 88,
      height: 88,
      borderRadius: 44,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: SPACING.section,
    },
    slideTitle: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
      textAlign: 'center',
      marginBottom: SPACING.tight,
    },
    slideDescription: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      textAlign: 'center',
    },
    dots: {
      flexDirection: 'row',
      justifyContent: 'center',
      gap: 8,
      marginVertical: SPACING.element,
    },
    dot: {
      width: 8,
      height: 8,
      borderRadius: 4,
      backgroundColor: COLORS.border,
    },
    dotActive: {
      width: 20,
      backgroundColor: COLORS.accent,
    },
  });

  return (
    <Screen>
      <OnboardingHeader step={1} totalSteps={8} />
      <Animated.View entering={FadeInDown.duration(400)} style={{ flex: 1 }}>
        <ThemedText style={styles.title}>Pourquoi utiliser noesis ?</ThemedText>
        <ThemedText style={styles.subtitle}>Tout ce qu&apos;il te faut pour progresser efficacement.</ThemedText>

        <ScrollView
          horizontal
          pagingEnabled
          showsHorizontalScrollIndicator={false}
          onLayout={handleCarouselLayout}
          onMomentumScrollEnd={handleScroll}
          decelerationRate="fast"
          style={styles.carousel}>
          {REASONS.map((reason) => (
            <View key={reason.title} style={styles.slide}>
              <LinearGradient colors={reason.gradient} style={styles.iconBadge}>
                <IconSymbol name={reason.icon} size={40} color="#FFFFFF" />
              </LinearGradient>
              <ThemedText style={styles.slideTitle}>{reason.title}</ThemedText>
              <ThemedText style={styles.slideDescription}>{reason.description}</ThemedText>
            </View>
          ))}
        </ScrollView>

        <View style={styles.dots}>
          {REASONS.map((reason, index) => (
            <View key={reason.title} style={[styles.dot, index === activeIndex && styles.dotActive]} />
          ))}
        </View>

        <Button label="Suivant" onPress={() => router.push('/onboarding/niveau')} />
      </Animated.View>
    </Screen>
  );
}
