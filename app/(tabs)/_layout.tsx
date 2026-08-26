import { Tabs } from 'expo-router';
import { StyleSheet, View } from 'react-native';

import { HapticTab } from '@/components/haptic-tab';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { useThemeColors } from '@/hooks/use-theme-colors';

export default function TabsLayout() {
  const COLORS = useThemeColors();

  const styles = StyleSheet.create({
    // Floating rounded "island" bar, not a full-width bar hugging the
    // screen edges — matches the pastel Home redesign's soft, separated
    // card language instead of the OS-default docked tab bar.
    tabBar: {
      position: 'absolute',
      left: 16,
      right: 16,
      bottom: 16,
      height: 68,
      borderRadius: 32,
      borderTopWidth: 0,
      elevation: 8,
      shadowColor: '#000',
      shadowOffset: { width: 0, height: 6 },
      shadowOpacity: 0.08,
      shadowRadius: 16,
    },
    label: {
      fontSize: 11,
      fontWeight: '700',
    },
  });

  return (
    <Tabs
      screenOptions={{
        headerShown: false,
        tabBarActiveTintColor: COLORS.accent,
        tabBarInactiveTintColor: COLORS.mutedText,
        tabBarButton: HapticTab,
        tabBarLabelStyle: styles.label,
        tabBarBackground: () => <View style={[StyleSheet.absoluteFill, { backgroundColor: COLORS.surface, borderRadius: 32 }]} />,
        tabBarStyle: styles.tabBar,
      }}>
      <Tabs.Screen
        name="index"
        options={{
          title: 'Accueil',
          tabBarIcon: ({ color, size }) => <IconSymbol name="house.fill" color={color} size={size} />,
        }}
      />
      <Tabs.Screen
        name="communaute"
        options={{
          title: 'Communauté',
          tabBarIcon: ({ color, size }) => <IconSymbol name="trophy.fill" color={color} size={size} />,
        }}
      />
      <Tabs.Screen
        name="flashcards"
        options={{
          title: 'Fiches',
          tabBarIcon: ({ color, size }) => <IconSymbol name="doc.text.fill" color={color} size={size} />,
        }}
      />
      <Tabs.Screen
        name="profile"
        options={{
          title: 'Profil',
          tabBarIcon: ({ color, size }) => <IconSymbol name="person.fill" color={color} size={size} />,
        }}
      />
    </Tabs>
  );
}
