import { DarkTheme, DefaultTheme, ThemeProvider } from '@react-navigation/native';
import { QueryClientProvider } from '@tanstack/react-query';
import { Stack } from 'expo-router';
import { StatusBar } from 'expo-status-bar';
import { useState } from 'react';
import 'react-native-reanimated';

import { AnimatedSplash } from '@/components/animated-splash';
import { ToastProvider } from '@/components/ui/toast';
import { useColorScheme } from '@/hooks/use-color-scheme';
import { AuthProvider } from '@/context/auth';
import { FocusSessionProvider } from '@/context/focus-session';
import { ProgressProvider } from '@/context/progress';
import { queryClient } from '@/lib/query-client';
import { initNotificationHandler } from '@/lib/notifications';

initNotificationHandler();

export default function RootLayout() {
  const colorScheme = useColorScheme();
  // Purely a visual overlay shown for the first couple seconds — everything
  // underneath (auth check, grade/LV2/placement gating) mounts
  // and runs exactly as before, untouched; this just hides it briefly.
  const [showSplash, setShowSplash] = useState(true);

  return (
    <QueryClientProvider client={queryClient}>
      <AuthProvider>
        <ProgressProvider>
          <FocusSessionProvider>
            <ThemeProvider value={colorScheme === 'dark' ? DarkTheme : DefaultTheme}>
              <ToastProvider>
                <Stack>
                  <Stack.Screen name="(tabs)" options={{ headerShown: false }} />
                  <Stack.Screen name="login" options={{ headerShown: false }} />
                  <Stack.Screen name="select-grade" options={{ headerShown: false }} />
                  <Stack.Screen name="select-language" options={{ headerShown: false }} />
                  <Stack.Screen name="placement" options={{ headerShown: false }} />
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
                  <Stack.Screen name="correct-homework" options={{ headerShown: false }} />
                  <Stack.Screen name="prepare-homework" options={{ headerShown: false }} />
                </Stack>
                <StatusBar style="auto" />
                {showSplash ? <AnimatedSplash onFinish={() => setShowSplash(false)} /> : null}
              </ToastProvider>
            </ThemeProvider>
          </FocusSessionProvider>
        </ProgressProvider>
      </AuthProvider>
    </QueryClientProvider>
  );
}
