import Ionicons from '@expo/vector-icons/Ionicons';
import { useState } from 'react';
import { StyleSheet, View } from 'react-native';
import Animated, { FadeIn, LinearTransition } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { DataTable } from '@/components/data-table';
import { GeometryDiagram } from '@/components/geometry-diagram';
import { HighlightedText } from '@/components/highlighted-text';
import { ThemedText } from '@/components/themed-text';
import { PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { CourseContentV2, CourseFixation, CourseSection } from '@/lib/courses';

function FixationBlock({ fixation }: { fixation: CourseFixation }) {
  const COLORS = useThemeColors();
  const [revealed, setRevealed] = useState(false);

  const styles = StyleSheet.create({
    box: {
      marginTop: SPACING.tight,
      backgroundColor: COLORS.accentSoft,
      borderRadius: RADIUS,
      padding: SPACING.element,
    },
    labelRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 6,
      marginBottom: 6,
    },
    label: {
      ...TYPOGRAPHY.label,
      color: COLORS.accent,
      textTransform: 'uppercase',
    },
    question: {
      ...TYPOGRAPHY.body,
      color: COLORS.text,
    },
    revealButton: {
      alignSelf: 'flex-start',
      marginTop: SPACING.tight,
      borderRadius: PILL_RADIUS,
      borderWidth: 1.5,
      borderColor: COLORS.accent,
      paddingVertical: 6,
      paddingHorizontal: 14,
    },
    revealButtonText: {
      fontSize: 13,
      fontWeight: '700',
      color: COLORS.accent,
    },
    solution: {
      ...TYPOGRAPHY.body,
      color: COLORS.text,
      marginTop: SPACING.tight,
    },
  });

  return (
    <Animated.View style={styles.box} layout={LinearTransition.springify().damping(18)}>
      <View style={styles.labelRow}>
        <Ionicons name="create-outline" size={15} color={COLORS.accent} />
        <ThemedText style={styles.label}>Je m&apos;exerce</ThemedText>
      </View>
      <ThemedText style={styles.question}>{fixation.question}</ThemedText>
      {revealed ? (
        <Animated.View entering={FadeIn.duration(250)}>
          <ThemedText style={styles.solution}>{fixation.solution}</ThemedText>
        </Animated.View>
      ) : (
        <BouncyPressable style={styles.revealButton} onPress={() => setRevealed(true)}>
          <ThemedText style={styles.revealButtonText}>Voir la correction</ThemedText>
        </BouncyPressable>
      )}
    </Animated.View>
  );
}

function SectionView({ section, isLast }: { section: CourseSection; isLast: boolean }) {
  const COLORS = useThemeColors();

  const styles = StyleSheet.create({
    wrapper: {
      marginBottom: SPACING.element,
    },
    heading: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.accent,
      marginBottom: 6,
    },
    body: {
      ...TYPOGRAPHY.body,
      color: COLORS.text,
    },
    highlight: {
      ...TYPOGRAPHY.body,
      color: COLORS.accent,
      fontWeight: '700',
      textDecorationLine: 'underline',
    },
    propertyBox: {
      marginTop: SPACING.tight,
      borderRadius: RADIUS,
      padding: SPACING.element,
      ...cardBorder(COLORS),
      borderLeftWidth: 4,
      borderLeftColor: COLORS.accent,
    },
    propertyLabelRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 6,
      marginBottom: 4,
    },
    propertyLabel: {
      ...TYPOGRAPHY.label,
      color: COLORS.accent,
      textTransform: 'uppercase',
    },
    propertyText: {
      ...TYPOGRAPHY.body,
      color: COLORS.text,
    },
    exampleBox: {
      marginTop: SPACING.tight,
      backgroundColor: COLORS.lockedBackground,
      borderRadius: RADIUS,
      padding: SPACING.element,
      borderLeftWidth: 4,
      borderLeftColor: COLORS.mutedText,
    },
    exampleLabelRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 6,
      marginBottom: 4,
    },
    exampleLabel: {
      ...TYPOGRAPHY.label,
      color: COLORS.mutedText,
      textTransform: 'uppercase',
    },
    exampleStatement: {
      ...TYPOGRAPHY.body,
      color: COLORS.text,
      fontStyle: 'italic',
      marginBottom: SPACING.tight,
    },
    exampleSolution: {
      ...TYPOGRAPHY.body,
      color: COLORS.text,
    },
    separator: {
      borderTopWidth: 1,
      borderTopColor: COLORS.border,
      borderStyle: 'dashed',
      marginTop: SPACING.element,
    },
  });

  return (
    <View style={styles.wrapper}>
      <ThemedText style={styles.heading}>{section.heading}</ThemedText>
      <HighlightedText
        text={section.body}
        highlights={section.highlights}
        style={styles.body}
        highlightStyle={styles.highlight}
      />

      {section.table ? <DataTable table={section.table} /> : null}

      {section.diagram ? <GeometryDiagram diagram={section.diagram} /> : null}

      {section.property ? (
        <View style={styles.propertyBox}>
          <View style={styles.propertyLabelRow}>
            <Ionicons name="bulb-outline" size={15} color={COLORS.accent} />
            <ThemedText style={styles.propertyLabel}>{section.property.label}</ThemedText>
          </View>
          <ThemedText style={styles.propertyText}>{section.property.text}</ThemedText>
        </View>
      ) : null}

      {section.example ? (
        <View style={styles.exampleBox}>
          <View style={styles.exampleLabelRow}>
            <Ionicons name="book-outline" size={15} color={COLORS.mutedText} />
            <ThemedText style={styles.exampleLabel}>Exemple</ThemedText>
          </View>
          <ThemedText style={styles.exampleStatement}>{section.example.statement}</ThemedText>
          <ThemedText style={styles.exampleSolution}>{section.example.solution}</ThemedText>
        </View>
      ) : null}

      {section.fixation ? <FixationBlock fixation={section.fixation} /> : null}

      {!isLast ? <View style={styles.separator} /> : null}
    </View>
  );
}

type CourseContentProps = {
  content: CourseContentV2;
};

export function CourseContent({ content }: CourseContentProps) {
  const COLORS = useThemeColors();

  const styles = StyleSheet.create({
    situation: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      fontStyle: 'italic',
      marginBottom: SPACING.section,
    },
    evaluationBox: {
      marginTop: SPACING.element,
      backgroundColor: COLORS.accentSoft,
      borderRadius: RADIUS,
      padding: SPACING.element,
    },
    evaluationLabel: {
      ...TYPOGRAPHY.label,
      color: COLORS.accent,
      textTransform: 'uppercase',
      marginBottom: 6,
    },
    evaluationScenario: {
      ...TYPOGRAPHY.body,
      color: COLORS.text,
      marginBottom: SPACING.tight,
    },
    evaluationQuestion: {
      ...TYPOGRAPHY.body,
      color: COLORS.text,
      marginBottom: 4,
    },
  });

  return (
    <Animated.View entering={FadeIn.duration(400)}>
      <ThemedText style={styles.situation}>{content.situation.text}</ThemedText>

      {content.sections.map((section, index) => (
        <SectionView key={index} section={section} isLast={index === content.sections.length - 1} />
      ))}

      {content.evaluation ? (
        <View style={styles.evaluationBox}>
          <ThemedText style={styles.evaluationLabel}>Situation d&apos;évaluation</ThemedText>
          <ThemedText style={styles.evaluationScenario}>{content.evaluation.scenario}</ThemedText>
          {content.evaluation.questions.map((question, index) => (
            <ThemedText key={index} style={styles.evaluationQuestion}>
              {index + 1}. {question}
            </ThemedText>
          ))}
        </View>
      ) : null}
    </Animated.View>
  );
}
