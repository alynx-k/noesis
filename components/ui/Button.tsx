import { ActivityIndicator, Pressable, StyleSheet, Text, View, type PressableProps } from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { useAppTheme } from '../../hooks/use-app-theme';
import { fonts, radius, spacing } from '../../constants/theme';

type Variant = 'primary' | 'secondary' | 'ghost';

type Props = PressableProps & {
  label: string;
  variant?: Variant;
  loading?: boolean;
  icon?: keyof typeof Ionicons.glyphMap;
};

export function Button({ label, variant = 'primary', loading = false, icon, disabled, style, ...rest }: Props) {
  const theme = useAppTheme();
  const isDisabled = disabled || loading;

  const backgroundColor =
    variant === 'primary' ? theme.primary : variant === 'secondary' ? theme.secondary : 'transparent';
  const textColor = variant === 'ghost' ? theme.text : '#FFFFFF';
  const borderColor = variant === 'ghost' ? theme.border : 'transparent';

  return (
    <Pressable
      accessibilityRole="button"
      accessibilityState={{ disabled: isDisabled }}
      disabled={isDisabled}
      style={(state) => [
        styles.base,
        { backgroundColor, borderColor, opacity: isDisabled ? 0.6 : state.pressed ? 0.85 : 1 },
        typeof style === 'function' ? style(state) : style,
      ]}
      {...rest}
    >
      {loading ? (
        <ActivityIndicator color={textColor} />
      ) : (
        <View style={styles.content}>
          {icon ? <Ionicons name={icon} size={18} color={textColor} /> : null}
          <Text style={[styles.label, { color: textColor }]}>{label}</Text>
        </View>
      )}
    </Pressable>
  );
}

const styles = StyleSheet.create({
  base: {
    borderRadius: radius.full,
    paddingVertical: spacing.md - 3,
    paddingHorizontal: spacing.lg,
    borderWidth: 1.5,
    alignItems: 'center',
    justifyContent: 'center',
  },
  content: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: spacing.xs,
  },
  label: {
    fontFamily: fonts.bodySemiBold,
    fontSize: 16,
  },
});
