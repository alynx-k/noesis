import { Stack } from 'expo-router';

import { OnboardingProvider } from '@/context/onboarding';

export default function OnboardingLayout() {
  return (
    <OnboardingProvider>
      <Stack screenOptions={{ headerShown: false, animation: 'slide_from_right' }}>
        <Stack.Screen name="index" />
        <Stack.Screen name="welcome" />
        <Stack.Screen name="why" />
        <Stack.Screen name="niveau" />
        <Stack.Screen name="lv2" />
        <Stack.Screen name="waitlist" />
        <Stack.Screen name="objectifs" />
        <Stack.Screen name="temps" />
        <Stack.Screen name="notifications" />
        <Stack.Screen name="toi" />
        <Stack.Screen name="recap" />
        <Stack.Screen name="pret" />
      </Stack>
    </OnboardingProvider>
  );
}
