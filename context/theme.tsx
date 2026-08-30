import { createContext, useContext, useEffect, useMemo, useState, type ReactNode } from 'react';
import { useColorScheme } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { lightTheme, darkTheme, type Theme } from '../constants/theme';

export type ThemePreference = 'system' | 'light' | 'dark';

const STORAGE_KEY = 'noesis.theme-preference';

type ThemeContextValue = {
  theme: Theme;
  colorScheme: 'light' | 'dark';
  preference: ThemePreference;
  setPreference: (pref: ThemePreference) => void;
  isLoaded: boolean;
};

const ThemeContext = createContext<ThemeContextValue | null>(null);

// Seule source de vérité pour le thème actif — useAppTheme() lit ce contexte,
// donc chaque écran qui l'utilise déjà (tous, depuis la Phase 1) respecte
// automatiquement le choix de l'élève sans être modifié individuellement.
export function AppThemeProvider({ children }: { children: ReactNode }) {
  const systemScheme = useColorScheme();
  const [preference, setPreferenceState] = useState<ThemePreference>('system');
  const [isLoaded, setIsLoaded] = useState(false);

  useEffect(() => {
    AsyncStorage.getItem(STORAGE_KEY)
      .then((stored) => {
        if (stored === 'light' || stored === 'dark' || stored === 'system') {
          setPreferenceState(stored);
        }
      })
      .finally(() => setIsLoaded(true));
  }, []);

  function setPreference(pref: ThemePreference) {
    setPreferenceState(pref);
    AsyncStorage.setItem(STORAGE_KEY, pref).catch(() => {});
  }

  const colorScheme: 'light' | 'dark' =
    preference === 'system' ? (systemScheme === 'dark' ? 'dark' : 'light') : preference;
  const theme = colorScheme === 'dark' ? darkTheme : lightTheme;

  const value = useMemo<ThemeContextValue>(
    () => ({ theme, colorScheme, preference, setPreference, isLoaded }),
    // eslint-disable-next-line react-hooks/exhaustive-deps
    [theme, colorScheme, preference, isLoaded]
  );

  return <ThemeContext.Provider value={value}>{children}</ThemeContext.Provider>;
}

export function useThemeSettings() {
  const ctx = useContext(ThemeContext);
  if (!ctx) throw new Error('useThemeSettings doit être utilisé dans AppThemeProvider');
  return ctx;
}
