import { BlurView } from 'expo-blur';
import { Tabs } from 'expo-router';
import { StyleSheet, useColorScheme } from 'react-native';

import { HapticTab } from '@/components/haptic-tab';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { useThemeColors } from '@/hooks/use-theme-colors';

export default function TabsLayout() {
  const COLORS = useThemeColors();
  const scheme = useColorScheme();

  const styles = StyleSheet.create({
    tabBar: {
      position: 'absolute',
      borderTopWidth: StyleSheet.hairlineWidth,
      borderTopColor: COLORS.border,
      elevation: 0,
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
        tabBarBackground: () => (
          <BlurView intensity={80} tint={scheme === 'dark' ? 'dark' : 'light'} style={StyleSheet.absoluteFill} />
        ),
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
        name="flashcards"
        options={{
          title: 'Fiches',
          tabBarIcon: ({ color, size }) => <IconSymbol name="doc.text.fill" color={color} size={size} />,
        }}
      />
      <Tabs.Screen
        name="community"
        options={{
          title: 'Communauté',
          tabBarIcon: ({ color, size }) => <IconSymbol name="person.2.fill" color={color} size={size} />,
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
