import { Tabs } from 'expo-router';
import { useAppTheme } from '../../hooks/use-app-theme';
import { fonts } from '../../constants/theme';

export default function TabsLayout() {
  const theme = useAppTheme();

  return (
    <Tabs
      screenOptions={{
        headerShown: false,
        tabBarActiveTintColor: theme.primary,
        tabBarInactiveTintColor: theme.textMuted,
        tabBarStyle: { backgroundColor: theme.card, borderTopColor: theme.border },
        tabBarLabelStyle: { fontFamily: fonts.bodySemiBold, fontSize: 11 },
      }}
    >
      <Tabs.Screen name="index" options={{ title: 'Accueil' }} />
      <Tabs.Screen name="cours" options={{ title: 'Cours' }} />
      <Tabs.Screen name="fiches" options={{ title: 'Fiches' }} />
      <Tabs.Screen name="ligue" options={{ title: 'Ligue' }} />
      <Tabs.Screen name="profil" options={{ title: 'Profil' }} />
    </Tabs>
  );
}
