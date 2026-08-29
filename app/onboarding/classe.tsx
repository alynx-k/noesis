import { StyleSheet, Text, View } from 'react-native';
import { router } from 'expo-router';
import { OnboardingScaffold } from '../../components/onboarding-scaffold';
import { SelectableCard } from '../../components/ui/SelectableCard';
import { Button } from '../../components/ui/Button';
import { useOnboarding } from '../../context/onboarding';
import { useAppTheme } from '../../hooks/use-app-theme';
import {
  COLLEGE_GRADES,
  LYCEE_GRADES,
  GRADE_LABELS,
  SERIE_LABELS,
  gradeRequiresSerie,
  seriesForGrade,
} from '../../constants/grades';
import { fonts, spacing } from '../../constants/theme';

export default function Classe() {
  const theme = useAppTheme();
  const { grade, serie, setGrade, setSerie } = useOnboarding();
  const needsSerie = grade !== null && gradeRequiresSerie(grade);
  const canContinue = grade !== null && (!needsSerie || serie !== null);
  const availableSeries = grade ? seriesForGrade(grade) : [];

  return (
    <OnboardingScaffold
      step={1}
      totalSteps={4}
      title="Dans quelle classe es-tu ?"
      subtitle="Ton programme, tes cours et ta ligue seront adaptés à ta classe."
      footer={
        <Button
          label="Continuer"
          disabled={!canContinue}
          onPress={() => router.push('/onboarding/objectifs')}
        />
      }
    >
      <Text style={[styles.sectionLabel, { color: theme.textMuted }]}>Collège</Text>
      <View style={styles.grid}>
        {COLLEGE_GRADES.map((g) => (
          <View key={g} style={styles.gridItem}>
            <SelectableCard label={GRADE_LABELS[g]} selected={grade === g} onPress={() => setGrade(g)} />
          </View>
        ))}
      </View>

      <Text style={[styles.sectionLabel, { color: theme.textMuted, marginTop: spacing.md }]}>Lycée</Text>
      <View style={styles.grid}>
        {LYCEE_GRADES.map((g) => (
          <View key={g} style={styles.gridItem}>
            <SelectableCard label={GRADE_LABELS[g]} selected={grade === g} onPress={() => setGrade(g)} />
          </View>
        ))}
      </View>

      {needsSerie ? (
        <>
          <Text style={[styles.sectionLabel, { color: theme.textMuted, marginTop: spacing.md }]}>
            Ta série
          </Text>
          <View style={styles.column}>
            {availableSeries.map((s) => (
              <SelectableCard
                key={s}
                label={SERIE_LABELS[s]}
                selected={serie === s}
                onPress={() => setSerie(s)}
              />
            ))}
          </View>
        </>
      ) : null}
    </OnboardingScaffold>
  );
}

const styles = StyleSheet.create({
  sectionLabel: {
    fontFamily: fonts.bodySemiBold,
    fontSize: 13,
    textTransform: 'uppercase',
    letterSpacing: 0.5,
  },
  grid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: spacing.sm,
  },
  gridItem: {
    width: '47%',
  },
  column: {
    gap: spacing.sm,
  },
});
