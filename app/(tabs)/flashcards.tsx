import { useBottomTabBarHeight } from '@react-navigation/bottom-tabs';
import Ionicons from '@expo/vector-icons/Ionicons';
import * as ImagePicker from 'expo-image-picker';
import { Link, router } from 'expo-router';
import { useRef, useState } from 'react';
import { Image, ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { ErrorState } from '@/components/ui/error-state';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { SkeletonList } from '@/components/ui/skeleton';
import { FEEDBACK_COLORS, PILL_RADIUS, RADIUS, SPACING, STATUS_COLORS, TYPOGRAPHY } from '@/constants/design';
import { useFlashcardDecks, useGenerateFlashcards } from '@/hooks/queries/use-flashcards';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { assetToDataUrl } from '@/lib/image-capture';

const MAX_CAPTURED_PHOTOS = 5;

// Cycled per deck row so a long list doesn't read as one flat color block —
// decks have no subject/category to derive a color from (see below).
const DECK_COLORS = [STATUS_COLORS.info, '#8B6FF0', FEEDBACK_COLORS.correct, STATUS_COLORS.warning, STATUS_COLORS.error];

export default function FlashcardsScreen() {
  const COLORS = useThemeColors();
  const tabBarHeight = useBottomTabBarHeight();
  const decksQuery = useFlashcardDecks();
  const decks = decksQuery.data ?? [];
  const [showScanOptions, setShowScanOptions] = useState(false);
  // Photos accumulate here across as many camera shots / library picks as
  // needed (up to MAX_CAPTURED_PHOTOS) — generation only fires once the user
  // confirms they're done, via handleFinishCapture. Previously the camera
  // button generated immediately after a single shot, so multi-page notes
  // could never become one fiche.
  const [capturedPhotos, setCapturedPhotos] = useState<string[]>([]);
  const [error, setError] = useState<string | null>(null);
  const generateMutation = useGenerateFlashcards();

  const handleToggleScanOptions = () => {
    setShowScanOptions((previous) => !previous);
    setCapturedPhotos([]);
    setError(null);
  };

  const handleTakePhoto = async () => {
    if (capturedPhotos.length >= MAX_CAPTURED_PHOTOS) {
      return;
    }
    const permission = await ImagePicker.requestCameraPermissionsAsync();
    if (!permission.granted) {
      setError("Autorise l'accès à l'appareil photo pour scanner un document.");
      return;
    }
    const result = await ImagePicker.launchCameraAsync({ quality: 0.7 });
    if (result.canceled) {
      return;
    }
    const dataUrl = await assetToDataUrl(result.assets[0]);
    if (dataUrl) {
      setError(null);
      setCapturedPhotos((previous) => [...previous, dataUrl].slice(0, MAX_CAPTURED_PHOTOS));
    }
  };

  const handlePickFromLibrary = async () => {
    const permission = await ImagePicker.requestMediaLibraryPermissionsAsync();
    if (!permission.granted) {
      setError("Autorise l'accès à tes photos pour scanner un document.");
      return;
    }
    const result = await ImagePicker.launchImageLibraryAsync({
      quality: 0.7,
      allowsMultipleSelection: true,
      selectionLimit: MAX_CAPTURED_PHOTOS - capturedPhotos.length,
    });
    if (result.canceled) {
      return;
    }
    const dataUrls = (await Promise.all(result.assets.map(assetToDataUrl))).filter(
      (value): value is string => value !== null,
    );
    setError(null);
    setCapturedPhotos((previous) => [...previous, ...dataUrls].slice(0, MAX_CAPTURED_PHOTOS));
  };

  const handleRemoveCapturedPhoto = (index: number) => {
    setCapturedPhotos((previous) => previous.filter((_, photoIndex) => photoIndex !== index));
  };

  // generateMutation.isPending isn't enough on its own to block a second
  // tap — it doesn't flip true until React commits the next render, so a
  // fast double-tap before that could fire mutateAsync twice concurrently
  // for the same photos, producing two identical decks and double-billing
  // the AI generation cost for one submission. This ref is checked
  // synchronously, before that render, so it actually blocks it.
  const isGeneratingRef = useRef(false);

  const handleFinishCapture = async () => {
    if (capturedPhotos.length === 0 || isGeneratingRef.current) {
      return;
    }
    isGeneratingRef.current = true;
    setError(null);
    try {
      const result = await generateMutation.mutateAsync(capturedPhotos);

      if ('error' in result) {
        setError(result.error);
        return;
      }
      // Only clear/close on success — doing this unconditionally meant a
      // failed generation (network blip, daily limit) both threw away
      // every captured page AND hid the review UI needed to retry with
      // them, forcing a full re-scan for something that had nothing to do
      // with the photos.
      setCapturedPhotos([]);
      setShowScanOptions(false);
      router.push({ pathname: '/flashcard-deck', params: { id: result.deckId } });
    } finally {
      isGeneratingRef.current = false;
    }
  };

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    scrollContent: {
      padding: SPACING.screen,
    },
    header: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      marginBottom: SPACING.element,
    },
    title: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      marginTop: 4,
    },
    addButton: {
      width: 40,
      height: 40,
      borderRadius: 20,
      backgroundColor: COLORS.accent,
      alignItems: 'center',
      justifyContent: 'center',
    },
    statsRow: {
      flexDirection: 'row',
      gap: SPACING.tight,
      marginBottom: SPACING.section,
    },
    statCard: {
      flex: 1,
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      ...cardBorder(COLORS),
    },
    statBadge: {
      width: 36,
      height: 36,
      borderRadius: 12,
      alignItems: 'center',
      justifyContent: 'center',
    },
    statNumber: {
      fontSize: 18,
      fontWeight: '800',
      color: COLORS.text,
    },
    statLabel: {
      fontSize: 11,
      color: COLORS.mutedText,
    },
    sectionTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      marginBottom: SPACING.tight,
    },
    scanCard: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.element,
      ...cardBorder(COLORS),
    },
    scanTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      marginBottom: 4,
    },
    scanSubtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      marginBottom: SPACING.element,
    },
    scanButton: {
      backgroundColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 14,
      alignItems: 'center',
      marginBottom: SPACING.tight,
    },
    scanButtonText: {
      color: COLORS.accentText,
      fontSize: 15,
      fontWeight: '700',
    },
    scanButtonSecondary: {
      borderWidth: 1.5,
      borderColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 14,
      alignItems: 'center',
    },
    scanButtonSecondaryText: {
      color: COLORS.accent,
      fontSize: 15,
      fontWeight: '700',
    },
    scanButtonDisabled: {
      opacity: 0.5,
    },
    capturedRow: {
      flexDirection: 'row',
      flexWrap: 'wrap',
      gap: SPACING.tight,
      marginBottom: SPACING.element,
    },
    capturedThumbWrap: {
      position: 'relative',
    },
    capturedThumb: {
      width: 64,
      height: 64,
      borderRadius: 12,
      backgroundColor: COLORS.lockedBackground,
    },
    capturedRemoveButton: {
      position: 'absolute',
      top: -6,
      right: -6,
      width: 22,
      height: 22,
      borderRadius: 11,
      backgroundColor: COLORS.danger,
      alignItems: 'center',
      justifyContent: 'center',
    },
    error: {
      color: COLORS.danger,
      marginBottom: SPACING.element,
    },
    deckCard: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.tight,
      ...cardBorder(COLORS),
    },
    deckIcon: {
      width: 40,
      height: 40,
      borderRadius: 12,
      alignItems: 'center',
      justifyContent: 'center',
    },
    deckTextCol: {
      flex: 1,
    },
    deckTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
    },
    deckSubtitle: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
      marginTop: 4,
    },
    onboardingCard: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS + 6,
      padding: SPACING.section,
      alignItems: 'center',
      ...cardBorder(COLORS),
    },
    onboardingStepsRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      marginBottom: SPACING.element,
    },
    onboardingStepBadge: {
      width: 64,
      height: 64,
      borderRadius: 32,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
    },
    onboardingStepEmoji: {
      fontSize: 28,
    },
    onboardingTitle: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
      textAlign: 'center',
      marginBottom: 6,
    },
    onboardingDescription: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      textAlign: 'center',
      marginBottom: SPACING.element,
    },
    onboardingButton: {
      backgroundColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 14,
      paddingHorizontal: 28,
    },
    onboardingButtonText: {
      color: COLORS.accentText,
      fontSize: 15,
      fontWeight: '700',
    },
  });

  return (
    <ScreenBackground>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <ScrollView contentContainerStyle={[styles.scrollContent, { paddingBottom: tabBarHeight + 24 }]}>
          <View style={styles.header}>
            <View>
              <ThemedText style={styles.title}>Fiches</ThemedText>
              <ThemedText style={styles.subtitle}>Tes fiches créées à partir de tes notes scannées.</ThemedText>
            </View>
            <BouncyPressable style={styles.addButton} onPress={handleToggleScanOptions} hitSlop={8}>
              <IconSymbol name="plus" size={20} color={COLORS.accentText} />
            </BouncyPressable>
          </View>

          {decksQuery.isSuccess && decks.length > 0 ? (
            <View style={styles.statsRow}>
              <View style={styles.statCard}>
                <View style={[styles.statBadge, { backgroundColor: STATUS_COLORS.info }]}>
                  <Ionicons name="documents" size={16} color="#FFFFFF" />
                </View>
                <View>
                  <ThemedText style={styles.statNumber}>{decks.length}</ThemedText>
                  <ThemedText style={styles.statLabel}>Fiches créées</ThemedText>
                </View>
              </View>
              <View style={styles.statCard}>
                <View style={[styles.statBadge, { backgroundColor: '#8B6FF0' }]}>
                  <Ionicons name="albums" size={16} color="#FFFFFF" />
                </View>
                <View>
                  <ThemedText style={styles.statNumber}>{decks.reduce((sum, deck) => sum + deck.cardCount, 0)}</ThemedText>
                  <ThemedText style={styles.statLabel}>Cartes au total</ThemedText>
                </View>
              </View>
            </View>
          ) : null}

          {showScanOptions ? (
            <ThemedView style={styles.scanCard}>
              <ThemedText style={styles.scanTitle}>Scanner un document</ThemedText>
              <ThemedText style={styles.scanSubtitle}>
                {capturedPhotos.length === 0
                  ? 'Prends en photo tes notes ou choisis-en depuis ta galerie — plusieurs pages possibles pour une même fiche.'
                  : `${capturedPhotos.length} photo${capturedPhotos.length > 1 ? 's' : ''} prête${capturedPhotos.length > 1 ? 's' : ''}. Ajoute une page ou génère la fiche.`}
              </ThemedText>

              {capturedPhotos.length > 0 ? (
                <View style={styles.capturedRow}>
                  {capturedPhotos.map((photo, index) => (
                    <View key={index} style={styles.capturedThumbWrap}>
                      <Image source={{ uri: photo }} style={styles.capturedThumb} />
                      <BouncyPressable
                        style={styles.capturedRemoveButton}
                        onPress={() => handleRemoveCapturedPhoto(index)}
                        hitSlop={8}>
                        <IconSymbol name="xmark" size={12} color="#FFFFFF" />
                      </BouncyPressable>
                    </View>
                  ))}
                </View>
              ) : null}

              <BouncyPressable
                style={[styles.scanButton, capturedPhotos.length >= MAX_CAPTURED_PHOTOS && styles.scanButtonDisabled]}
                onPress={handleTakePhoto}
                disabled={capturedPhotos.length >= MAX_CAPTURED_PHOTOS}>
                <ThemedText style={styles.scanButtonText}>
                  {capturedPhotos.length === 0 ? 'Prendre une photo' : 'Ajouter une autre page'}
                </ThemedText>
              </BouncyPressable>
              <BouncyPressable
                style={[
                  styles.scanButtonSecondary,
                  capturedPhotos.length >= MAX_CAPTURED_PHOTOS && styles.scanButtonDisabled,
                ]}
                onPress={handlePickFromLibrary}
                disabled={capturedPhotos.length >= MAX_CAPTURED_PHOTOS}>
                <ThemedText style={styles.scanButtonSecondaryText}>Choisir depuis la galerie</ThemedText>
              </BouncyPressable>

              {capturedPhotos.length > 0 ? (
                <BouncyPressable style={styles.scanButton} onPress={handleFinishCapture}>
                  <ThemedText style={styles.scanButtonText}>
                    Générer la fiche ({capturedPhotos.length})
                  </ThemedText>
                </BouncyPressable>
              ) : null}
            </ThemedView>
          ) : null}

          {generateMutation.isPending ? (
            <ThemedView style={styles.scanCard}>
              <ThemedText style={styles.scanTitle}>Génération en cours...</ThemedText>
              <ThemedText style={styles.scanSubtitle}>Ça peut prendre quelques secondes.</ThemedText>
            </ThemedView>
          ) : null}

          {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}

          {decksQuery.isPending ? <SkeletonList count={3} cardHeight={72} /> : null}

          {decksQuery.isError ? (
            <ErrorState title="Impossible de charger tes fiches" onRetry={() => decksQuery.refetch()} />
          ) : null}

          {decksQuery.isSuccess && decks.length === 0 && !showScanOptions && !generateMutation.isPending ? (
            <ThemedView style={styles.onboardingCard}>
              <View style={styles.onboardingStepsRow}>
                <View style={styles.onboardingStepBadge}>
                  <ThemedText style={styles.onboardingStepEmoji}>📸</ThemedText>
                </View>
                <IconSymbol name="chevron.right" size={20} color={COLORS.mutedText} />
                <View style={styles.onboardingStepBadge}>
                  <ThemedText style={styles.onboardingStepEmoji}>📝</ThemedText>
                </View>
              </View>
              <ThemedText style={styles.onboardingTitle}>Aucune fiche pour l&apos;instant</ThemedText>
              <ThemedText style={styles.onboardingDescription}>
                Prends en photo tes notes manuscrites, Noesis en fait une fiche de révision.
              </ThemedText>
              <BouncyPressable style={styles.onboardingButton} onPress={() => setShowScanOptions(true)}>
                <ThemedText style={styles.onboardingButtonText}>Scanner mes notes</ThemedText>
              </BouncyPressable>
            </ThemedView>
          ) : null}

          {decks.length > 0 ? <ThemedText style={styles.sectionTitle}>Tes fiches</ThemedText> : null}
          {decks.map((deck, index) => (
            <Link key={deck.id} href={{ pathname: '/flashcard-deck', params: { id: deck.id } }} asChild>
              <BouncyPressable style={styles.deckCard}>
                <View style={[styles.deckIcon, { backgroundColor: DECK_COLORS[index % DECK_COLORS.length] }]}>
                  <Ionicons name="document-text" size={18} color="#FFFFFF" />
                </View>
                <View style={styles.deckTextCol}>
                  <ThemedText style={styles.deckTitle}>{deck.title}</ThemedText>
                  <ThemedText style={styles.deckSubtitle}>
                    {deck.cardCount} carte{deck.cardCount > 1 ? 's' : ''} ·{' '}
                    {deck.createdAt.toLocaleDateString('fr-FR', { day: 'numeric', month: 'short', year: 'numeric' })}
                  </ThemedText>
                </View>
                <IconSymbol name="chevron.right" size={16} color={COLORS.mutedText} />
              </BouncyPressable>
            </Link>
          ))}
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
