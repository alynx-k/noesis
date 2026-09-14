import { Tabs } from 'expo-router';
import { Ionicons } from '@expo/vector-icons';
import { useAppTheme } from '../../hooks/use-app-theme';
import { fonts } from '../../constants/theme';

// Outline pour l'état inactif, plein pour l'état actif/sélectionné (docs/DESIGN.md > Iconography).
function tabIcon(outlineName: keyof typeof Ionicons.glyphMap, filledName: keyof typeof Ionicons.glyphMap) {
  return ({ color, size, focused }: { color: string; size: number; focused: boolean }) => (
    <Ionicons name={focused ? filledName : outlineName} size={size} color={color} />
  );
}

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
      <Tabs.Screen name="index" options={{ title: 'Accueil', tabBarIcon: tabIcon('home-outline', 'home') }} />
      <Tabs.Screen name="cours" options={{ title: 'Cours', tabBarIcon: tabIcon('book-outline', 'book') }} />
      <Tabs.Screen name="fiches" options={{ title: 'Fiches', tabBarIcon: tabIcon('albums-outline', 'albums') }} />
      <Tabs.Screen name="ligue" options={{ title: 'Ligue', tabBarIcon: tabIcon('trophy-outline', 'trophy') }} />
      <Tabs.Screen name="profil" options={{ title: 'Profil', tabBarIcon: tabIcon('person-outline', 'person') }} />
    </Tabs>
  );
}
