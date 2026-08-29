import { StyleSheet, Text, View } from 'react-native';
import { Button } from './Button';
import { useAppTheme } from '../../hooks/use-app-theme';
import { fonts, spacing } from '../../constants/theme';

type Props = {
  message?: string;
  onRetry?: () => void;
};

export function ErrorState({
  message = 'Impossible de charger le contenu. Vérifie ta connexion internet.',
  onRetry,
}: Props) {
  const theme = useAppTheme();

  return (
    <View style={styles.wrapper}>
      <Text style={[styles.message, { color: theme.textMuted }]}>{message}</Text>
      {onRetry ? <Button label="Réessayer" variant="ghost" onPress={onRetry} /> : null}
    </View>
  );
}

const styles = StyleSheet.create({
  wrapper: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    gap: spacing.md,
    padding: spacing.lg,
  },
  message: {
    fontFamily: fonts.body,
    fontSize: 15,
    textAlign: 'center',
  },
});
