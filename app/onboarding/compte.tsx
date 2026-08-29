import { useState } from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { router } from 'expo-router';
import { OnboardingScaffold } from '../../components/onboarding-scaffold';
import { Button } from '../../components/ui/Button';
import { Input } from '../../components/ui/Input';
import { useAppTheme } from '../../hooks/use-app-theme';
import { supabase } from '../../lib/supabase';
import { fonts, radius, spacing } from '../../constants/theme';

type Method = 'phone' | 'email';

const COUNTRY_CODE = '+225';

export default function Compte() {
  const theme = useAppTheme();
  const [method, setMethod] = useState<Method>('phone');
  const [phone, setPhone] = useState('');
  const [email, setEmail] = useState('');
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);

  async function handleSubmit() {
    setError(null);

    if (method === 'phone') {
      const digits = phone.replace(/\D/g, '');
      if (digits.length < 8) {
        setError('Entre un numéro de téléphone valide.');
        return;
      }
      const fullPhone = `${COUNTRY_CODE}${digits}`;
      setLoading(true);
      const { error: otpError } = await supabase.auth.signInWithOtp({ phone: fullPhone });
      setLoading(false);
      if (otpError) {
        setError(otpError.message);
        return;
      }
      router.push({ pathname: '/onboarding/verify-otp', params: { method: 'phone', contact: fullPhone } });
    } else {
      if (!email.includes('@')) {
        setError('Entre une adresse email valide.');
        return;
      }
      setLoading(true);
      const { error: otpError } = await supabase.auth.signInWithOtp({ email, options: { shouldCreateUser: true } });
      setLoading(false);
      if (otpError) {
        setError(otpError.message);
        return;
      }
      router.push({ pathname: '/onboarding/verify-otp', params: { method: 'email', contact: email } });
    }
  }

  return (
    <OnboardingScaffold
      step={3}
      totalSteps={4}
      title="Crée ton compte"
      subtitle="On t'envoie un code à usage unique — pas de mot de passe à retenir."
      footer={<Button label="Recevoir le code" loading={loading} onPress={handleSubmit} />}
    >
      <View style={[styles.toggle, { borderColor: theme.border }]}>
        <ToggleOption label="Téléphone" active={method === 'phone'} onPress={() => setMethod('phone')} />
        <ToggleOption label="Email" active={method === 'email'} onPress={() => setMethod('email')} />
      </View>

      {method === 'phone' ? (
        <View style={styles.phoneRow}>
          <View style={[styles.countryCode, { borderColor: theme.border, backgroundColor: theme.card }]}>
            <Text style={{ color: theme.text, fontFamily: fonts.bodySemiBold }}>{COUNTRY_CODE}</Text>
          </View>
          <View style={{ flex: 1 }}>
            <Input
              placeholder="07 58 XX XX XX"
              keyboardType="phone-pad"
              value={phone}
              onChangeText={setPhone}
              errorMessage={error ?? undefined}
            />
          </View>
        </View>
      ) : (
        <Input
          placeholder="toi@exemple.com"
          keyboardType="email-address"
          autoCapitalize="none"
          value={email}
          onChangeText={setEmail}
          errorMessage={error ?? undefined}
        />
      )}
    </OnboardingScaffold>
  );
}

function ToggleOption({ label, active, onPress }: { label: string; active: boolean; onPress: () => void }) {
  const theme = useAppTheme();
  return (
    <Text
      onPress={onPress}
      style={[
        styles.toggleOption,
        {
          color: active ? '#FFFFFF' : theme.text,
          backgroundColor: active ? theme.primary : 'transparent',
          fontFamily: fonts.bodySemiBold,
        },
      ]}
    >
      {label}
    </Text>
  );
}

const styles = StyleSheet.create({
  toggle: {
    flexDirection: 'row',
    borderWidth: 1.5,
    borderRadius: radius.full,
    padding: 4,
    marginBottom: spacing.sm,
  },
  toggleOption: {
    flex: 1,
    textAlign: 'center',
    paddingVertical: spacing.sm,
    borderRadius: radius.full,
    fontSize: 14.5,
    overflow: 'hidden',
  },
  phoneRow: {
    flexDirection: 'row',
    gap: spacing.sm,
    alignItems: 'flex-start',
  },
  countryCode: {
    borderWidth: 1.5,
    borderRadius: radius.sm,
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm + 2,
    justifyContent: 'center',
  },
});
