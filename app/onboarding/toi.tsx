import * as ImagePicker from 'expo-image-picker';
import { router } from 'expo-router';
import { useState } from 'react';
import { Image, StyleSheet, View } from 'react-native';
import Animated, { FadeInDown } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { OnboardingHeader } from '@/components/onboarding-header';
import { ThemedText } from '@/components/themed-text';
import { Button } from '@/components/ui/button';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { TextField } from '@/components/ui/input';
import { Screen } from '@/components/ui/screen';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { formatGradeLabel } from '@/constants/grades';
import { useAuth } from '@/context/auth';
import { useOnboarding } from '@/context/onboarding';
import { getDisplayName } from '@/lib/profile';
import { useThemeColors } from '@/hooks/use-theme-colors';

export default function OnboardingToiScreen() {
  const COLORS = useThemeColors();
  const { user } = useAuth();
  const { answers, setAnswers } = useOnboarding();
  const [prenom, setPrenom] = useState(answers.prenom || getDisplayName(user));
  const [error, setError] = useState<string | null>(null);

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
    photoRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.element,
      marginBottom: SPACING.section,
    },
    photoCircle: {
      width: 64,
      height: 64,
      borderRadius: 32,
      backgroundColor: COLORS.surface,
      borderWidth: 2,
      borderColor: COLORS.border,
      alignItems: 'center',
      justifyContent: 'center',
      overflow: 'hidden',
    },
    photoImage: {
      width: 64,
      height: 64,
    },
    photoLabel: {
      ...TYPOGRAPHY.body,
      fontWeight: '600',
      color: COLORS.accent,
    },
    readOnlyField: {
      marginBottom: SPACING.element,
    },
    readOnlyLabel: {
      ...TYPOGRAPHY.label,
      color: COLORS.mutedText,
      textTransform: 'uppercase',
      marginBottom: 6,
    },
    readOnlyValue: {
      backgroundColor: COLORS.lockedBackground,
      borderRadius: RADIUS,
      padding: 16,
      fontSize: 16,
      color: COLORS.mutedText,
    },
    error: {
      color: COLORS.danger,
      marginBottom: SPACING.element,
    },
    spacer: {
      flex: 1,
    },
  });

  const handlePickPhoto = async () => {
    const permission = await ImagePicker.requestMediaLibraryPermissionsAsync();
    if (!permission.granted) {
      setError("Autorise l'accès à tes photos pour ajouter une photo de profil.");
      return;
    }
    const result = await ImagePicker.launchImageLibraryAsync({
      quality: 0.7,
      allowsEditing: true,
      aspect: [1, 1],
    });
    if (result.canceled || !result.assets[0]) {
      return;
    }
    setAnswers({ avatarLocalUri: result.assets[0].uri });
  };

  const handleContinue = () => {
    if (!prenom.trim()) {
      setError('Ton prénom est requis.');
      return;
    }
    setAnswers({ prenom: prenom.trim() });
    router.push('/onboarding/recap');
  };

  return (
    <Screen scroll>
      <OnboardingHeader step={7} totalSteps={8} />
      <Animated.View entering={FadeInDown.duration(300)}>
        <ThemedText style={styles.title}>Parle-nous un peu de toi</ThemedText>
        <ThemedText style={styles.subtitle}>Ces infos sont optionnelles et restent privées.</ThemedText>

        {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}

        <View style={styles.photoRow}>
          <BouncyPressable style={styles.photoCircle} onPress={handlePickPhoto}>
            {answers.avatarLocalUri ? (
              <Image source={{ uri: answers.avatarLocalUri }} style={styles.photoImage} />
            ) : (
              <IconSymbol name="camera.fill" size={24} color={COLORS.mutedText} />
            )}
          </BouncyPressable>
          <ThemedText style={styles.photoLabel} onPress={handlePickPhoto}>
            Ajouter une photo
          </ThemedText>
        </View>

        <TextField label="Prénom" value={prenom} onChangeText={setPrenom} placeholder="Ton prénom" />

        {answers.grade ? (
          <View style={styles.readOnlyField}>
            <ThemedText style={styles.readOnlyLabel}>Classe / Formation</ThemedText>
            <ThemedText style={styles.readOnlyValue}>{formatGradeLabel(answers.grade, answers.serie)}</ThemedText>
          </View>
        ) : null}

        <TextField
          label="Ville (optionnel)"
          value={answers.city}
          onChangeText={(city) => setAnswers({ city })}
          placeholder="Ta ville"
        />

        <Button label="Suivant" onPress={handleContinue} />
      </Animated.View>
    </Screen>
  );
}
