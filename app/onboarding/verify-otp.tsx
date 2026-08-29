import { useState } from 'react';
import { Text } from 'react-native';
import { router, useLocalSearchParams } from 'expo-router';
import { OnboardingScaffold } from '../../components/onboarding-scaffold';
import { Button } from '../../components/ui/Button';
import { Input } from '../../components/ui/Input';
import { useAppTheme } from '../../hooks/use-app-theme';
import { useAuth } from '../../context/auth';
import { useOnboarding } from '../../context/onboarding';
import { supabase } from '../../lib/supabase';
import { completeOnboarding } from '../../lib/profile';

export default function VerifyOtp() {
  const theme = useAppTheme();
  const { method, contact } = useLocalSearchParams<{ method: 'phone' | 'email'; contact: string }>();
  const { refreshProfile } = useAuth();
  const { grade, serie, objectiveIds } = useOnboarding();
  const [code, setCode] = useState('');
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);
  const [resending, setResending] = useState(false);

  async function handleVerify() {
    if (code.length < 4) {
      setError('Entre le code reçu.');
      return;
    }
    setError(null);
    setLoading(true);

    const { data, error: verifyError } =
      method === 'phone'
        ? await supabase.auth.verifyOtp({ phone: contact, token: code, type: 'sms' })
        : await supabase.auth.verifyOtp({ email: contact, token: code, type: 'email' });

    if (verifyError || !data.session) {
      setLoading(false);
      setError('Code invalide ou expiré. Réessaie.');
      return;
    }

    try {
      if (grade) {
        await completeOnboarding({ userId: data.session.user.id, grade, serie, objectiveIds });
      }
      await refreshProfile();
      router.replace('/(tabs)');
    } catch {
      setLoading(false);
      setError("Ton compte est créé, mais l'enregistrement de ton profil a échoué. Réessaie.");
    }
  }

  async function handleResend() {
    setResending(true);
    setError(null);
    const { error: resendError } =
      method === 'phone'
        ? await supabase.auth.signInWithOtp({ phone: contact })
        : await supabase.auth.signInWithOtp({ email: contact });
    setResending(false);
    if (resendError) setError(resendError.message);
  }

  return (
    <OnboardingScaffold
      step={4}
      totalSteps={4}
      title="Entre le code reçu"
      subtitle={`Un code à usage unique a été envoyé ${method === 'phone' ? 'par SMS au' : 'par email à'} ${contact}.`}
      footer={<Button label="Valider" loading={loading} onPress={handleVerify} />}
    >
      <Input
        placeholder="12345678"
        keyboardType="number-pad"
        value={code}
        onChangeText={setCode}
        maxLength={8}
        errorMessage={error ?? undefined}
      />
      <Text
        onPress={resending ? undefined : handleResend}
        style={{ color: theme.primary, fontSize: 14, marginTop: 4 }}
      >
        {resending ? 'Envoi en cours…' : 'Renvoyer le code'}
      </Text>
    </OnboardingScaffold>
  );
}
