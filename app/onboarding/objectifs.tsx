import { useState } from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { router } from 'expo-router';
import { OnboardingScaffold } from '../../components/onboarding-scaffold';
import { SelectableCard } from '../../components/ui/SelectableCard';
import { Button } from '../../components/ui/Button';
import { useOnboarding } from '../../context/onboarding';
import { useAuth } from '../../context/auth';
import { useAppTheme } from '../../hooks/use-app-theme';
import { completeOnboarding } from '../../lib/profile';
import { OBJECTIVES } from '../../constants/objectives';
import { spacing } from '../../constants/theme';

export default function Objectifs() {
  const theme = useAppTheme();
  const { grade, serie, objectiveIds, toggleObjective } = useOnboarding();
  const { session, refreshProfile } = useAuth();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  async function handleContinue() {
    // Un compte existe déjà (ex : app relancée avant la fin de l'onboarding précédent) :
    // on finalise directement plutôt que de repasser par la création de compte.
    if (session && grade) {
      setLoading(true);
      setError(null);
      try {
        await completeOnboarding({ userId: session.user.id, grade, serie, objectiveIds });
        await refreshProfile();
        router.replace('/(tabs)');
      } catch {
        setLoading(false);
        setError("L'enregistrement a échoué, réessaie.");
      }
      return;
    }
    router.push('/onboarding/compte');
  }

  return (
    <OnboardingScaffold
      step={2}
      totalSteps={4}
      title="Quels sont tes objectifs ?"
      subtitle="Choisis-en un ou plusieurs — tu pourras les changer plus tard."
      footer={
        <Button
          label="Continuer"
          disabled={objectiveIds.length === 0}
          loading={loading}
          onPress={handleContinue}
        />
      }
    >
      <View style={styles.column}>
        {OBJECTIVES.map((o) => (
          <SelectableCard
            key={o.id}
            label={o.label}
            selected={objectiveIds.includes(o.id)}
            onPress={() => toggleObjective(o.id)}
          />
        ))}
      </View>
      {error ? <Text style={{ color: theme.error, fontSize: 13 }}>{error}</Text> : null}
    </OnboardingScaffold>
  );
}

const styles = StyleSheet.create({
  column: { gap: spacing.sm },
});
