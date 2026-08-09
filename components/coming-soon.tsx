import { useBottomTabBarHeight } from '@react-navigation/bottom-tabs';
import { StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { ThemedText } from '@/components/themed-text';
import { ThemedView } from '@/components/themed-view';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { SPACING, TYPOGRAPHY } from '@/constants/design';
import { useThemeColors } from '@/hooks/use-theme-colors';

type IconSymbolName = Parameters<typeof IconSymbol>[0]['name'];

type ComingSoonProps = {
  icon: IconSymbolName;
  title: string;
  message: string;
};

export function ComingSoon({ icon, title, message }: ComingSoonProps) {
  const COLORS = useThemeColors();
  const tabBarHeight = useBottomTabBarHeight();

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    container: {
      flex: 1,
      backgroundColor: COLORS.background,
      alignItems: 'center',
      justifyContent: 'center',
      padding: SPACING.screen,
    },
    iconCircle: {
      width: 72,
      height: 72,
      borderRadius: 36,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: SPACING.element,
    },
    title: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
      marginBottom: 8,
    },
    message: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      textAlign: 'center',
    },
  });

  return (
    <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
      <ThemedView style={[styles.container, { paddingBottom: tabBarHeight }]}>
        <View style={styles.iconCircle}>
          <IconSymbol name={icon} size={32} color={COLORS.accent} />
        </View>
        <ThemedText style={styles.title}>{title}</ThemedText>
        <ThemedText style={styles.message}>{message}</ThemedText>
      </ThemedView>
    </SafeAreaView>
  );
}
