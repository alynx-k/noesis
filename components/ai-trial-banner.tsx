import { StyleSheet, Text, View } from 'react-native';
import { router } from 'expo-router';
import { Button } from './ui/Button';
import { useAppTheme } from '../hooks/use-app-theme';
import { fonts, radius, spacing } from '../constants/theme';

type Props = {
  isPremium: boolean;
  trialsRemaining: number | null;
  isLocked: boolean;
  lockedMessage?: string;
};

export function AiTrialBanner({ isPremium, trialsRemaining, isLocked, lockedMessage }: Props) {
  const theme = useAppTheme();
  if (isPremium) return null;

  return (
    <View style={[styles.banner, { backgroundColor: theme.primaryTint }]}>
      {isLocked ? (
        <>
          <Text style={{ color: theme.primary, fontFamily: fonts.bodySemiBold, marginBottom: spacing.xs }}>
            Essais gratuits épuisés
          </Text>
          <Text style={{ color: theme.text, fontFamily: fonts.body, fontSize: 13.5, marginBottom: spacing.sm }}>
            {lockedMessage ?? 'Passe Premium pour continuer à utiliser le tuteur IA sans limite.'}
          </Text>
          <Button label="Passer Premium" onPress={() => router.push('/subscription')} />
        </>
      ) : (
        <Text style={{ color: theme.primary, fontFamily: fonts.bodySemiBold }}>
          {trialsRemaining} essai{trialsRemaining! > 1 ? 's' : ''} gratuit{trialsRemaining! > 1 ? 's' : ''} restant
          {trialsRemaining! > 1 ? 's' : ''}
        </Text>
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  banner: { borderRadius: radius.md, padding: spacing.md },
});
