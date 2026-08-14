import { useBottomTabBarHeight } from '@react-navigation/bottom-tabs';
import { LinearGradient } from 'expo-linear-gradient';
import { Link } from 'expo-router';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { FadeIn } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { ErrorState } from '@/components/ui/error-state';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { SkeletonList } from '@/components/ui/skeleton';
import { DISCIPLINES, getDisciplineIdsFor } from '@/constants/disciplines';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useProfile } from '@/hooks/queries/use-profile';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

export default function CoursScreen() {
  const COLORS = useThemeColors();
  const tabBarHeight = useBottomTabBarHeight();
  const profileQuery = useProfile();

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    scrollContent: {
      padding: SPACING.screen,
    },
    title: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
      marginBottom: SPACING.section,
    },
    grid: {
      flexDirection: 'row',
      flexWrap: 'wrap',
      justifyContent: 'space-between',
    },
    gridItem: {
      width: '48%',
      marginBottom: SPACING.tight,
    },
    card: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      // Fixed height so every card lines up regardless of label length —
      // without this, a two-line label (e.g. "Histoire-Géographie") makes
      // its card taller than its single-line neighbors.
      minHeight: 132,
      justifyContent: 'center',
      ...cardBorder(COLORS),
    },
    iconBadge: {
      width: 40,
      height: 40,
      borderRadius: 12,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: SPACING.tight,
      backgroundColor: COLORS.accent,
    },
    iconBadgeLocked: {
      backgroundColor: COLORS.lockedBackground,
    },
    cardTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
    },
    cardLocked: {
      backgroundColor: COLORS.lockedBackground,
      borderColor: COLORS.borderStrong,
    },
    cardTitleLocked: {
      ...TYPOGRAPHY.body,
      fontWeight: '600',
      color: COLORS.text,
      marginBottom: SPACING.tight,
    },
    badge: {
      alignSelf: 'flex-start',
      backgroundColor: COLORS.surface,
      borderRadius: 999,
      paddingVertical: 4,
      paddingHorizontal: 10,
      borderWidth: 1,
      borderColor: COLORS.borderStrong,
    },
    badgeText: {
      fontSize: 11,
      fontWeight: '700',
      color: COLORS.text,
    },
  });

  return (
    <ScreenBackground>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <ScrollView contentContainerStyle={[styles.scrollContent, { paddingBottom: tabBarHeight + 24 }]}>
          <ThemedText style={styles.title}>Mes matières</ThemedText>

          {profileQuery.isPending ? <SkeletonList count={4} cardHeight={80} /> : null}

          {profileQuery.isError ? (
            <ErrorState
              title="Impossible de charger tes matières"
              onRetry={() => profileQuery.refetch()}
            />
          ) : null}

          {profileQuery.isSuccess ? (
            <Animated.View entering={FadeIn.duration(400)} style={styles.grid}>
              {(() => {
                const profile = profileQuery.data;
                const disciplineIdsForGrade = profile?.grade ? getDisciplineIdsFor(profile.grade, profile.serie) : [];
                const visibleDisciplines = DISCIPLINES.filter(
                  (discipline) =>
                    disciplineIdsForGrade.includes(discipline.id) &&
                    ((discipline.id !== 'espagnol' && discipline.id !== 'allemand') || discipline.id === profile?.lv2),
                );

                return visibleDisciplines.map((discipline) => {
                  if (!discipline.available) {
                    return (
                      <View key={discipline.id} style={styles.gridItem}>
                        <View style={[styles.card, styles.cardLocked]}>
                          <View style={[styles.iconBadge, styles.iconBadgeLocked]}>
                            <IconSymbol name={discipline.icon} size={20} color={COLORS.text} />
                          </View>
                          <ThemedText style={styles.cardTitleLocked} numberOfLines={2}>
                            {discipline.label}
                          </ThemedText>
                          <View style={styles.badge}>
                            <ThemedText style={styles.badgeText}>Bientôt disponible</ThemedText>
                          </View>
                        </View>
                      </View>
                    );
                  }

                  return (
                    <View key={discipline.id} style={styles.gridItem}>
                      <Link href={{ pathname: '/subject/[disciplineId]', params: { disciplineId: discipline.id } }} asChild>
                        <BouncyPressable style={styles.card}>
                          <LinearGradient
                            colors={discipline.gradient}
                            start={{ x: 0, y: 0 }}
                            end={{ x: 1, y: 1 }}
                            style={styles.iconBadge}>
                            <IconSymbol name={discipline.icon} size={20} color={COLORS.accentText} />
                          </LinearGradient>
                          <ThemedText style={styles.cardTitle} numberOfLines={2}>
                            {discipline.label}
                          </ThemedText>
                        </BouncyPressable>
                      </Link>
                    </View>
                  );
                });
              })()}
            </Animated.View>
          ) : null}
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
