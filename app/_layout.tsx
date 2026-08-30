import { useEffect, useState } from 'react';
import { View, ActivityIndicator } from 'react-native';
import { Stack } from 'expo-router';
import { StatusBar } from 'expo-status-bar';
import * as SplashScreen from 'expo-splash-screen';
import * as Font from 'expo-font';
import {
  useFonts as usePlusJakartaSans,
  PlusJakartaSans_400Regular,
  PlusJakartaSans_500Medium,
  PlusJakartaSans_600SemiBold,
  PlusJakartaSans_700Bold,
} from '@expo-google-fonts/plus-jakarta-sans';
import { useFonts as useGeist, Geist_500Medium, Geist_700Bold } from '@expo-google-fonts/geist';
import { useFonts as useJetBrainsMono, JetBrainsMono_400Regular } from '@expo-google-fonts/jetbrains-mono';
import { QueryClientProvider } from '@tanstack/react-query';
import { AuthProvider } from '../context/auth';
import { OnboardingProvider } from '../context/onboarding';
import { FocusSessionProvider } from '../context/focus-session';
import { AppThemeProvider, useThemeSettings } from '../context/theme';
import { FocusSessionBanner } from '../components/focus-session-banner';
import { queryClient } from '../lib/query-client';

SplashScreen.preventAutoHideAsync().catch(() => {});

function useCabinetGrotesk() {
  const [loaded, setLoaded] = useState(false);
  useEffect(() => {
    Font.loadAsync({
      CabinetGrotesk_700Bold: require('../assets/fonts/CabinetGrotesk-Bold.ttf'),
      CabinetGrotesk_900Black: require('../assets/fonts/CabinetGrotesk-Black.ttf'),
    })
      .then(() => setLoaded(true))
      .catch(() => setLoaded(true));
  }, []);
  return loaded;
}

export default function RootLayout() {
  return (
    <AppThemeProvider>
      <RootLayoutInner />
    </AppThemeProvider>
  );
}

function RootLayoutInner() {
  const { theme, colorScheme, isLoaded: themeLoaded } = useThemeSettings();

  const [jakartaLoaded] = usePlusJakartaSans({
    PlusJakartaSans_400Regular,
    PlusJakartaSans_500Medium,
    PlusJakartaSans_600SemiBold,
    PlusJakartaSans_700Bold,
  });
  const [geistLoaded] = useGeist({ Geist_500Medium, Geist_700Bold });
  const [monoLoaded] = useJetBrainsMono({ JetBrainsMono_400Regular });
  const cabinetLoaded = useCabinetGrotesk();

  const appReady = jakartaLoaded && geistLoaded && monoLoaded && cabinetLoaded && themeLoaded;

  useEffect(() => {
    if (appReady) SplashScreen.hideAsync().catch(() => {});
  }, [appReady]);

  if (!appReady) {
    return (
      <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center', backgroundColor: theme.background }}>
        <ActivityIndicator color={theme.primary} />
      </View>
    );
  }

  return (
    <QueryClientProvider client={queryClient}>
      <AuthProvider>
        <OnboardingProvider>
          <FocusSessionProvider>
            <StatusBar style={colorScheme === 'dark' ? 'light' : 'dark'} />
            <Stack screenOptions={{ headerShown: false, contentStyle: { backgroundColor: theme.background } }} />
            <FocusSessionBanner />
          </FocusSessionProvider>
        </OnboardingProvider>
      </AuthProvider>
    </QueryClientProvider>
  );
}
