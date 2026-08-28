import { router } from 'expo-router';
import { Image, StyleSheet, Switch, View } from 'react-native';
import Animated, { FadeInDown } from 'react-native-reanimated';

import { OnboardingHeader } from '@/components/onboarding-header';
import { ThemedText } from '@/components/themed-text';
import { Button } from '@/components/ui/button';
import { IconSymbol, IconSymbolName } from '@/components/ui/icon-symbol';
import { Screen } from '@/components/ui/screen';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useOnboarding } from '@/context/onboarding';
import { useThemeColors } from '@/hooks/use-theme-colors';
import { requestNotificationPermissions, setNotificationCategoryEnabled, setNotificationsEnabled } from '@/lib/notifications';

const BELL_3D = require('@/assets/images/3d/notification-bell.png');

const CATEGORIES: { key: 'notifRevision' | 'notifStreaks' | 'notifCommunity'; storageKey: 'revision' | 'streaks' | 'community'; icon: IconSymbolName; label: string }[] = [
  { key: 'notifRevision', storageKey: 'revision', icon: 'doc.text.fill', label: 'Rappels de révision' },
  { key: 'notifStreaks', storageKey: 'streaks', icon: 'flame.fill', label: 'Séries et objectifs' },
  { key: 'notifCommunity', storageKey: 'community', icon: 'person.2.fill', label: 'Messages de la communauté' },
];

export default function OnboardingNotificationsScreen() {
  const COLORS = useThemeColors();
  const { answers, setAnswers } = useOnboarding();

  const styles = StyleSheet.create({
    content: {
      flex: 1,
    },
    illustration: {
      width: 96,
      height: 96,
      alignSelf: 'center',
      marginBottom: SPACING.section,
    },
    title: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
      textAlign: 'center',
      marginBottom: 8,
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      textAlign: 'center',
      marginBottom: SPACING.section,
    },
    list: {
      gap: 10,
      flex: 1,
    },
    row: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.element,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      borderWidth: 2,
      borderColor: COLORS.border,
      paddingVertical: 14,
      paddingHorizontal: 16,
    },
    label: {
      ...TYPOGRAPHY.body,
      fontWeight: '600',
      color: COLORS.text,
      flex: 1,
    },
    footer: {
      gap: SPACING.tight,
    },
    skipText: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
      textAlign: 'center',
      textDecorationLine: 'underline',
    },
  });

  const handleActivate = async () => {
    await Promise.all(
      CATEGORIES.map((category) => setNotificationCategoryEnabled(category.storageKey, answers[category.key])),
    );
    // Some platforms (web without a service worker, certain browsers) can
    // reject this outright instead of resolving with "denied" — either way
    // it should never trap the student on this screen.
    let granted = false;
    try {
      granted = await requestNotificationPermissions();
    } catch (error) {
      console.error('Failed to request notification permissions:', error);
    }
    await setNotificationsEnabled(granted);
    setAnswers({ notificationsEnabled: granted });
    router.push('/onboarding/toi');
  };

  const handleSkip = async () => {
    await setNotificationsEnabled(false);
    setAnswers({ notificationsEnabled: false });
    router.push('/onboarding/toi');
  };

  return (
    <Screen>
      <OnboardingHeader step={6} totalSteps={8} />
      <Animated.View entering={FadeInDown.duration(300)} style={styles.content}>
        <Image source={BELL_3D} style={styles.illustration} resizeMode="contain" />
        <ThemedText style={styles.title}>Reste motivé, on est là pour t&apos;aider !</ThemedText>
        <ThemedText style={styles.subtitle}>Active les notifications pour ne rien manquer.</ThemedText>

        <View style={styles.list}>
          {CATEGORIES.map((category) => (
            <View key={category.key} style={styles.row}>
              <IconSymbol name={category.icon} size={20} color={COLORS.accent} />
              <ThemedText style={styles.label}>{category.label}</ThemedText>
              <Switch
                value={answers[category.key]}
                onValueChange={(value) => setAnswers({ [category.key]: value })}
                trackColor={{ false: COLORS.borderStrong, true: COLORS.accent }}
                thumbColor={COLORS.surface}
              />
            </View>
          ))}
        </View>

        <View style={styles.footer}>
          <Button label="Activer les notifications" onPress={handleActivate} />
          <ThemedText style={styles.skipText} onPress={handleSkip}>
            Plus tard
          </ThemedText>
        </View>
      </Animated.View>
    </Screen>
  );
}
