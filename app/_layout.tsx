import { useEffect, useState } from 'react';
import { View, ActivityIndicator, useColorScheme } from 'react-native';
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
import { lightTheme, darkTheme } from '../constants/theme';
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
  const scheme = useColorScheme();
  const theme = scheme === 'dark' ? darkTheme : lightTheme;

  const [jakartaLoaded] = usePlusJakartaSans({
    PlusJakartaSans_400Regular,
    PlusJakartaSans_500Medium,
    PlusJakartaSans_600SemiBold,
    PlusJakartaSans_700Bold,
  });
  const [geistLoaded] = useGeist({ Geist_500Medium, Geist_700Bold });
  const [monoLoaded] = useJetBrainsMono({ JetBrainsMono_400Regular });
  const cabinetLoaded = useCabinetGrotesk();

  const fontsReady = jakartaLoaded && geistLoaded && monoLoaded && cabinetLoaded;

  useEffect(() => {
    if (fontsReady) SplashScreen.hideAsync().catch(() => {});
  }, [fontsReady]);

  if (!fontsReady) {
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
          <StatusBar style={scheme === 'dark' ? 'light' : 'dark'} />
          <Stack screenOptions={{ headerShown: false, contentStyle: { backgroundColor: theme.background } }} />
        </OnboardingProvider>
      </AuthProvider>
    </QueryClientProvider>
  );
}
