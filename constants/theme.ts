export const palette = {
  primary: '#E85D2C',
  primaryDark: '#C64A1F',
  secondary: '#17203D',
  neutral50: '#FBF9F6',
  neutral100: '#F3EFE9',
  neutral300: '#D8D2C7',
  neutral500: '#8A8272',
  neutral700: '#4A4438',
  neutral900: '#221F19',
  success: '#2F9E5B',
  warning: '#E0A324',
  error: '#D64545',
  info: '#3172C7',
} as const;

export type Theme = {
  background: string;
  card: string;
  text: string;
  textMuted: string;
  border: string;
  primary: string;
  primaryTint: string;
  secondary: string;
  secondaryTint: string;
  success: string;
  warning: string;
  error: string;
  info: string;
};

export const lightTheme: Theme = {
  background: palette.neutral50,
  card: '#FFFFFF',
  text: palette.neutral900,
  textMuted: palette.neutral700,
  border: palette.neutral300,
  primary: palette.primary,
  primaryTint: '#FDEAE0',
  secondary: palette.secondary,
  secondaryTint: '#E7E9F0',
  success: palette.success,
  warning: palette.warning,
  error: palette.error,
  info: palette.info,
};

export const darkTheme: Theme = {
  background: palette.neutral900,
  card: '#2C2820',
  text: palette.neutral50,
  textMuted: palette.neutral300,
  border: '#3A342A',
  primary: palette.primary,
  primaryTint: '#3A2416',
  secondary: palette.secondary,
  secondaryTint: '#1D2438',
  success: palette.success,
  warning: palette.warning,
  error: palette.error,
  info: palette.info,
};

export const fonts = {
  display: 'CabinetGrotesk_700Bold',
  displayBlack: 'CabinetGrotesk_900Black',
  body: 'PlusJakartaSans_400Regular',
  bodyMedium: 'PlusJakartaSans_500Medium',
  bodySemiBold: 'PlusJakartaSans_600SemiBold',
  bodyBold: 'PlusJakartaSans_700Bold',
  data: 'Geist_500Medium',
  dataBold: 'Geist_700Bold',
  code: 'JetBrainsMono_400Regular',
} as const;

export const spacing = {
  '2xs': 2,
  xs: 4,
  sm: 8,
  md: 16,
  lg: 24,
  xl: 32,
  '2xl': 48,
  '3xl': 64,
} as const;

export const radius = {
  sm: 8,
  md: 14,
  lg: 20,
  full: 9999,
} as const;
