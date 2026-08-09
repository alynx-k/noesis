import { useFocusEffect } from '@react-navigation/native';
import { Link, useLocalSearchParams } from 'expo-router';
import { useCallback, useState } from 'react';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { CourseContent } from '@/components/course-content';
import { FloatingBar } from '@/components/floating-bar';
import { GridBackground } from '@/components/grid-background';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { PILL_RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useThemeColors } from '@/hooks/use-theme-colors';
import { CourseDetail, getOrGenerateCourse } from '@/lib/courses';

export default function CourseScreen() {
  const COLORS = useThemeColors();
  const { id } = useLocalSearchParams<{ id: string }>();
  const [course, setCourse] = useState<CourseDetail | null>(null);
  const [error, setError] = useState<string | null>(null);

  useFocusEffect(
    useCallback(() => {
      if (!id) {
        return;
      }
      let cancelled = false;
      setCourse(null);
      setError(null);

      getOrGenerateCourse(id).then((result) => {
        if (cancelled) {
          return;
        }
        if ('error' in result) {
          setError(result.error);
          return;
        }
        setCourse(result);
      });

      return () => {
        cancelled = true;
      };
    }, [id]),
  );

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    scrollContent: {
      padding: SPACING.screen,
      paddingBottom: 120,
    },
    title: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
      marginBottom: SPACING.section,
    },
    paragraph: {
      ...TYPOGRAPHY.body,
      color: COLORS.text,
      marginBottom: SPACING.element,
    },
    button: {
      backgroundColor: COLORS.accent,
      borderRadius: PILL_RADIUS,
      paddingVertical: 16,
      alignItems: 'center',
    },
    buttonText: {
      color: COLORS.accentText,
      fontSize: 16,
      fontWeight: '700',
    },
    centered: {
      flex: 1,
      alignItems: 'center',
      justifyContent: 'center',
      padding: SPACING.screen,
    },
    loadingTitle: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
      textAlign: 'center',
      marginBottom: SPACING.tight,
    },
    loadingSubtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      textAlign: 'center',
    },
  });

  return (
    <ScreenBackground>
      <GridBackground />
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        {course ? (
          <>
            <ScrollView contentContainerStyle={styles.scrollContent}>
              <ThemedText style={styles.title}>{course.title}</ThemedText>
              {'sections' in course.content ? (
                <CourseContent content={course.content} />
              ) : (
                course.content.paragraphs.map((paragraph, index) => (
                  <ThemedText key={index} style={styles.paragraph}>
                    {paragraph}
                  </ThemedText>
                ))
              )}
            </ScrollView>

            <FloatingBar>
              <Link href={`/exercise?courseId=${course.id}`} asChild>
                <BouncyPressable style={styles.button}>
                  <ThemedText style={styles.buttonText}>Commencer l'exercice</ThemedText>
                </BouncyPressable>
              </Link>
            </FloatingBar>
          </>
        ) : (
          <View style={styles.centered}>
            <ThemedText style={styles.loadingTitle}>
              {error ? "Impossible d'ouvrir ce cours" : 'Préparation de ton cours...'}
            </ThemedText>
            <ThemedText style={styles.loadingSubtitle}>
              {error ?? "Ça peut prendre quelques secondes la première fois — les prochains élèves l'auront instantanément."}
            </ThemedText>
          </View>
        )}
      </SafeAreaView>
    </ScreenBackground>
  );
}
