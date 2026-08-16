import * as ImagePicker from 'expo-image-picker';
import { router } from 'expo-router';
import { useState } from 'react';
import { Image, ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { PremiumUpsellCard } from '@/components/premium-upsell-card';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { FEEDBACK_COLORS, PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { correctHomework, HomeworkCorrectionResult } from '@/lib/homework';

function toDataUrl(asset: ImagePicker.ImagePickerAsset): string | null {
  if (!asset.base64) {
    return null;
  }
  const mimeType = asset.mimeType ?? 'image/jpeg';
  return `data:${mimeType};base64,${asset.base64}`;
}

function verdictColor(verdict: string): string {
  const normalized = verdict.toLowerCase();
  if (normalized.startsWith('correct')) {
    return FEEDBACK_COLORS.correct;
  }
  if (normalized.startsWith('partiel') || normalized.startsWith('partial')) {
    return FEEDBACK_COLORS.partial;
  }
  return FEEDBACK_COLORS.incorrect;
}

const MAX_CAPTURED_PHOTOS = 5;

export default function CorrectHomeworkScreen() {
  const COLORS = useThemeColors();
  const [correcting, setCorrecting] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [result, setResult] = useState<HomeworkCorrectionResult | null>(null);
  // Photos accumulate here across as many camera shots / library picks as
  // needed (up to MAX_CAPTURED_PHOTOS) — correction only fires once the user
  // confirms they're done, via handleFinishCapture. Previously the camera
  // button corrected immediately after a single shot, so a multi-page
  // homework could never be scanned as one submission.
  const [capturedPhotos, setCapturedPhotos] = useState<string[]>([]);

  const handleTakePhoto = async () => {
    if (capturedPhotos.length >= MAX_CAPTURED_PHOTOS) {
      return;
    }
    const permission = await ImagePicker.requestCameraPermissionsAsync();
    if (!permission.granted) {
      setError("Autorise l'accès à l'appareil photo pour scanner ton devoir.");
      return;
    }
    const photo = await ImagePicker.launchCameraAsync({ base64: true, quality: 0.7 });
    if (photo.canceled) {
      return;
    }
    const dataUrl = toDataUrl(photo.assets[0]);
    if (dataUrl) {
      setError(null);
      setCapturedPhotos((previous) => [...previous, dataUrl].slice(0, MAX_CAPTURED_PHOTOS));
    }
  };

  const handlePickFromLibrary = async () => {
    const permission = await ImagePicker.requestMediaLibraryPermissionsAsync();
    if (!permission.granted) {
      setError('Autorise l’accès à tes photos pour scanner ton devoir.');
      return;
    }
    const picked = await ImagePicker.launchImageLibraryAsync({
      base64: true,
      quality: 0.7,
      allowsMultipleSelection: true,
      selectionLimit: MAX_CAPTURED_PHOTOS - capturedPhotos.length,
    });
    if (picked.canceled) {
      return;
    }
    const dataUrls = picked.assets.map(toDataUrl).filter((value): value is string => value !== null);
    setError(null);
    setCapturedPhotos((previous) => [...previous, ...dataUrls].slice(0, MAX_CAPTURED_PHOTOS));
  };

  const handleRemoveCapturedPhoto = (index: number) => {
    setCapturedPhotos((previous) => previous.filter((_, photoIndex) => photoIndex !== index));
  };

  const handleFinishCapture = async () => {
    if (capturedPhotos.length === 0) {
      return;
    }
    setError(null);
    setResult(null);
    setCorrecting(true);
    const outcome = await correctHomework(capturedPhotos);
    setCapturedPhotos([]);
    setCorrecting(false);
    setResult(outcome);
  };

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    scrollContent: {
      padding: SPACING.screen,
      paddingBottom: 40,
    },
    header: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      marginBottom: SPACING.section,
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
    headerTitle: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      marginBottom: SPACING.section,
    },
    actionsRow: {
      flexDirection: 'row',
      gap: SPACING.tight,
      marginBottom: SPACING.element,
    },
    actionButton: {
      flex: 1,
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'center',
      gap: 8,
      backgroundColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 14,
    },
    actionButtonText: {
      color: COLORS.accentText,
      fontSize: 14,
      fontWeight: '700',
    },
    actionButtonDisabled: {
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
      backgroundColor: COLORS.surface,
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
    finishButton: {
      backgroundColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 14,
      alignItems: 'center',
      marginBottom: SPACING.element,
    },
    finishButtonText: {
      color: COLORS.accentText,
      fontSize: 15,
      fontWeight: '700',
    },
    error: {
      color: COLORS.danger,
      marginBottom: SPACING.element,
    },
    loadingCard: {
      alignItems: 'center',
      padding: SPACING.section,
    },
    loadingText: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      marginTop: SPACING.tight,
      textAlign: 'center',
    },
    resultCard: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.tight,
      ...cardBorder(COLORS),
    },
    courseTitle: {
      ...TYPOGRAPHY.label,
      color: COLORS.accent,
      textTransform: 'uppercase',
      marginBottom: 4,
    },
    summary: {
      ...TYPOGRAPHY.body,
      color: COLORS.text,
    },
    itemCard: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.tight,
      ...cardBorder(COLORS),
    },
    itemQuestion: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      marginBottom: 4,
    },
    itemAnswer: {
      ...TYPOGRAPHY.body,
      fontSize: 14,
      fontStyle: 'italic',
      color: COLORS.mutedText,
      marginBottom: SPACING.tight,
    },
    verdictBadge: {
      alignSelf: 'flex-start',
      borderRadius: 999,
      paddingVertical: 4,
      paddingHorizontal: 10,
      marginBottom: SPACING.tight,
    },
    verdictBadgeText: {
      color: '#FFFFFF',
      fontSize: 12,
      fontWeight: '700',
      textTransform: 'capitalize',
    },
    itemFeedback: {
      ...TYPOGRAPHY.body,
      fontSize: 14,
      color: COLORS.text,
    },
  });

  return (
    <ScreenBackground>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
      <ScrollView contentContainerStyle={styles.scrollContent}>
        <View style={styles.header}>
          <BouncyPressable style={styles.backButton} onPress={() => router.back()} hitSlop={8}>
            <IconSymbol name="chevron.right" size={18} color={COLORS.text} style={styles.backIcon} />
          </BouncyPressable>
          <ThemedText style={styles.headerTitle}>Corrige mon devoir</ThemedText>
          <View style={styles.backButton} />
        </View>

        <ThemedText style={styles.subtitle}>
          Prends en photo ton devoir (plusieurs pages possibles) — l&apos;IA retrouve le cours correspondant dans ton
          programme et corrige en s&apos;appuyant uniquement dessus.
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

        <View style={styles.actionsRow}>
          <BouncyPressable
            style={[styles.actionButton, capturedPhotos.length >= MAX_CAPTURED_PHOTOS && styles.actionButtonDisabled]}
            onPress={handleTakePhoto}
            disabled={correcting || capturedPhotos.length >= MAX_CAPTURED_PHOTOS}>
            <IconSymbol name="doc.text.fill" size={16} color={COLORS.accentText} />
            <ThemedText style={styles.actionButtonText}>
              {capturedPhotos.length === 0 ? 'Prendre une photo' : 'Ajouter une page'}
            </ThemedText>
          </BouncyPressable>
          <BouncyPressable
            style={[styles.actionButton, capturedPhotos.length >= MAX_CAPTURED_PHOTOS && styles.actionButtonDisabled]}
            onPress={handlePickFromLibrary}
            disabled={correcting || capturedPhotos.length >= MAX_CAPTURED_PHOTOS}>
            <IconSymbol name="doc.text.fill" size={16} color={COLORS.accentText} />
            <ThemedText style={styles.actionButtonText}>Depuis mes photos</ThemedText>
          </BouncyPressable>
        </View>

        {capturedPhotos.length > 0 ? (
          <BouncyPressable style={styles.finishButton} onPress={handleFinishCapture} disabled={correcting}>
            <ThemedText style={styles.finishButtonText}>Corriger mon devoir ({capturedPhotos.length})</ThemedText>
          </BouncyPressable>
        ) : null}

        {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}

        {correcting ? (
          <View style={styles.loadingCard}>
            <ThemedText style={styles.loadingText}>Lecture du devoir et correction en cours...</ThemedText>
          </View>
        ) : null}

        {result?.status === 'unmatched' ? (
          <View style={styles.resultCard}>
            <ThemedText style={styles.summary}>
              Aucun cours de ton programme ne correspond clairement à cette photo. Essaie une photo plus nette, ou vérifie que
              ce chapitre fait partie de ta classe.
            </ThemedText>
          </View>
        ) : null}

        {result?.status === 'limitReached' ? <PremiumUpsellCard message={result.message} /> : null}

        {result?.status === 'error' ? (
          <View style={styles.resultCard}>
            <ThemedText style={styles.summary}>{result.message}</ThemedText>
          </View>
        ) : null}

        {result?.status === 'matched' ? (
          <>
            <View style={styles.resultCard}>
              <ThemedText style={styles.courseTitle}>{result.courseTitle}</ThemedText>
              <ThemedText style={styles.summary}>{result.summary}</ThemedText>
            </View>

            {result.items.map((item, index) => (
              <View key={index} style={styles.itemCard}>
                <ThemedText style={styles.itemQuestion}>{item.question}</ThemedText>
                {item.studentAnswer ? <ThemedText style={styles.itemAnswer}>{item.studentAnswer}</ThemedText> : null}
                <View style={[styles.verdictBadge, { backgroundColor: verdictColor(item.verdict) }]}>
                  <ThemedText style={styles.verdictBadgeText}>{item.verdict}</ThemedText>
                </View>
                <ThemedText style={styles.itemFeedback}>{item.feedback}</ThemedText>
              </View>
            ))}
          </>
        ) : null}
      </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
