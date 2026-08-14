import { useBottomTabBarHeight } from '@react-navigation/bottom-tabs';
import * as ImagePicker from 'expo-image-picker';
import { Link, router } from 'expo-router';
import { useState } from 'react';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { EmptyState } from '@/components/ui/empty-state';
import { ErrorState } from '@/components/ui/error-state';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { SkeletonList } from '@/components/ui/skeleton';
import { PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useFlashcardDecks, useGenerateFlashcards } from '@/hooks/queries/use-flashcards';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

function toDataUrl(asset: ImagePicker.ImagePickerAsset): string | null {
  if (!asset.base64) {
    return null;
  }
  const mimeType = asset.mimeType ?? 'image/jpeg';
  return `data:${mimeType};base64,${asset.base64}`;
}

export default function FlashcardsScreen() {
  const COLORS = useThemeColors();
  const tabBarHeight = useBottomTabBarHeight();
  const decksQuery = useFlashcardDecks();
  const decks = decksQuery.data ?? [];
  const [showScanOptions, setShowScanOptions] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const generateMutation = useGenerateFlashcards();

  const handleGenerate = async (images: string[]) => {
    if (images.length === 0) {
      return;
    }
    setShowScanOptions(false);
    setError(null);
    const result = await generateMutation.mutateAsync(images);

    if ('error' in result) {
      setError(result.error);
      return;
    }
    router.push({ pathname: '/flashcard-deck', params: { id: result.deckId } });
  };

  const handleTakePhoto = async () => {
    const permission = await ImagePicker.requestCameraPermissionsAsync();
    if (!permission.granted) {
      setError("Autorise l'accès à l'appareil photo pour scanner un document.");
      return;
    }
    const result = await ImagePicker.launchCameraAsync({ base64: true, quality: 0.7 });
    if (result.canceled) {
      return;
    }
    const dataUrl = toDataUrl(result.assets[0]);
    if (dataUrl) {
      handleGenerate([dataUrl]);
    }
  };

  const handlePickFromLibrary = async () => {
    const permission = await ImagePicker.requestMediaLibraryPermissionsAsync();
    if (!permission.granted) {
      setError("Autorise l'accès à tes photos pour scanner un document.");
      return;
    }
    const result = await ImagePicker.launchImageLibraryAsync({
      base64: true,
      quality: 0.7,
      allowsMultipleSelection: true,
      selectionLimit: 5,
    });
    if (result.canceled) {
      return;
    }
    const dataUrls = result.assets.map(toDataUrl).filter((value): value is string => value !== null);
    handleGenerate(dataUrls);
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
      marginBottom: SPACING.section,
    },
    title: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
    },
    addButton: {
      width: 40,
      height: 40,
      borderRadius: 20,
      backgroundColor: COLORS.accent,
      alignItems: 'center',
      justifyContent: 'center',
    },
    addIcon: {
      transform: [{ rotate: '45deg' }],
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
    error: {
      color: COLORS.danger,
      marginBottom: SPACING.element,
    },
    deckCard: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.tight,
      ...cardBorder(COLORS),
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
  });

  return (
    <ScreenBackground>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <ScrollView contentContainerStyle={[styles.scrollContent, { paddingBottom: tabBarHeight + 24 }]}>
          <View style={styles.header}>
            <ThemedText style={styles.title}>Mes fiches</ThemedText>
            <BouncyPressable
              style={styles.addButton}
              onPress={() => setShowScanOptions((previous) => !previous)}
              hitSlop={8}>
              <IconSymbol name="checkmark" size={20} color={COLORS.accentText} style={styles.addIcon} />
            </BouncyPressable>
          </View>

          {showScanOptions ? (
            <ThemedView style={styles.scanCard}>
              <ThemedText style={styles.scanTitle}>Scanner un document</ThemedText>
              <ThemedText style={styles.scanSubtitle}>
                Prends en photo tes notes ou choisis-en depuis ta galerie — Noesis génère les fiches pour toi.
              </ThemedText>
              <BouncyPressable style={styles.scanButton} onPress={handleTakePhoto}>
                <ThemedText style={styles.scanButtonText}>Prendre une photo</ThemedText>
              </BouncyPressable>
              <BouncyPressable style={styles.scanButtonSecondary} onPress={handlePickFromLibrary}>
                <ThemedText style={styles.scanButtonSecondaryText}>Choisir depuis la galerie</ThemedText>
              </BouncyPressable>
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
            <EmptyState
              icon="albums-outline"
              title="Aucune fiche pour l'instant"
              description="Scanne tes notes de cours ou un document pour créer tes premières fiches de révision."
            />
          ) : null}

          {decks.map((deck) => (
            <Link key={deck.id} href={{ pathname: '/flashcard-deck', params: { id: deck.id } }} asChild>
              <BouncyPressable style={styles.deckCard}>
                <ThemedText style={styles.deckTitle}>{deck.title}</ThemedText>
                <ThemedText style={styles.deckSubtitle}>
                  {deck.cardCount} fiche{deck.cardCount > 1 ? 's' : ''}
                </ThemedText>
              </BouncyPressable>
            </Link>
          ))}
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
