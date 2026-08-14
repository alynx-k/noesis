import { router, useLocalSearchParams } from 'expo-router';
import { useEffect, useState } from 'react';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { interpolate, useAnimatedStyle, useSharedValue, withTiming } from 'react-native-reanimated';

import { AiTutorChat } from '@/components/ai-tutor-chat';
import { BouncyPressable } from '@/components/bouncy-pressable';
import { DataTable } from '@/components/data-table';
import { GridBackground } from '@/components/grid-background';
import { HighlightedText } from '@/components/highlighted-text';
import { ThemedText } from '@/components/themed-text';
import { ScreenBackground } from '@/components/screen-background';
import { ErrorState } from '@/components/ui/error-state';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { SkeletonText } from '@/components/ui/skeleton';
import { PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useDeckCards, useDeckFiche } from '@/hooks/queries/use-flashcards';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { Fiche } from '@/lib/flashcards';

type Tab = 'fiche' | 'cartes';

function FicheView({ fiche }: { fiche: Fiche }) {
  const COLORS = useThemeColors();
  const ficheStyles = StyleSheet.create({
    scrollContent: {
      padding: SPACING.screen,
      paddingBottom: 40,
    },
    chapter: {
      marginBottom: SPACING.element,
    },
    chapterTitle: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
      marginBottom: 4,
    },
    chapterIntro: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      fontStyle: 'italic',
      marginBottom: SPACING.element,
    },
    section: {
      marginBottom: SPACING.element,
    },
    heading: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.accent,
      marginBottom: 6,
    },
    body: {
      ...TYPOGRAPHY.body,
      color: COLORS.text,
    },
    highlight: {
      ...TYPOGRAPHY.body,
      color: COLORS.accent,
      fontWeight: '700',
    },
    callout: {
      marginTop: SPACING.tight,
      backgroundColor: '#FBF1DE',
      borderRadius: RADIUS,
      padding: SPACING.element,
    },
    calloutText: {
      ...TYPOGRAPHY.body,
      color: '#6B4A1E',
    },
    separator: {
      borderTopWidth: 1,
      borderTopColor: COLORS.border,
      borderStyle: 'dashed',
      marginTop: SPACING.element,
    },
    empty: {
      flex: 1,
      alignItems: 'center',
      justifyContent: 'center',
      padding: SPACING.screen,
    },
    emptyText: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      textAlign: 'center',
    },
  });

  if (fiche.chapters.length === 0) {
    return (
      <View style={ficheStyles.empty}>
        <ThemedText style={ficheStyles.emptyText}>Aucune fiche de révision pour ce paquet.</ThemedText>
      </View>
    );
  }

  return (
    <ScrollView contentContainerStyle={ficheStyles.scrollContent}>
      {fiche.chapters.map((chapter, chapterIndex) => (
        <View key={chapterIndex} style={ficheStyles.chapter}>
          <ThemedText style={ficheStyles.chapterTitle}>{chapter.title}</ThemedText>
          {chapter.intro ? <ThemedText style={ficheStyles.chapterIntro}>{chapter.intro}</ThemedText> : null}

          {chapter.sections.map((section, sectionIndex) => (
            <View key={sectionIndex} style={ficheStyles.section}>
              <ThemedText style={ficheStyles.heading}>{section.heading}</ThemedText>
              <HighlightedText
                text={section.body}
                highlights={section.highlights}
                style={ficheStyles.body}
                highlightStyle={ficheStyles.highlight}
              />
              {section.table ? <DataTable table={section.table} /> : null}
              {section.callout ? (
                <View style={ficheStyles.callout}>
                  <ThemedText style={ficheStyles.calloutText}>💜 À retenir : {section.callout}</ThemedText>
                </View>
              ) : null}
            </View>
          ))}

          {chapterIndex < fiche.chapters.length - 1 ? <View style={ficheStyles.separator} /> : null}
        </View>
      ))}
    </ScrollView>
  );
}

export default function FlashcardDeckScreen() {
  const COLORS = useThemeColors();
  const { id } = useLocalSearchParams<{ id: string }>();
  const cardsQuery = useDeckCards(id ?? '');
  const ficheQuery = useDeckFiche(id ?? '');
  const cards = cardsQuery.data ?? [];
  const fiche = ficheQuery.data ?? null;
  const loading = cardsQuery.isPending || ficheQuery.isPending;
  const isError = cardsQuery.isError || ficheQuery.isError;

  const [tab, setTab] = useState<Tab>('fiche');
  const [tabInitialized, setTabInitialized] = useState(false);
  const [index, setIndex] = useState(0);
  const [tutorVisible, setTutorVisible] = useState(false);
  const flip = useSharedValue(0);

  // Default to whichever tab actually has content, decided once the fiche
  // query resolves — after that the student's own tab choice takes over.
  useEffect(() => {
    if (!tabInitialized && ficheQuery.isSuccess) {
      setTab(fiche && fiche.chapters.length > 0 ? 'fiche' : 'cartes');
      setTabInitialized(true);
    }
  }, [ficheQuery.isSuccess, fiche, tabInitialized]);

  useEffect(() => {
    flip.value = 0;
  }, [index, flip]);

  const frontStyle = useAnimatedStyle(() => ({
    transform: [{ rotateY: `${interpolate(flip.value, [0, 1], [0, 180])}deg` }],
  }));
  const backStyle = useAnimatedStyle(() => ({
    transform: [{ rotateY: `${interpolate(flip.value, [0, 1], [180, 360])}deg` }],
  }));

  const handleFlip = () => {
    flip.value = withTiming(flip.value === 0 ? 1 : 0, { duration: 400 });
  };

  const handlePrevious = () => {
    setIndex((previous) => Math.max(previous - 1, 0));
  };

  const handleNext = () => {
    setIndex((previous) => Math.min(previous + 1, cards.length - 1));
  };

  const currentCard = cards[index];
  const hasFiche = !!fiche && fiche.chapters.length > 0;

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    header: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      paddingHorizontal: SPACING.screen,
      paddingTop: SPACING.tight,
      paddingBottom: SPACING.tight,
    },
    backButton: {
      width: 36,
      height: 36,
      borderRadius: 18,
      backgroundColor: COLORS.surface,
      alignItems: 'center',
      justifyContent: 'center',
      borderWidth: 1.5,
      borderColor: COLORS.borderStrong,
    },
    backIcon: {
      transform: [{ scaleX: -1 }],
    },
    progress: {
      ...TYPOGRAPHY.label,
      color: COLORS.mutedText,
    },
    tabRow: {
      flexDirection: 'row',
      gap: SPACING.tight,
      paddingHorizontal: SPACING.screen,
      paddingBottom: SPACING.element,
    },
    tabButton: {
      flex: 1,
      paddingVertical: 10,
      borderRadius: PILL_RADIUS,
      alignItems: 'center',
      backgroundColor: COLORS.surface,
      borderWidth: 1.5,
      borderColor: COLORS.borderStrong,
    },
    tabButtonActive: {
      backgroundColor: COLORS.accent,
      borderColor: COLORS.accent,
    },
    tabButtonText: {
      fontSize: 14,
      fontWeight: '700',
      color: COLORS.text,
    },
    tabButtonTextActive: {
      color: COLORS.accentText,
    },
    centered: {
      flex: 1,
      alignItems: 'center',
      justifyContent: 'center',
      padding: SPACING.screen,
    },
    cardWrapper: {
      width: '100%',
      height: 320,
      marginBottom: SPACING.section,
    },
    card: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.section,
      alignItems: 'center',
      justifyContent: 'center',
      ...cardBorder(COLORS),
    },
    cardFace: {
      position: 'absolute',
      width: '100%',
      height: '100%',
      backfaceVisibility: 'hidden',
    },
    cardBack: {
      backgroundColor: COLORS.accent,
    },
    cardLabel: {
      ...TYPOGRAPHY.label,
      color: COLORS.mutedText,
      textTransform: 'uppercase',
      marginBottom: SPACING.element,
    },
    cardText: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
      textAlign: 'center',
    },
    cardLabelOnAccent: {
      color: COLORS.accentText,
      opacity: 0.85,
    },
    cardTextOnAccent: {
      color: COLORS.accentText,
    },
    tapHint: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
      position: 'absolute',
      bottom: SPACING.element,
    },
    navRow: {
      flexDirection: 'row',
      gap: SPACING.tight,
    },
    navButton: {
      backgroundColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 14,
      paddingHorizontal: 28,
    },
    navButtonDisabled: {
      opacity: 0.4,
    },
    navButtonText: {
      color: COLORS.accentText,
      fontSize: 15,
      fontWeight: '700',
    },
    emptyText: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      textAlign: 'center',
    },
  });

  return (
    <ScreenBackground>
      <GridBackground />
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <View style={styles.header}>
          <BouncyPressable style={styles.backButton} onPress={() => router.back()} hitSlop={8}>
            <IconSymbol name="chevron.right" size={18} color={COLORS.text} style={styles.backIcon} />
          </BouncyPressable>
          {tab === 'cartes' && cards.length > 0 ? (
            <ThemedText style={styles.progress}>
              {index + 1}/{cards.length}
            </ThemedText>
          ) : (
            <View />
          )}
          <BouncyPressable style={styles.backButton} onPress={() => setTutorVisible(true)} hitSlop={8}>
            <IconSymbol name="sparkles" size={18} color={COLORS.accent} />
          </BouncyPressable>
        </View>

        {loading ? (
          <View style={styles.centered}>
            <SkeletonText lines={4} />
          </View>
        ) : null}

        {isError ? (
          <ErrorState
            title="Impossible de charger ce paquet"
            onRetry={() => {
              cardsQuery.refetch();
              ficheQuery.refetch();
            }}
          />
        ) : null}

        {!loading && !isError ? (
          <View style={styles.tabRow}>
            <BouncyPressable
              style={[styles.tabButton, tab === 'fiche' && styles.tabButtonActive]}
              onPress={() => setTab('fiche')}>
              <ThemedText style={[styles.tabButtonText, tab === 'fiche' && styles.tabButtonTextActive]}>
                Fiche révision
              </ThemedText>
            </BouncyPressable>
            <BouncyPressable
              style={[styles.tabButton, tab === 'cartes' && styles.tabButtonActive]}
              onPress={() => setTab('cartes')}>
              <ThemedText style={[styles.tabButtonText, tab === 'cartes' && styles.tabButtonTextActive]}>
                Cartes mémos
              </ThemedText>
            </BouncyPressable>
          </View>
        ) : null}

        {!loading && !isError && tab === 'fiche' ? (
          hasFiche ? (
            <FicheView fiche={fiche as Fiche} />
          ) : (
            <View style={styles.centered}>
              <ThemedText style={styles.emptyText}>Aucune fiche de révision pour ce paquet.</ThemedText>
            </View>
          )
        ) : null}

        {!loading && !isError && tab === 'cartes' && currentCard ? (
          <View style={styles.centered}>
            <BouncyPressable onPress={handleFlip} style={styles.cardWrapper}>
              <Animated.View style={[styles.card, styles.cardFace, frontStyle]}>
                <ThemedText style={styles.cardLabel}>Question</ThemedText>
                <ThemedText style={styles.cardText}>{currentCard.question}</ThemedText>
                <ThemedText style={styles.tapHint}>Touche pour voir la réponse</ThemedText>
              </Animated.View>
              <Animated.View style={[styles.card, styles.cardFace, styles.cardBack, backStyle]}>
                <ThemedText style={[styles.cardLabel, styles.cardLabelOnAccent]}>Réponse</ThemedText>
                <ThemedText style={[styles.cardText, styles.cardTextOnAccent]}>{currentCard.answer}</ThemedText>
                <ThemedText style={[styles.tapHint, styles.cardTextOnAccent]}>
                  Touche pour revenir à la question
                </ThemedText>
              </Animated.View>
            </BouncyPressable>

            <View style={styles.navRow}>
              <BouncyPressable
                style={[styles.navButton, index === 0 && styles.navButtonDisabled]}
                onPress={handlePrevious}
                disabled={index === 0}>
                <ThemedText style={styles.navButtonText}>Précédent</ThemedText>
              </BouncyPressable>
              <BouncyPressable
                style={[styles.navButton, index === cards.length - 1 && styles.navButtonDisabled]}
                onPress={handleNext}
                disabled={index === cards.length - 1}>
                <ThemedText style={styles.navButtonText}>Suivant</ThemedText>
              </BouncyPressable>
            </View>
          </View>
        ) : null}

        {!loading && !isError && tab === 'cartes' && cards.length === 0 ? (
          <View style={styles.centered}>
            <ThemedText style={styles.emptyText}>Ce paquet ne contient aucune carte mémo.</ThemedText>
          </View>
        ) : null}
      </SafeAreaView>

      {id ? (
        <AiTutorChat
          visible={tutorVisible}
          onClose={() => setTutorVisible(false)}
          context={{ type: 'fiche', deckId: id }}
        />
      ) : null}
    </ScreenBackground>
  );
}
