import { useColorScheme } from 'react-native';

import { DARK_COLORS, LIGHT_COLORS } from '@/constants/design';

export type ThemeColors = typeof LIGHT_COLORS;

// The one place that decides light vs dark — every migrated screen calls
// this instead of importing the static `COLORS` from constants/design.ts,
// so it re-renders with the right palette whenever the OS theme changes.
export function useThemeColors(): ThemeColors {
  const scheme = useColorScheme();
  return scheme === 'dark' ? DARK_COLORS : LIGHT_COLORS;
}

// Same role as constants/design.ts' CARD_BORDER, but theme-reactive: pass
// the colors from useThemeColors() so the border shifts with the palette.
export function cardBorder(colors: ThemeColors) {
  return { borderWidth: 1, borderColor: colors.border };
}
