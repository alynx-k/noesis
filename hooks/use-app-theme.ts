import { useColorScheme } from 'react-native';
import { darkTheme, lightTheme, type Theme } from '../constants/theme';

export function useAppTheme(): Theme {
  const scheme = useColorScheme();
  return scheme === 'dark' ? darkTheme : lightTheme;
}
