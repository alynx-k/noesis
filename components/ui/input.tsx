import { forwardRef } from 'react';
import { StyleSheet, TextInput, TextInputProps, View } from 'react-native';

import { ThemedText } from '@/components/themed-text';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

type TextFieldProps = TextInputProps & {
  label?: string;
  error?: string;
};

export const TextField = forwardRef<TextInput, TextFieldProps>(function TextField(
  { label, error, style, ...rest },
  ref,
) {
  const COLORS = useThemeColors();

  const styles = StyleSheet.create({
    wrapper: {
      marginBottom: SPACING.element,
    },
    label: {
      ...TYPOGRAPHY.label,
      color: COLORS.mutedText,
      textTransform: 'uppercase',
      marginBottom: 6,
    },
    input: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: 16,
      fontSize: 16,
      color: COLORS.text,
      ...cardBorder(COLORS),
    },
    inputError: {
      borderColor: COLORS.danger,
    },
    error: {
      ...TYPOGRAPHY.caption,
      color: COLORS.danger,
      marginTop: 6,
    },
  });

  return (
    <View style={styles.wrapper}>
      {label ? <ThemedText style={styles.label}>{label}</ThemedText> : null}
      <TextInput
        ref={ref}
        style={[styles.input, !!error && styles.inputError, style]}
        placeholderTextColor={COLORS.placeholderText}
        {...rest}
      />
      {error ? <ThemedText style={styles.error}>{error}</ThemedText> : null}
    </View>
  );
});
