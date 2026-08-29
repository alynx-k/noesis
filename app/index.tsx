import { View, ActivityIndicator } from 'react-native';
import { Redirect } from 'expo-router';
import { useAuth } from '../context/auth';
import { useAppTheme } from '../hooks/use-app-theme';

export default function Index() {
  const { session, isLoading, isOnboardingComplete } = useAuth();
  const theme = useAppTheme();

  if (isLoading) {
    return (
      <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center', backgroundColor: theme.background }}>
        <ActivityIndicator color={theme.primary} />
      </View>
    );
  }

  if (!session) return <Redirect href="/onboarding/welcome" />;
  if (!isOnboardingComplete) return <Redirect href="/onboarding/classe" />;
  return <Redirect href="/(tabs)" />;
}
