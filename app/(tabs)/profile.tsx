import { useBottomTabBarHeight } from '@react-navigation/bottom-tabs';
import { LinearGradient } from 'expo-linear-gradient';
import { Link } from 'expo-router';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { FadeIn } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ScreenBackground } from '@/components/screen-background';
import { RocketIcon } from '@/components/rocket-icon';
import { ThemedText } from '@/components/themed-text';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { GRADIENTS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useAuth } from '@/context/auth';
import { useProgress } from '@/context/progress';
import { useSuccessfulSessionCount } from '@/hooks/queries/use-atlas';
import { useCoursesForGrade } from '@/hooks/queries/use-courses';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { getDisplayName } from '@/lib/profile';

export default function ProfileScreen() {
  const COLORS = useThemeColors();
  const tabBarHeight = useBottomTabBarHeight();
  const { user } = useAuth();
  const { completedCourseIds } = useProgress();
  const coursesQuery = useCoursesForGrade();
  const sessionCountQuery = useSuccessfulSessionCount();
  const totalCourses = coursesQuery.data?.length ?? 0;
  const treesPlanted = sessionCountQuery.data ?? 0;

  const displayName = getDisplayName(user);
  const initial = displayName.charAt(0).toUpperCase();

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    scrollContent: {
      padding: SPACING.screen,
    },
    header: {
      flexDirection: 'row',
      alignItems: 'flex-start',
      justifyContent: 'space-between',
      marginBottom: SPACING.element,
    },
    avatar: {
      width: 64,
      height: 64,
      borderRadius: 32,
      alignItems: 'center',
      justifyContent: 'center',
      // Fallback so the avatar is never invisible if the gradient fails to paint.
      backgroundColor: '#8F7BF0',
    },
    avatarText: {
      fontSize: 28,
      fontWeight: '800',
      color: COLORS.accentText,
    },
    settingsButton: {
      padding: 4,
    },
    title: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
      marginBottom: SPACING.section,
    },
    sectionTitle: {
      ...TYPOGRAPHY.label,
      color: COLORS.mutedText,
      textTransform: 'uppercase',
      marginBottom: SPACING.tight,
      marginTop: SPACING.element,
    },
    historyRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.tight,
      ...cardBorder(COLORS),
    },
    historyIcon: {
      width: 36,
      height: 36,
      borderRadius: 18,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
    },
    historyText: {
      flex: 1,
    },
    historyLabel: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
    },
    historySubtitle: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
      marginTop: 2,
    },
  });

  return (
    <ScreenBackground>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <ScrollView contentContainerStyle={[styles.scrollContent, { paddingBottom: tabBarHeight + 24 }]}>
          <Animated.View entering={FadeIn.duration(400)}>
            <View style={styles.header}>
              <LinearGradient colors={GRADIENTS.badge} style={styles.avatar} start={{ x: 0, y: 0 }} end={{ x: 1, y: 1 }}>
                <ThemedText style={styles.avatarText}>{initial}</ThemedText>
              </LinearGradient>
              <Link href="/settings" asChild>
                <BouncyPressable style={styles.settingsButton} hitSlop={8}>
                  <IconSymbol name="gearshape.fill" size={22} color={COLORS.mutedText} />
                </BouncyPressable>
              </Link>
            </View>

            <ThemedText style={styles.title}>{displayName}</ThemedText>

            <ThemedText style={styles.sectionTitle}>Apprentissage</ThemedText>
            <Link href="/garden" asChild>
              <BouncyPressable style={styles.historyRow}>
                {/* Same footprint/row as Historique des cours below, but a
                    gradient badge (matching the rocket's own launch colors)
                    instead of the flat accentSoft one — the row shrank to
                    match, the color identity didn't have to. */}
                <LinearGradient
                  colors={GRADIENTS.cosmic}
                  start={{ x: 0, y: 0 }}
                  end={{ x: 1, y: 1 }}
                  style={styles.historyIcon}>
                  {/* Static here — RocketIcon's floating bob is for hero
                      placements (Home's focus card, the launch preview),
                      not a small icon badge in a plain stat row. */}
                  <RocketIcon size={20} />
                </LinearGradient>
                <View style={styles.historyText}>
                  <ThemedText style={styles.historyLabel}>Fusées lancées</ThemedText>
                  {!sessionCountQuery.isPending ? (
                    <ThemedText style={styles.historySubtitle}>
                      {treesPlanted} lancée{treesPlanted > 1 ? 's' : ''}
                    </ThemedText>
                  ) : null}
                </View>
                <IconSymbol name="chevron.right" size={16} color={COLORS.mutedText} />
              </BouncyPressable>
            </Link>

            <Link href="/course-history" asChild>
              <BouncyPressable style={styles.historyRow}>
                <View style={styles.historyIcon}>
                  <IconSymbol name="doc.text.fill" size={18} color={COLORS.accent} />
                </View>
                <View style={styles.historyText}>
                  <ThemedText style={styles.historyLabel}>Historique des cours</ThemedText>
                  {!coursesQuery.isPending ? (
                    <ThemedText style={styles.historySubtitle}>
                      {completedCourseIds.length}/{totalCourses} terminés
                    </ThemedText>
                  ) : null}
                </View>
                <IconSymbol name="chevron.right" size={16} color={COLORS.mutedText} />
              </BouncyPressable>
            </Link>
          </Animated.View>
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
