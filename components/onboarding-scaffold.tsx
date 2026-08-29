import type { ReactNode } from 'react';
import { ScrollView, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { useAppTheme } from '../hooks/use-app-theme';
import { fonts, radius, spacing } from '../constants/theme';

type Props = {
  step: number;
  totalSteps: number;
  title: string;
  subtitle?: string;
  children: ReactNode;
  footer?: ReactNode;
};

export function OnboardingScaffold({ step, totalSteps, title, subtitle, children, footer }: Props) {
  const theme = useAppTheme();
  const progress = step / totalSteps;

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]} edges={['top', 'bottom']}>
      <View style={styles.progressTrack}>
        <View
          style={[
            styles.progressTrack,
            { backgroundColor: theme.border, borderRadius: radius.full },
          ]}
        >
          <View
            style={[
              styles.progressFill,
              { width: `${progress * 100}%`, backgroundColor: theme.primary },
            ]}
          />
        </View>
      </View>

      <ScrollView contentContainerStyle={styles.content} keyboardShouldPersistTaps="handled">
        <Text style={[styles.title, { color: theme.text, fontFamily: fonts.display }]}>{title}</Text>
        {subtitle ? (
          <Text style={[styles.subtitle, { color: theme.textMuted }]}>{subtitle}</Text>
        ) : null}
        <View style={styles.body}>{children}</View>
      </ScrollView>

      {footer ? <View style={styles.footer}>{footer}</View> : null}
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1 },
  progressTrack: {
    height: 4,
    marginHorizontal: spacing.lg,
    marginTop: spacing.sm,
    overflow: 'hidden',
  },
  progressFill: {
    height: 4,
  },
  content: {
    padding: spacing.lg,
    paddingBottom: spacing.xl,
    gap: spacing.md,
  },
  title: {
    fontSize: 26,
    lineHeight: 32,
  },
  subtitle: {
    fontFamily: fonts.body,
    fontSize: 15.5,
    lineHeight: 22,
  },
  body: {
    marginTop: spacing.sm,
    gap: spacing.sm,
  },
  footer: {
    padding: spacing.lg,
  },
});
