import {
  Fraunces_500Medium,
  Fraunces_600SemiBold,
  Fraunces_600SemiBold_Italic,
  Fraunces_700Bold,
  useFonts,
} from '@expo-google-fonts/fraunces';
import { DarkTheme, DefaultTheme, ThemeProvider } from '@react-navigation/native';
import { QueryClientProvider } from '@tanstack/react-query';
import { Stack } from 'expo-router';
import { StatusBar } from 'expo-status-bar';
import { useState } from 'react';
import { ActivityIndicator, StyleSheet, View } from 'react-native';
import 'react-native-reanimated';

import { AnimatedSplash } from '@/components/animated-splash';
import { ErrorState } from '@/components/ui/error-state';
import { ToastProvider } from '@/components/ui/toast';
import { useColorScheme } from '@/hooks/use-color-scheme';
import { useGateState } from '@/hooks/use-gate-state';
import { AuthProvider } from '@/context/auth';
import { FocusSessionProvider } from '@/context/focus-session';
import { ProgressProvider } from '@/context/progress';
import { useThemeColors } from '@/hooks/use-theme-colors';
import { queryClient } from '@/lib/query-client';
import { initNotificationHandler } from '@/lib/notifications';

initNotificationHandler();

// Full-screen overlay shown when gate resolution (session/profile/placement
// queries) is still pending after the cosmetic splash has finished — the
// alternative is a blank white/black screen, which is exactly the failure
// mode the rest of this rewrite exists to eliminate.
function GateLoadingOverlay() {
  const COLORS = useThemeColors();
  return (
    <View style={[styles.overlay, { backgroundColor: COLORS.background }]}>
      <ActivityIndicator color={COLORS.accent} size="large" />
    </View>
  );
}

function GateErrorOverlay({ onRetry }: { onRetry: () => void }) {
  const COLORS = useThemeColors();
  return (
    <View style={[styles.overlay, { backgroundColor: COLORS.background }]}>
      <ErrorState
        title="Connexion impossible"
        description="Vérifie ta connexion internet."
        onRetry={onRetry}
      />
    </View>
  );
}

// Owns the Stack.Protected wiring — must render inside AuthProvider (it
// calls useAuth() via useGateState()), so it can't live directly in
// RootLayout, which is what mounts AuthProvider in the first place.
function AppNavigator() {
  const colorScheme = useColorScheme();
  const { state, error, retry } = useGateState();
  // Purely a visual overlay shown for the first couple seconds regardless of
  // gate state — GateLoadingOverlay takes over below if resolution is still
  // pending once this finishes.
  const [showSplash, setShowSplash] = useState(true);

  const guards = {
    ready: state === 'ready',
    // While the gate is still resolving, park on the same protected group as
    // "needs-auth" — it's the correct default for a cold boot (pre-session),
    // and it's always hidden behind the splash/loading overlay anyway.
    auth: state === 'needs-auth' || state === 'loading',
    grade: state === 'needs-grade',
    lv2: state === 'needs-lv2',
    placement: state === 'needs-placement',
  };

  return (
    <ThemeProvider value={colorScheme === 'dark' ? DarkTheme : DefaultTheme}>
      <ToastProvider>
        <Stack>
          <Stack.Protected guard={guards.ready}>
            <Stack.Screen name="(tabs)" options={{ headerShown: false }} />
            <Stack.Screen name="subject/[disciplineId]" options={{ headerShown: false }} />
            <Stack.Screen name="course/[id]" options={{ headerShown: false }} />
            <Stack.Screen name="exercise" options={{ headerShown: false }} />
            <Stack.Screen name="focus-session" options={{ headerShown: false }} />
            <Stack.Screen name="garden" options={{ headerShown: false }} />
            <Stack.Screen name="streak-overview" options={{ headerShown: false }} />
            <Stack.Screen name="course-history" options={{ headerShown: false }} />
            <Stack.Screen name="flashcard-deck" options={{ headerShown: false }} />
            <Stack.Screen name="settings" options={{ headerShown: false }} />
            <Stack.Screen name="ai-chat" options={{ headerShown: false }} />
            <Stack.Screen name="homework" options={{ headerShown: false }} />
            <Stack.Screen name="correct-homework" options={{ headerShown: false }} />
            <Stack.Screen name="prepare-homework" options={{ headerShown: false }} />
          </Stack.Protected>
          <Stack.Protected guard={guards.auth}>
            <Stack.Screen name="login" options={{ headerShown: false }} />
          </Stack.Protected>
          <Stack.Protected guard={guards.grade}>
            <Stack.Screen name="select-grade" options={{ headerShown: false }} />
          </Stack.Protected>
          <Stack.Protected guard={guards.lv2}>
            <Stack.Screen name="select-language" options={{ headerShown: false }} />
          </Stack.Protected>
          <Stack.Protected guard={guards.placement}>
            <Stack.Screen name="placement" options={{ headerShown: false }} />
          </Stack.Protected>
        </Stack>
        <StatusBar style="auto" />
        {!showSplash && state === 'loading' && !error ? <GateLoadingOverlay /> : null}
        {!showSplash && error ? <GateErrorOverlay onRetry={retry} /> : null}
        {showSplash ? <AnimatedSplash onFinish={() => setShowSplash(false)} /> : null}
      </ToastProvider>
    </ThemeProvider>
  );
}

export default function RootLayout() {
  const [fontsLoaded] = useFonts({
    Fraunces_500Medium,
    Fraunces_600SemiBold,
    Fraunces_600SemiBold_Italic,
    Fraunces_700Bold,
  });

  // Renders nothing for the single frame or two this takes — the native
  // launch screen is still covering the app at this point, so there's
  // nothing to flash. TYPOGRAPHY.display falls back to a system serif if a
  // screen somehow renders before this resolves.
  if (!fontsLoaded) {
    return null;
  }

  return (
    <QueryClientProvider client={queryClient}>
      <AuthProvider>
        <ProgressProvider>
          <FocusSessionProvider>
            <AppNavigator />
          </FocusSessionProvider>
        </ProgressProvider>
      </AuthProvider>
    </QueryClientProvider>
  );
}

const styles = StyleSheet.create({
  overlay: {
    ...StyleSheet.absoluteFillObject,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
