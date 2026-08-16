import { useState } from 'react';
import { StyleSheet, TextInput } from 'react-native';
import Animated, { FadeInDown } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { GradePicker } from '@/components/grade-picker';
import { SeriePicker } from '@/components/serie-picker';
import { ThemedText } from '@/components/themed-text';
import { Button } from '@/components/ui/button';
import { Screen } from '@/components/ui/screen';
import { toast } from '@/components/ui/toast';
import { SPACING, TYPOGRAPHY } from '@/constants/design';
import { GradeId, isLyceeGrade, SeriesId } from '@/constants/grades';
import { useSetInitialGrade } from '@/hooks/queries/use-onboarding';
import { useRedeemReferralCode } from '@/hooks/queries/use-referral';
import { useThemeColors } from '@/hooks/use-theme-colors';

export default function SelectGradeScreen() {
  const COLORS = useThemeColors();
  const [selectedGrade, setSelectedGrade] = useState<GradeId | null>(null);
  const [pendingGrade, setPendingGrade] = useState<GradeId | null>(null);
  const [selectedSerie, setSelectedSerie] = useState<SeriesId | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [showReferralField, setShowReferralField] = useState(false);
  const [referralCode, setReferralCode] = useState('');
  const setInitialGrade = useSetInitialGrade();
  const redeemReferralCode = useRedeemReferralCode();

  const finalize = async (grade: GradeId, serie: SeriesId | null) => {
    if (setInitialGrade.isPending) {
      return;
    }
    setError(null);
    const result = await setInitialGrade.mutateAsync({ grade, serie });
    if (result.error) {
      setError(result.error);
      return;
    }
    // Best-effort and silent-ish on failure (a wrong/expired code is not
    // worth blocking a brand-new student's first screen over) — only a
    // success gets a toast, so the reward actually feels earned.
    if (referralCode.trim()) {
      const redeemResult = await redeemReferralCode.mutateAsync(referralCode.trim());
      if ('error' in redeemResult) {
        toast.show(redeemResult.error, { variant: 'error' });
      } else {
        toast.show(`Code appliqué — ${redeemResult.rewardDays} jours de Premium offerts !`, { variant: 'success' });
      }
    }
    // No manual navigation: the profile query invalidation above makes the
    // root gate re-resolve, and Stack.Protected redirects automatically.
  };

  // Selecting a card only updates local state and its visual selected
  // style — advancing to the série sub-step (or submitting directly for a
  // non-lycée grade) only happens from "Continuer" (handleContinueFromGrade).
  const handleSelectGrade = (grade: GradeId) => {
    setSelectedGrade(grade);
  };

  const handleContinueFromGrade = () => {
    if (!selectedGrade) {
      return;
    }
    if (isLyceeGrade(selectedGrade)) {
      setPendingGrade(selectedGrade);
      return;
    }
    finalize(selectedGrade, null);
  };

  const handleContinueFromSerie = () => {
    if (!pendingGrade || !selectedSerie) {
      return;
    }
    finalize(pendingGrade, selectedSerie);
  };

  const handleBackToGrade = () => {
    setPendingGrade(null);
    setSelectedSerie(null);
  };

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
    error: {
      color: COLORS.danger,
      marginBottom: SPACING.element,
    },
    backLink: {
      marginBottom: SPACING.element,
    },
    backLinkText: {
      ...TYPOGRAPHY.body,
      color: COLORS.accent,
      fontWeight: '600',
    },
    continueButton: {
      marginTop: SPACING.element,
    },
    referralToggle: {
      alignSelf: 'center',
      marginTop: SPACING.section,
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
      marginTop: SPACING.tight,
      textAlign: 'center',
      textTransform: 'uppercase',
    },
  });

  if (pendingGrade) {
    return (
      <Screen>
        <Animated.View entering={FadeInDown.duration(400).springify().damping(16)}>
          <BouncyPressable style={styles.backLink} onPress={handleBackToGrade}>
            <ThemedText style={styles.backLinkText}>‹ Changer de classe</ThemedText>
          </BouncyPressable>
          <ThemedText style={styles.title}>Quelle est ta série ?</ThemedText>
          <ThemedText style={styles.subtitle}>Les matières changent selon ta série.</ThemedText>

          {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}

          <SeriePicker grade={pendingGrade} selectedSerie={selectedSerie} onSelect={setSelectedSerie} />
          <Button
            label="Continuer"
            onPress={handleContinueFromSerie}
            disabled={!selectedSerie}
            loading={setInitialGrade.isPending}
            style={styles.continueButton}
          />
        </Animated.View>
      </Screen>
    );
  }

  return (
    <Screen>
      <Animated.View entering={FadeInDown.duration(400).springify().damping(16)}>
        <ThemedText style={styles.title}>Dans quelle classe es-tu ?</ThemedText>
        <ThemedText style={styles.subtitle}>Choisis ta classe pour commencer à réviser.</ThemedText>

        {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}

        <GradePicker selectedGrade={selectedGrade} onSelect={handleSelectGrade} />
        <Button
          label="Continuer"
          onPress={handleContinueFromGrade}
          disabled={!selectedGrade}
          loading={setInitialGrade.isPending}
          style={styles.continueButton}
        />

        {showReferralField ? (
          <TextInput
            style={styles.referralInput}
            value={referralCode}
            onChangeText={setReferralCode}
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
