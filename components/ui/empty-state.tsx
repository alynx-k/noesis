import Ionicons from '@expo/vector-icons/Ionicons';
import { ComponentProps } from 'react';
import { StyleSheet, View } from 'react-native';
import Animated, { FadeIn } from 'react-native-reanimated';

import { Button } from '@/components/ui/button';
import { ThemedText } from '@/components/themed-text';
import { SPACING, TYPOGRAPHY } from '@/constants/design';
import { useThemeColors } from '@/hooks/use-theme-colors';

type EmptyStateProps = {
  icon?: ComponentProps<typeof Ionicons>['name'];
  title: string;
  description?: string;
  actionLabel?: string;
  onAction?: () => void;
};

export function EmptyState({ icon = 'sparkles-outline', title, description, actionLabel, onAction }: EmptyStateProps) {
  const COLORS = useThemeColors();

  const styles = StyleSheet.create({
    container: {
      alignItems: 'center',
      paddingVertical: SPACING.section,
      paddingHorizontal: SPACING.element,
      gap: 8,
    },
    iconBadge: {
      width: 56,
      height: 56,
      borderRadius: 28,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: 4,
    },
    title: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      textAlign: 'center',
    },
    description: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
      textAlign: 'center',
    },
    action: {
      marginTop: SPACING.tight,
      alignSelf: 'center',
    },
  });

  return (
    <Animated.View style={styles.container} entering={FadeIn.duration(300)}>
      <View style={styles.iconBadge}>
        <Ionicons name={icon} size={26} color={COLORS.accent} />
      </View>
      <ThemedText style={styles.title}>{title}</ThemedText>
      {description ? <ThemedText style={styles.description}>{description}</ThemedText> : null}
      {actionLabel && onAction ? (
        <Button label={actionLabel} onPress={onAction} variant="secondary" style={styles.action} />
      ) : null}
    </Animated.View>
  );
}
