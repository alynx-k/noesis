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
import { StyleSheet, View } from 'react-native';
import Animated, { FadeIn, FadeOut } from 'react-native-reanimated';

import { AnimatedSplash } from '@/components/animated-splash';
import { TourOverlay } from '@/components/tour-overlay';
import { ErrorState } from '@/components/ui/error-state';
import { LoadingBadge } from '@/components/ui/loading-badge';
import { ToastProvider } from '@/components/ui/toast';
import { SPACING, TYPOGRAPHY } from '@/constants/design';
import { useColorScheme } from '@/hooks/use-color-scheme';
import { useGateState } from '@/hooks/use-gate-state';
import { useNotificationScheduling } from '@/hooks/use-notification-scheduling';
import { AuthProvider } from '@/context/auth';
import { FocusSessionProvider } from '@/context/focus-session';
import { ProgressProvider } from '@/context/progress';
import { TourProvider } from '@/context/tour';
import { useThemeColors } from '@/hooks/use-theme-colors';
import { queryClient } from '@/lib/query-client';
import { initNotificationHandler } from '@/lib/notifications';

initNotificationHandler();

// Full-screen overlay shown when gate resolution (session/profile queries)
// is still pending after the cosmetic splash has finished — the
// alternative is a blank white/black screen, which is exactly the failure
// mode the rest of this rewrite exists to eliminate.
function GateLoadingOverlay({ message }: { message: string }) {
  const COLORS = useThemeColors();
  return (
    <Animated.View exiting={FadeOut.duration(200)} style={[styles.overlay, { backgroundColor: COLORS.background }]}>
      <LoadingBadge icon="lock.fill" color={COLORS.accent} size={64} />
      {/* Keyed on the message so it cross-fades instead of jump-cutting as
          the gate moves through phases (session -> profil -> tableau de
          bord) — the changing text is what makes the wait read as active
          progress rather than a stalled screen. */}
      <Animated.Text key={message} entering={FadeIn.duration(200)} style={[styles.overlayTitle, { color: COLORS.text }]}>
        {message || 'Connexion en cours…'}
      </Animated.Text>
    </Animated.View>
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
  const { state, error, retry, loadingMessage } = useGateState();
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
  };

  useNotificationScheduling(guards.ready);

  return (
    <ThemeProvider value={colorScheme === 'dark' ? DarkTheme : DefaultTheme}>
      <ToastProvider>
        <Stack>
          <Stack.Protected guard={guards.ready}>
            {/* animation: 'none' — this screen mounts the instant the gate's
                own loading overlay disappears, not from a user tapping
                something. The overlay is a sibling, not a stack screen, so
                without this the (still-mounted, just hidden) login screen
                underneath was visibly mid-transition-out for a frame right
                as the overlay came off — read as a flashing "double page". */}
            <Stack.Screen name="(tabs)" options={{ headerShown: false, animation: 'none' }} />
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
            <Stack.Screen name="login" options={{ headerShown: false, animation: 'none' }} />
          </Stack.Protected>
          <Stack.Protected guard={guards.grade}>
            <Stack.Screen name="select-grade" options={{ headerShown: false, animation: 'none' }} />
          </Stack.Protected>
          <Stack.Protected guard={guards.lv2}>
            <Stack.Screen name="select-language" options={{ headerShown: false, animation: 'none' }} />
          </Stack.Protected>
        </Stack>
        <StatusBar style="auto" />
        {!showSplash && state === 'loading' && !error ? <GateLoadingOverlay message={loadingMessage} /> : null}
        {!showSplash && error ? <GateErrorOverlay onRetry={retry} /> : null}
        {showSplash ? <AnimatedSplash onFinish={() => setShowSplash(false)} /> : null}
        <TourOverlay />
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
            <TourProvider>
              <AppNavigator />
            </TourProvider>
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
  overlayTitle: {
    ...TYPOGRAPHY.body,
    fontWeight: '700',
    marginTop: SPACING.element,
  },
});
