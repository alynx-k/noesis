import { useThemeSettings } from '../context/theme';
import type { Theme } from '../constants/theme';

export function useAppTheme(): Theme {
  return useThemeSettings().theme;
}
