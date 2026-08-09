import { router } from 'expo-router';
import { useEffect, useState } from 'react';
import { KeyboardAvoidingView, Platform, ScrollView, StyleSheet, TextInput } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { markDiagnosticCompleted } from '@/lib/diagnostic-storage';

const QUESTIONS = [
  'As-tu déjà entendu parler du mot "mondialisation" ? Si oui, qu\'est-ce que ça évoque pour toi ?',
  'Selon toi, est-ce que l\'Afrique est une grande ou une petite puissance commerciale à l\'échelle mondiale ?',
  "Peux-tu citer un produit que l'Afrique exporte vers d'autres continents ?",
  "As-tu une idée de ce qu'est une organisation comme l'OMC (Organisation Mondiale du Commerce) ?",
];

export default function DiagnosticScreen() {
  const COLORS = useThemeColors();
  const [currentIndex, setCurrentIndex] = useState(0);
  const [answers, setAnswers] = useState<string[]>([]);
  const [answerText, setAnswerText] = useState('');

  const isFinished = currentIndex >= QUESTIONS.length;

  useEffect(() => {
    if (!isFinished) {
      return;
    }
    markDiagnosticCompleted();
    const timeout = setTimeout(() => {
      router.replace('/');
    }, 1800);
    return () => clearTimeout(timeout);
  }, [isFinished]);

  const handleValidate = () => {
    setAnswers((previous) => [...previous, answerText]);
    setAnswerText('');
    setCurrentIndex((previous) => previous + 1);
  };

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    container: {
      flex: 1,
      backgroundColor: COLORS.background,
    },
    centered: {
      justifyContent: 'center',
      alignItems: 'center',
      padding: SPACING.screen,
    },
    centeredText: {
      textAlign: 'center',
    },
    scrollContent: {
      padding: SPACING.screen,
      paddingBottom: 40,
    },
    title: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
    },
    progress: {
      ...TYPOGRAPHY.label,
      color: COLORS.accent,
      marginBottom: SPACING.element,
    },
    question: {
      ...TYPOGRAPHY.body,
      color: COLORS.text,
      marginBottom: SPACING.section,
    },
    input: {
      minHeight: 120,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: 16,
      fontSize: 16,
      color: COLORS.text,
      textAlignVertical: 'top',
      marginBottom: SPACING.section,
      ...cardBorder(COLORS),
    },
    validateButton: {
      backgroundColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 16,
      alignItems: 'center',
    },
    validateButtonText: {
      color: COLORS.accentText,
      fontSize: 16,
      fontWeight: '700',
    },
  });

  if (isFinished) {
    return (
      <ThemedView style={styles.container}>
        <SafeAreaView style={[styles.safeArea, styles.centered]} edges={['top', 'bottom']}>
          <ThemedText style={[styles.title, styles.centeredText]}>
            Merci ! On commence par les bases avec ton premier cours.
          </ThemedText>
        </SafeAreaView>
      </ThemedView>
    );
  }

  return (
    <ThemedView style={styles.container}>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <KeyboardAvoidingView
          style={styles.container}
          behavior={Platform.OS === 'ios' ? 'padding' : undefined}>
        <ScrollView contentContainerStyle={styles.scrollContent}>
          <ThemedText style={styles.progress}>
            Question {currentIndex + 1}/{QUESTIONS.length}
          </ThemedText>

          <ThemedText style={styles.question}>{QUESTIONS[currentIndex]}</ThemedText>

          <TextInput
            style={styles.input}
            multiline
            placeholder="Écris ta réponse ici..."
            placeholderTextColor={COLORS.placeholderText}
            value={answerText}
            onChangeText={setAnswerText}
          />

          <BouncyPressable style={styles.validateButton} onPress={handleValidate}>
            <ThemedText style={styles.validateButtonText}>Valider</ThemedText>
          </BouncyPressable>
        </ScrollView>
        </KeyboardAvoidingView>
      </SafeAreaView>
    </ThemedView>
  );
}
