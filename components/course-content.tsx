import Ionicons from '@expo/vector-icons/Ionicons';
import { useState } from 'react';
import { LayoutChangeEvent, StyleSheet, View } from 'react-native';
import Animated, { FadeIn, LinearTransition } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { DataTable } from '@/components/data-table';
import { GeometryDiagram } from '@/components/geometry-diagram';
import { HighlightedText } from '@/components/highlighted-text';
import { ThemedText } from '@/components/themed-text';
import { PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { CourseContentV2, CourseFixation, CourseSection } from '@/lib/courses';
import { formatMathNotation } from '@/lib/math-notation';

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
      <ThemedText style={styles.question}>{formatMathNotation(fixation.question)}</ThemedText>
      {revealed ? (
        <Animated.View entering={FadeIn.duration(250)}>
          <ThemedText style={styles.solution}>{formatMathNotation(fixation.solution)}</ThemedText>
        </Animated.View>
      ) : (
        <BouncyPressable style={styles.revealButton} onPress={() => setRevealed(true)}>
          <ThemedText style={styles.revealButtonText}>Voir la correction</ThemedText>
        </BouncyPressable>
      )}
    </Animated.View>
  );
}

function SectionView({
  section,
  stepNumber,
  onLayout,
}: {
  section: CourseSection;
  stepNumber: number;
  onLayout?: (event: LayoutChangeEvent) => void;
}) {
  const COLORS = useThemeColors();

  const styles = StyleSheet.create({
    wrapper: {
      marginBottom: SPACING.tight,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      ...cardBorder(COLORS),
    },
    heading: {
      ...TYPOGRAPHY.body,
      fontSize: 18,
      fontWeight: '700',
      color: COLORS.text,
      marginBottom: SPACING.tight,
    },
    body: {
      ...TYPOGRAPHY.body,
      fontSize: 17,
      lineHeight: 26,
      color: COLORS.text,
    },
    highlight: {
      ...TYPOGRAPHY.body,
      fontSize: 17,
      lineHeight: 26,
      color: COLORS.accent,
      fontWeight: '700',
      textDecorationLine: 'underline',
    },
    propertyBox: {
      marginTop: SPACING.element,
      borderRadius: RADIUS,
      padding: SPACING.element,
      ...cardBorder(COLORS),
      borderLeftWidth: 4,
      borderLeftColor: COLORS.accent,
    },
    propertyLabelRow: {
      flexDirection: 'row',
      alignItems: 'center',
      alignSelf: 'flex-start',
      gap: 6,
      backgroundColor: COLORS.accentSoft,
      borderRadius: PILL_RADIUS,
      paddingVertical: 5,
      paddingHorizontal: 10,
      marginBottom: SPACING.tight,
    },
    propertyLabel: {
      ...TYPOGRAPHY.label,
      color: COLORS.accent,
      textTransform: 'uppercase',
    },
    propertyText: {
      ...TYPOGRAPHY.body,
      fontSize: 16,
      lineHeight: 24,
      color: COLORS.text,
    },
    exampleBox: {
      marginTop: SPACING.element,
      backgroundColor: COLORS.lockedBackground,
      borderRadius: RADIUS,
      padding: SPACING.element,
      borderLeftWidth: 4,
      borderLeftColor: COLORS.mutedText,
    },
    exampleLabelRow: {
      flexDirection: 'row',
      alignItems: 'center',
      alignSelf: 'flex-start',
      gap: 6,
      backgroundColor: COLORS.surface,
      borderRadius: PILL_RADIUS,
      paddingVertical: 5,
      paddingHorizontal: 10,
      marginBottom: SPACING.tight,
      ...cardBorder(COLORS),
    },
    exampleLabel: {
      ...TYPOGRAPHY.label,
      color: COLORS.mutedText,
      textTransform: 'uppercase',
    },
    exampleStatement: {
      ...TYPOGRAPHY.body,
      fontSize: 16,
      lineHeight: 24,
      color: COLORS.text,
      fontStyle: 'italic',
      marginBottom: SPACING.tight,
    },
    exampleSolution: {
      ...TYPOGRAPHY.body,
      fontSize: 16,
      lineHeight: 24,
      color: COLORS.text,
    },
  });

  return (
    <View style={styles.wrapper} onLayout={onLayout}>
      <ThemedText style={styles.heading}>
        {stepNumber}. {section.heading}
      </ThemedText>
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
          <ThemedText style={styles.propertyText}>{formatMathNotation(section.property.text)}</ThemedText>
        </View>
      ) : null}

      {section.example ? (
        <View style={styles.exampleBox}>
          <View style={styles.exampleLabelRow}>
            <Ionicons name="book-outline" size={15} color={COLORS.mutedText} />
            <ThemedText style={styles.exampleLabel}>Exemple</ThemedText>
          </View>
          <ThemedText style={styles.exampleStatement}>{formatMathNotation(section.example.statement)}</ThemedText>
          <ThemedText style={styles.exampleSolution}>{formatMathNotation(section.example.solution)}</ThemedText>
        </View>
      ) : null}

      {section.fixation ? <FixationBlock fixation={section.fixation} /> : null}
    </View>
  );
}

type CourseContentProps = {
  content: CourseContentV2;
  // Reports each step's Y position (relative to the scroll container) as it
  // lays out, so the course screen's stepper sidebar can scroll to it on tap.
  onSectionLayout?: (index: number, y: number) => void;
};

export function CourseContent({ content, onSectionLayout }: CourseContentProps) {
  const COLORS = useThemeColors();

  const styles = StyleSheet.create({
    situationCard: {
      marginBottom: SPACING.tight,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      ...cardBorder(COLORS),
    },
    heading: {
      ...TYPOGRAPHY.body,
      fontSize: 18,
      fontWeight: '700',
      color: COLORS.text,
      marginBottom: SPACING.tight,
    },
    situationText: {
      ...TYPOGRAPHY.body,
      color: COLORS.text,
    },
    evaluationBox: {
      marginBottom: SPACING.tight,
      backgroundColor: COLORS.accentSoft,
      borderRadius: RADIUS,
      padding: SPACING.element,
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
      <View style={styles.situationCard} onLayout={(event) => onSectionLayout?.(0, event.nativeEvent.layout.y)}>
        <ThemedText style={styles.heading}>1. Introduction</ThemedText>
        <ThemedText style={styles.situationText}>{formatMathNotation(content.situation.text)}</ThemedText>
      </View>

      {content.sections.map((section, index) => (
        <SectionView
          key={index}
          section={section}
          stepNumber={index + 2}
          onLayout={(event) => onSectionLayout?.(index + 1, event.nativeEvent.layout.y)}
        />
      ))}

      {content.evaluation ? (
        <View
          style={styles.evaluationBox}
          onLayout={(event) => onSectionLayout?.(content.sections.length + 1, event.nativeEvent.layout.y)}>
          <ThemedText style={styles.heading}>{content.sections.length + 2}. Bilan</ThemedText>
          <ThemedText style={styles.evaluationScenario}>{formatMathNotation(content.evaluation.scenario)}</ThemedText>
          {content.evaluation.questions.map((question, index) => (
            <ThemedText key={index} style={styles.evaluationQuestion}>
              {index + 1}. {formatMathNotation(question)}
            </ThemedText>
          ))}
        </View>
      ) : null}
    </Animated.View>
  );
}
