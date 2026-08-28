import { LinearGradient } from 'expo-linear-gradient';
import { router } from 'expo-router';
import type { ReactNode } from 'react';
import { StyleSheet, View } from 'react-native';
import Animated, { FadeInDown } from 'react-native-reanimated';

import { OnboardingHeader } from '@/components/onboarding-header';
import { ThemedText } from '@/components/themed-text';
import { Button } from '@/components/ui/button';
import { IconSymbol, IconSymbolName } from '@/components/ui/icon-symbol';
import { Screen } from '@/components/ui/screen';
import { ELEVATION, GRADIENTS, PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { DISCIPLINES, getDisciplineIdsFor } from '@/constants/disciplines';
import { isLyceeGrade } from '@/constants/grades';
import { LV2_OPTIONS } from '@/constants/lv2';
import { DAILY_TIME_OPTIONS, MOTIVATIONS } from '@/constants/onboarding';
import { useOnboarding } from '@/context/onboarding';
import { useThemeColors } from '@/hooks/use-theme-colors';

export default function OnboardingRecapScreen() {
  const COLORS = useThemeColors();
  const { answers } = useOnboarding();

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
    card: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      gap: SPACING.section,
      ...ELEVATION.md,
    },
    section: {
      gap: SPACING.tight,
    },
    sectionHeader: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
    },
    iconBadge: {
      width: 32,
      height: 32,
      borderRadius: 10,
      alignItems: 'center',
      justifyContent: 'center',
    },
    sectionLabel: {
      ...TYPOGRAPHY.label,
      color: COLORS.mutedText,
      textTransform: 'uppercase',
    },
    sectionValue: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      marginLeft: 42,
    },
    chipRow: {
      flexDirection: 'row',
      flexWrap: 'wrap',
      gap: 8,
      marginLeft: 42,
    },
    subjectChip: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 6,
      backgroundColor: COLORS.background,
      borderRadius: PILL_RADIUS,
      paddingVertical: 6,
      paddingHorizontal: 12,
    },
    subjectDot: {
      width: 8,
      height: 8,
      borderRadius: 4,
    },
    subjectChipText: {
      ...TYPOGRAPHY.caption,
      fontWeight: '600',
      color: COLORS.text,
    },
    motivationChip: {
      backgroundColor: COLORS.accentSoft,
      borderRadius: PILL_RADIUS,
      paddingVertical: 6,
      paddingHorizontal: 12,
    },
    motivationChipText: {
      ...TYPOGRAPHY.caption,
      fontWeight: '600',
      color: COLORS.accent,
    },
    footer: {
      gap: SPACING.tight,
      marginTop: SPACING.section,
    },
    editLink: {
      ...TYPOGRAPHY.caption,
      color: COLORS.accent,
      textAlign: 'center',
      textDecorationLine: 'underline',
    },
  });

  if (!answers.grade) {
    router.replace('/onboarding/niveau');
    return null;
  }

  const subjectIds = getDisciplineIdsFor(answers.grade, answers.serie).filter(
    (id) => id !== 'espagnol' && id !== 'allemand',
  );
  const subjectDisciplines = subjectIds.map((id) => DISCIPLINES.find((discipline) => discipline.id === id)).filter(
    (discipline): discipline is (typeof DISCIPLINES)[number] => !!discipline,
  );
  const motivationLabels = answers.motivations.map((id) => MOTIVATIONS.find((m) => m.id === id)?.label ?? id);
  const dailyTimeLabel = DAILY_TIME_OPTIONS.find((option) => option.id === answers.dailyTime)?.label ?? '—';

  const sections: {
    icon: IconSymbolName;
    gradient: readonly [string, string, ...string[]];
    label: string;
    content: ReactNode;
  }[] = [
    {
      icon: 'trophy.fill',
      gradient: GRADIENTS.gold,
      label: 'Niveau',
      content: <ThemedText style={styles.sectionValue}>{isLyceeGrade(answers.grade) ? 'Lycée' : 'Collège'}</ThemedText>,
    },
    {
      icon: 'book.fill',
      gradient: GRADIENTS.badgeAzure,
      label: 'Matières',
      content: (
        <View style={styles.chipRow}>
          {subjectDisciplines.map((discipline) => (
            <View key={discipline.id} style={styles.subjectChip}>
              <View style={[styles.subjectDot, { backgroundColor: discipline.solidColor }]} />
              <ThemedText style={styles.subjectChipText}>{discipline.label}</ThemedText>
            </View>
          ))}
          {answers.lv2 ? (
            <View style={styles.subjectChip}>
              <ThemedText style={styles.subjectChipText}>
                {LV2_OPTIONS.find((option) => option.id === answers.lv2)?.label ?? answers.lv2}
              </ThemedText>
            </View>
          ) : null}
        </View>
      ),
    },
    {
      icon: 'checkmark.circle.fill',
      gradient: GRADIENTS.badgeViolet,
      label: 'Objectifs',
      content:
        motivationLabels.length > 0 ? (
          <View style={styles.chipRow}>
            {motivationLabels.map((label) => (
              <View key={label} style={styles.motivationChip}>
                <ThemedText style={styles.motivationChipText}>{label}</ThemedText>
              </View>
            ))}
          </View>
        ) : (
          <ThemedText style={styles.sectionValue}>—</ThemedText>
        ),
    },
    {
      icon: 'clock.arrow.circlepath',
      gradient: GRADIENTS.badgeMint,
      label: 'Temps par jour',
      content: <ThemedText style={styles.sectionValue}>{dailyTimeLabel}</ThemedText>,
    },
    {
      icon: 'lightbulb.fill',
      gradient: GRADIENTS.fire,
      label: 'Notifications',
      content: (
        <ThemedText style={styles.sectionValue}>
          {answers.notificationsEnabled ? 'Activées' : 'Désactivées'}
        </ThemedText>
      ),
    },
  ];

  return (
    <Screen scroll>
      <OnboardingHeader step={8} totalSteps={8} />
      <Animated.View entering={FadeInDown.duration(300)}>
        <ThemedText style={styles.title}>Récapitulatif</ThemedText>
        <ThemedText style={styles.subtitle}>Vérifie tes choix avant de commencer.</ThemedText>

        <View style={styles.card}>
          {sections.map((section) => (
            <View key={section.label} style={styles.section}>
              <View style={styles.sectionHeader}>
                <LinearGradient colors={section.gradient} style={styles.iconBadge}>
                  <IconSymbol name={section.icon} size={16} color="#FFFFFF" />
                </LinearGradient>
                <ThemedText style={styles.sectionLabel}>{section.label}</ThemedText>
              </View>
              {section.content}
            </View>
          ))}
        </View>

        <View style={styles.footer}>
          <Button label="C'est parti !" onPress={() => router.push('/onboarding/pret')} />
          <ThemedText style={styles.editLink} onPress={() => router.push('/onboarding/niveau')}>
            Modifier mes choix
          </ThemedText>
        </View>
      </Animated.View>
    </Screen>
  );
}
