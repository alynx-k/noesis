import { StyleSheet, Text, TextInput, View, type TextInputProps } from 'react-native';
import { useAppTheme } from '../../hooks/use-app-theme';
import { fonts, radius, spacing } from '../../constants/theme';

type Props = TextInputProps & {
  label?: string;
  errorMessage?: string;
};

export function Input({ label, errorMessage, style, ...rest }: Props) {
  const theme = useAppTheme();
  const borderColor = errorMessage ? theme.error : theme.border;

  return (
    <View style={styles.wrapper}>
      {label ? <Text style={[styles.label, { color: theme.textMuted }]}>{label}</Text> : null}
      <TextInput
        placeholderTextColor={theme.textMuted}
        style={[
          styles.input,
          { borderColor, color: theme.text, backgroundColor: theme.card },
          style,
        ]}
        {...rest}
      />
      {errorMessage ? <Text style={[styles.error, { color: theme.error }]}>{errorMessage}</Text> : null}
    </View>
  );
}

const styles = StyleSheet.create({
  wrapper: {
    gap: spacing.xs,
  },
  label: {
    fontFamily: fonts.bodyMedium,
    fontSize: 13,
  },
  input: {
    fontFamily: fonts.body,
    fontSize: 16,
    borderWidth: 1.5,
    borderRadius: radius.sm,
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm + 2,
  },
  error: {
    fontFamily: fonts.body,
    fontSize: 12.5,
  },
});
