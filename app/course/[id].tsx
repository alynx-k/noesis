import { Link, useLocalSearchParams } from 'expo-router';
import { ActivityIndicator, ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { CourseContent } from '@/components/course-content';
import { FloatingBar } from '@/components/floating-bar';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { ErrorState } from '@/components/ui/error-state';
import { PILL_RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useCourseDetail } from '@/hooks/queries/use-courses';
import { useThemeColors } from '@/hooks/use-theme-colors';

export default function CourseScreen() {
  const COLORS = useThemeColors();
  const { id } = useLocalSearchParams<{ id: string }>();
  const courseQuery = useCourseDetail(id ?? '');
  const course = courseQuery.data;

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
      gap: SPACING.element,
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
              <Link href={{ pathname: '/exercise', params: { courseId: course.id } }} asChild>
                <BouncyPressable style={styles.button}>
                  <ThemedText style={styles.buttonText}>Commencer l&apos;exercice</ThemedText>
                </BouncyPressable>
              </Link>
            </FloatingBar>
          </>
        ) : courseQuery.isError ? (
          <ErrorState
            title="Impossible d'ouvrir ce cours"
            description={(courseQuery.error as Error)?.message}
            onRetry={() => courseQuery.refetch()}
          />
        ) : (
          <View style={styles.centered}>
            <ActivityIndicator color={COLORS.accent} size="large" />
            <View>
              <ThemedText style={styles.loadingTitle}>Préparation de ton cours...</ThemedText>
              <ThemedText style={styles.loadingSubtitle}>
                Ça peut prendre quelques secondes la première fois — les prochains élèves l&apos;auront
                instantanément.
              </ThemedText>
            </View>
          </View>
        )}
      </SafeAreaView>
    </ScreenBackground>
  );
}
