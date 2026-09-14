import { useState } from 'react';
import { Image, Pressable, ScrollView, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import * as ImagePicker from 'expo-image-picker';
import { manipulateAsync, SaveFormat } from 'expo-image-manipulator';
import { router, Stack } from 'expo-router';
import { Ionicons } from '@expo/vector-icons';
import { useCreateCourseSummary } from '../hooks/queries/use-course-summaries';
import { useAiQuota } from '../hooks/use-ai-quota';
import { AiTrialBanner } from '../components/ai-trial-banner';
import { Button } from '../components/ui/Button';
import { useAppTheme } from '../hooks/use-app-theme';
import { fonts, radius, spacing } from '../constants/theme';

type Page = { uri: string; base64: string; mimeType: string };

export default function CreateSummary() {
  const theme = useAppTheme();
  const { isPremium, trialsRemaining, isLocked } = useAiQuota();
  const createSummary = useCreateCourseSummary();

  const [pages, setPages] = useState<Page[]>([]);
  const [illegible, setIllegible] = useState(false);
  const [error, setError] = useState<string | null>(null);

  async function pickImage(source: 'camera' | 'library') {
    const permission =
      source === 'camera'
        ? await ImagePicker.requestCameraPermissionsAsync()
        : await ImagePicker.requestMediaLibraryPermissionsAsync();
    if (!permission.granted) {
      setError("Permission refusée. Autorise l'accès dans les réglages de ton téléphone.");
      return;
    }

    const options: ImagePicker.ImagePickerOptions = { quality: 1, mediaTypes: 'images' };
    const pickerResult =
      source === 'camera' ? await ImagePicker.launchCameraAsync(options) : await ImagePicker.launchImageLibraryAsync(options);
    if (pickerResult.canceled) return;

    const asset = pickerResult.assets[0];
    const manipulated = await manipulateAsync(asset.uri, [{ resize: { width: 1600 } }], {
      compress: 0.8,
      format: SaveFormat.JPEG,
      base64: true,
    });

    setPages((prev) => [...prev, { uri: manipulated.uri, base64: manipulated.base64 ?? '', mimeType: 'image/jpeg' }]);
    setIllegible(false);
    setError(null);
  }

  function removePage(index: number) {
    setPages((prev) => prev.filter((_, i) => i !== index));
  }

  async function handleGenerate() {
    if (pages.length === 0) return;
    setError(null);
    setIllegible(false);
    try {
      const response = await createSummary.mutateAsync(
        pages.map((p) => ({ base64: p.base64, mimeType: p.mimeType }))
      );
      if (response.illegible) {
        setIllegible(true);
        return;
      }
      router.replace({ pathname: '/summaries', params: { justCreated: response.summary?.id } });
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Le tuteur IA est indisponible pour le moment.');
    }
  }

  const isQuotaError = error?.toLowerCase().includes('essais gratuits');

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <Stack.Screen
        options={{
          headerShown: true,
          title: 'Créer une synthèse',
          headerStyle: { backgroundColor: theme.background },
          headerTintColor: theme.text,
        }}
      />
      <ScrollView contentContainerStyle={styles.scroll}>
        <AiTrialBanner isPremium={isPremium} trialsRemaining={trialsRemaining} isLocked={isLocked} />

        {isLocked ? null : (
          <>
            <Text style={[styles.instructions, { color: theme.textMuted }]}>
              Prends en photo une ou plusieurs pages de ton cahier. Le tuteur IA en fait une synthèse claire, fidèle à ce
              qui est écrit.
            </Text>

            {pages.length > 0 ? (
              <View style={styles.pagesGrid}>
                {pages.map((page, i) => (
                  <View key={page.uri} style={styles.pageThumbWrap}>
                    <Image source={{ uri: page.uri }} style={styles.pageThumb} resizeMode="cover" />
                    <Pressable
                      onPress={() => removePage(i)}
                      style={[styles.removeBadge, { backgroundColor: theme.error }]}
                    >
                      <Ionicons name="close" size={14} color="#FFFFFF" />
                    </Pressable>
                    <Text style={[styles.pageLabel, { color: theme.textMuted }]}>Page {i + 1}</Text>
                  </View>
                ))}
              </View>
            ) : null}

            <View style={styles.pickerActions}>
              <Button
                label={pages.length === 0 ? 'Prendre une photo' : 'Ajouter une page'}
                icon="camera-outline"
                onPress={() => pickImage('camera')}
                style={{ flex: 1 }}
              />
              <Button
                label="Galerie"
                variant="secondary"
                icon="images-outline"
                onPress={() => pickImage('library')}
                style={{ flex: 1 }}
              />
            </View>

            {pages.length > 0 ? (
              <Button
                label={`Générer la synthèse (${pages.length} page${pages.length > 1 ? 's' : ''})`}
                loading={createSummary.isPending}
                onPress={handleGenerate}
              />
            ) : null}

            {illegible ? (
              <View style={[styles.card, { backgroundColor: theme.card, borderColor: theme.border }]}>
                <View style={styles.stateHeader}>
                  <Ionicons name="alert-circle-outline" size={18} color={theme.error} />
                  <Text style={{ color: theme.error, fontFamily: fonts.bodySemiBold }}>Photos illisibles</Text>
                </View>
                <Text style={{ color: theme.textMuted, fontFamily: fonts.body, fontSize: 13.5 }}>
                  Le tuteur IA n'a pas pu lire ces photos. Reprends-les avec plus de lumière et bien cadrées.
                </Text>
              </View>
            ) : null}

            {error ? (
              <View style={[styles.card, { backgroundColor: theme.primaryTint }]}>
                <Text style={{ color: theme.error, fontFamily: fonts.bodySemiBold, marginBottom: spacing.xs }}>
                  {error}
                </Text>
                {isQuotaError ? <Button label="Passer Premium" onPress={() => router.push('/subscription')} /> : null}
              </View>
            ) : null}
          </>
        )}
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1 },
  scroll: { padding: spacing.lg, gap: spacing.md, paddingBottom: spacing.xl },
  instructions: { fontFamily: fonts.body, fontSize: 14, lineHeight: 20 },
  pagesGrid: { flexDirection: 'row', flexWrap: 'wrap', gap: spacing.sm },
  pageThumbWrap: { width: 100 },
  pageThumb: { width: 100, height: 130, borderRadius: radius.sm },
  removeBadge: {
    position: 'absolute',
    top: -6,
    right: -6,
    width: 22,
    height: 22,
    borderRadius: radius.full,
    alignItems: 'center',
    justifyContent: 'center',
  },
  pageLabel: { fontFamily: fonts.body, fontSize: 11.5, textAlign: 'center', marginTop: spacing.xs },
  pickerActions: { flexDirection: 'row', gap: spacing.sm },
  card: { borderWidth: 1, borderRadius: radius.md, padding: spacing.md, gap: spacing.xs },
  stateHeader: { flexDirection: 'row', alignItems: 'center', gap: spacing.xs },
});
