import { StyleSheet, Text, View } from 'react-native';
import { useAppTheme } from '../../hooks/use-app-theme';
import { fonts, spacing } from '../../constants/theme';

export function EmptyState({ title, message }: { title: string; message: string }) {
  const theme = useAppTheme();

  return (
    <View style={styles.wrapper}>
      <Text style={[styles.title, { color: theme.text }]}>{title}</Text>
      <Text style={[styles.message, { color: theme.textMuted }]}>{message}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  wrapper: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    gap: spacing.xs,
    padding: spacing.lg,
  },
  title: {
    fontFamily: fonts.bodySemiBold,
    fontSize: 16,
    textAlign: 'center',
  },
  message: {
    fontFamily: fonts.body,
    fontSize: 14,
    textAlign: 'center',
  },
});
