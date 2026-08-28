import { router } from 'expo-router';
import { useState } from 'react';
import { StyleSheet, TextInput, View } from 'react-native';
import Animated, { FadeInDown } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { OnboardingHeader } from '@/components/onboarding-header';
import { SeriePicker } from '@/components/serie-picker';
import { ThemedText } from '@/components/themed-text';
import { Button } from '@/components/ui/button';
import { Screen } from '@/components/ui/screen';
import { SelectableCard } from '@/components/ui/selectable-card';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { isLv2Applicable } from '@/constants/disciplines';
import { GRADES, GradeId, isLyceeGrade, LYCEE_GRADES, SeriesId } from '@/constants/grades';
import type { NiveauWaitlistId } from '@/constants/onboarding';
import { useOnboarding } from '@/context/onboarding';
import { useJoinNiveauWaitlist } from '@/hooks/queries/use-onboarding';
import { useThemeColors } from '@/hooks/use-theme-colors';

type Tier = 'college' | 'lycee' | NiveauWaitlistId;
type TierOption = { id: Tier; label: string; caption: string };

const COLLEGE_GRADES = GRADES.filter((grade) => !isLyceeGrade(grade.id));
const LYCEE_GRADE_LIST = GRADES.filter((grade) => LYCEE_GRADES.includes(grade.id));

const TIERS: TierOption[] = [
  { id: 'college', label: 'Collège', caption: '6e, 5e, 4e, 3e' },
  { id: 'lycee', label: 'Lycée', caption: 'Seconde, Première, Terminale' },
  { id: 'superieur', label: 'Supérieur', caption: 'BTS, Licence, Master...' },
  { id: 'autre', label: 'Autre', caption: 'Formation, autodidacte...' },
];

export default function OnboardingNiveauScreen() {
  const COLORS = useThemeColors();
  const { answers, setAnswers } = useOnboarding();
  const joinWaitlist = useJoinNiveauWaitlist();

  const [tier, setTier] = useState<Tier | null>(null);
  const [pendingGrade, setPendingGrade] = useState<GradeId | null>(null);
  const [selectedSerie, setSelectedSerie] = useState<SeriesId | null>(null);
  const [showReferralField, setShowReferralField] = useState(false);

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
    list: {
      gap: 10,
      flex: 1,
    },
    tierCard: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      borderWidth: 2,
      borderColor: COLORS.border,
      paddingVertical: 14,
      paddingHorizontal: 16,
    },
    tierCardSelected: {
      backgroundColor: COLORS.accentSoft,
      borderColor: COLORS.accent,
    },
    tierLabel: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
    },
    tierLabelSelected: {
      color: COLORS.accent,
    },
    tierCaption: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
      marginTop: 2,
    },
    referralToggle: {
      alignSelf: 'center',
      marginTop: SPACING.element,
    },
    referralToggleText: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
      textDecorationLine: 'underline',
    },
    referralInput: {
      ...TYPOGRAPHY.body,
      color: COLORS.text,
      backgroundColor: COLORS.surface,
      borderWidth: 1.5,
      borderColor: COLORS.border,
      borderRadius: 12,
      padding: SPACING.element,
      marginTop: SPACING.element,
      textAlign: 'center',
      textTransform: 'uppercase',
    },
  });

  const handleContinueFromTier = async () => {
    if (!tier) {
      return;
    }
    if (tier === 'superieur' || tier === 'autre') {
      const result = await joinWaitlist.mutateAsync(tier);
      if (!result.error) {
        router.replace('/onboarding/waitlist');
      }
      return;
    }
    // Collège/Lycée: stay on this screen, it re-renders into the grade picker below.
  };

  const handleSelectGrade = (grade: GradeId) => {
    // Tapping the already-selected grade again deselects it — the only way
    // back to the full list without leaving this screen (the header's back
    // arrow goes all the way to the tier picker instead).
    if (grade === pendingGrade) {
      setPendingGrade(null);
      setSelectedSerie(null);
      return;
    }
    setPendingGrade(grade);
    setSelectedSerie(null);
  };

  const handleContinueFromGrade = () => {
    if (!pendingGrade) {
      return;
    }
    if (isLyceeGrade(pendingGrade) && !selectedSerie) {
      return;
    }
    const serie = isLyceeGrade(pendingGrade) ? selectedSerie : null;
    setAnswers({ grade: pendingGrade, serie });
    router.push(isLv2Applicable(pendingGrade, serie) ? '/onboarding/lv2' : '/onboarding/objectifs');
  };

  if (tier === 'college' || tier === 'lycee') {
    const gradeList = tier === 'college' ? COLLEGE_GRADES : LYCEE_GRADE_LIST;
    return (
      <Screen>
        <OnboardingHeader step={2} totalSteps={8} onBack={() => setTier(null)} />
        <Animated.View entering={FadeInDown.duration(300)} style={{ flex: 1 }}>
          <ThemedText style={styles.title}>Dans quelle classe es-tu ?</ThemedText>
          <ThemedText style={styles.subtitle}>Cela nous aidera à personnaliser ton expérience.</ThemedText>

          <View style={styles.list}>
            {(pendingGrade ? gradeList.filter((grade) => grade.id === pendingGrade) : gradeList).map((grade) => (
              <SelectableCard
                key={grade.id}
                label={grade.label}
                selected={grade.id === pendingGrade}
                onPress={() => handleSelectGrade(grade.id)}
              />
            ))}
            {pendingGrade && isLyceeGrade(pendingGrade) ? (
              <SeriePicker grade={pendingGrade} selectedSerie={selectedSerie} onSelect={setSelectedSerie} />
            ) : null}
          </View>

          <Button
            label="Suivant"
            onPress={handleContinueFromGrade}
            disabled={!pendingGrade || (isLyceeGrade(pendingGrade) && !selectedSerie)}
          />
        </Animated.View>
      </Screen>
    );
  }

  return (
    <Screen>
      <OnboardingHeader step={2} totalSteps={8} />
      <Animated.View entering={FadeInDown.duration(300)} style={{ flex: 1 }}>
        <ThemedText style={styles.title}>Quel est ton niveau d&apos;étude ?</ThemedText>
        <ThemedText style={styles.subtitle}>Cela nous aidera à personnaliser ton expérience.</ThemedText>

        <View style={styles.list}>
          {TIERS.map((option) => (
            <BouncyPressable
              key={option.id}
              style={[styles.tierCard, tier === option.id && styles.tierCardSelected]}
              onPress={() => setTier(option.id)}>
              <ThemedText style={[styles.tierLabel, tier === option.id && styles.tierLabelSelected]}>
                {option.label}
              </ThemedText>
              <ThemedText style={styles.tierCaption}>{option.caption}</ThemedText>
            </BouncyPressable>
          ))}
        </View>

        <Button label="Suivant" onPress={handleContinueFromTier} disabled={!tier} loading={joinWaitlist.isPending} />

        {showReferralField ? (
          <TextInput
            style={styles.referralInput}
            value={answers.referralCode}
            onChangeText={(referralCode) => setAnswers({ referralCode })}
            placeholder="CODE"
            placeholderTextColor={COLORS.mutedText}
            autoCapitalize="characters"
            autoCorrect={false}
            maxLength={6}
          />
        ) : (
          <BouncyPressable style={styles.referralToggle} onPress={() => setShowReferralField(true)}>
            <ThemedText style={styles.referralToggleText}>J&apos;ai un code de parrainage</ThemedText>
          </BouncyPressable>
        )}
      </Animated.View>
    </Screen>
  );
}
