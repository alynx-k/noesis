import { useState } from 'react';
import { Image, ScrollView, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import * as ImagePicker from 'expo-image-picker';
import { router, Stack } from 'expo-router';
import { useSubmitHomeworkPhoto } from '../hooks/queries/use-homework-photo';
import { useAiQuota } from '../hooks/use-ai-quota';
import { AiTrialBanner } from './ai-trial-banner';
import { MarkdownLite } from './markdown-lite';
import { Button } from './ui/Button';
import { useAppTheme } from '../hooks/use-app-theme';
import { fonts, radius, spacing } from '../constants/theme';

type Props = {
  mode: 'correct' | 'prepare';
  title: string;
  instructions: string;
};

export function HomeworkPhotoScreen({ mode, title, instructions }: Props) {
  const theme = useAppTheme();
  const { isPremium, trialsRemaining, isLocked } = useAiQuota();
  const submit = useSubmitHomeworkPhoto();

  const [imageUri, setImageUri] = useState<string | null>(null);
  const [imageBase64, setImageBase64] = useState<string | null>(null);
  const [mimeType, setMimeType] = useState('image/jpeg');
  const [result, setResult] = useState<string | null>(null);
  const [illegible, setIllegible] = useState(false);
  const [error, setError] = useState<string | null>(null);

  function reset() {
    setImageUri(null);
    setImageBase64(null);
    setResult(null);
    setIllegible(false);
    setError(null);
  }

  async function pickImage(source: 'camera' | 'library') {
    const permission =
      source === 'camera'
        ? await ImagePicker.requestCameraPermissionsAsync()
        : await ImagePicker.requestMediaLibraryPermissionsAsync();
    if (!permission.granted) {
      setError('Permission refusée. Autorise l\'accès dans les réglages de ton téléphone.');
      return;
    }

    const options: ImagePicker.ImagePickerOptions = { base64: true, quality: 0.6, mediaTypes: 'images' };
    const pickerResult =
      source === 'camera' ? await ImagePicker.launchCameraAsync(options) : await ImagePicker.launchImageLibraryAsync(options);
    if (pickerResult.canceled) return;

    const asset = pickerResult.assets[0];
    setImageUri(asset.uri);
    setImageBase64(asset.base64 ?? null);
    setMimeType(asset.mimeType ?? 'image/jpeg');
    setResult(null);
    setIllegible(false);
    setError(null);
  }

  async function handleSubmit() {
    if (!imageBase64) return;
    setError(null);
    try {
      const response = await submit.mutateAsync({ mode, imageBase64, mimeType });
      if (response.illegible) {
        setIllegible(true);
      } else {
        setResult(response.result ?? '');
      }
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
          title,
          headerStyle: { backgroundColor: theme.background },
          headerTintColor: theme.text,
        }}
      />
      <ScrollView contentContainerStyle={styles.scroll}>
        <AiTrialBanner isPremium={isPremium} trialsRemaining={trialsRemaining} isLocked={isLocked} />

        {isLocked ? null : (
          <>
            <Text style={[styles.instructions, { color: theme.textMuted }]}>{instructions}</Text>

            {!imageUri ? (
              <View style={styles.pickerActions}>
                <Button label="Prendre une photo" onPress={() => pickImage('camera')} style={{ flex: 1 }} />
                <Button
                  label="Choisir depuis la galerie"
                  variant="secondary"
                  onPress={() => pickImage('library')}
                  style={{ flex: 1 }}
                />
              </View>
            ) : (
              <>
                <Image source={{ uri: imageUri }} style={styles.preview} resizeMode="contain" />

                {!result && !illegible ? (
                  <View style={styles.pickerActions}>
                    <Button label="Reprendre une photo" variant="ghost" onPress={reset} style={{ flex: 1 }} />
                    <Button
                      label="Envoyer"
                      loading={submit.isPending}
                      onPress={handleSubmit}
                      style={{ flex: 1 }}
                    />
                  </View>
                ) : null}
              </>
            )}

            {illegible ? (
              <View style={[styles.card, { backgroundColor: theme.card, borderColor: theme.border }]}>
                <Text style={{ color: theme.error, fontFamily: fonts.bodySemiBold, marginBottom: spacing.xs }}>
                  Photo illisible
                </Text>
                <Text style={{ color: theme.textMuted, fontFamily: fonts.body, fontSize: 13.5, marginBottom: spacing.sm }}>
                  Le tuteur IA n'a pas pu lire cette photo. Reprends-la avec plus de lumière et bien cadrée.
                </Text>
                <Button label="Reprendre une photo" onPress={reset} />
              </View>
            ) : null}

            {result ? (
              <View style={[styles.card, { backgroundColor: theme.card, borderColor: theme.border }]}>
                <MarkdownLite>{result}</MarkdownLite>
                <View style={{ marginTop: spacing.sm }}>
                  <Button label="Nouvelle photo" variant="secondary" onPress={reset} />
                </View>
              </View>
            ) : null}

            {error ? (
              <View style={[styles.card, { backgroundColor: theme.primaryTint }]}>
                <Text style={{ color: theme.error, fontFamily: fonts.bodySemiBold, marginBottom: spacing.xs }}>
                  {error}
                </Text>
                {isQuotaError ? (
                  <Button label="Passer Premium" onPress={() => router.push('/subscription')} />
                ) : null}
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
  pickerActions: { flexDirection: 'row', gap: spacing.sm },
  preview: { width: '100%', height: 260, borderRadius: radius.md },
  card: { borderWidth: 1, borderRadius: radius.md, padding: spacing.md },
});
