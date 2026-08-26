import { useBottomTabBarHeight } from '@react-navigation/bottom-tabs';
import Ionicons from '@expo/vector-icons/Ionicons';
import { LinearGradient } from 'expo-linear-gradient';
import { Link, router } from 'expo-router';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { FadeIn } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { FEEDBACK_COLORS, GRADIENTS, RADIUS, SPACING, STATUS_COLORS, TYPOGRAPHY } from '@/constants/design';
import { DISCIPLINES, getDisciplineIdsFor } from '@/constants/disciplines';
import { GRADES } from '@/constants/grades';
import { useAuth } from '@/context/auth';
import { useProgress } from '@/context/progress';
import { useAccessStatus } from '@/hooks/queries/use-access-status';
import { useAchievements } from '@/hooks/queries/use-achievements';
import { useRecentActivity } from '@/hooks/queries/use-activity';
import { useTotalLearningMinutes } from '@/hooks/queries/use-atlas';
import { useCourseHistory } from '@/hooks/queries/use-course-history';
import { useObjectives } from '@/hooks/queries/use-objectives';
import { useProfile } from '@/hooks/queries/use-profile';
import { useStreak } from '@/hooks/queries/use-streak';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { getDisplayName } from '@/lib/profile';

const WEEKDAY_LETTERS = ['L', 'M', 'M', 'J', 'V', 'S', 'D'];

export default function ProfileScreen() {
  const COLORS = useThemeColors();
  const tabBarHeight = useBottomTabBarHeight();
  const { user } = useAuth();
  const { completedCourseIds } = useProgress();
  const profileQuery = useProfile();
  const historyQuery = useCourseHistory();
  const streakQuery = useStreak();
  const totalMinutesQuery = useTotalLearningMinutes();
  const accessStatusQuery = useAccessStatus();
  const { data: objectives } = useObjectives();
  const { data: achievements } = useAchievements();
  const { data: recentActivity } = useRecentActivity();

  const isPremium = accessStatusQuery.data === 'premium';
  const displayName = getDisplayName(user);
  const initial = displayName.charAt(0).toUpperCase();

  const profile = profileQuery.data;
  const gradeLabel = profile?.grade ? GRADES.find((g) => g.id === profile.grade)?.label : null;

  const disciplineIdsForGrade = profile?.grade ? getDisciplineIdsFor(profile.grade, profile.serie) : [];
  const visibleDisciplines = DISCIPLINES.filter(
    (discipline) =>
      disciplineIdsForGrade.includes(discipline.id) &&
      ((discipline.id !== 'espagnol' && discipline.id !== 'allemand') || discipline.id === profile?.lv2),
  );

  const attemptedEntries = (historyQuery.data ?? []).flatMap((section) => section.courses).filter((entry) => entry.total > 0);
  const averageScore =
    attemptedEntries.length > 0
      ? Math.round(attemptedEntries.reduce((sum, entry) => sum + entry.goodPercentage, 0) / attemptedEntries.length)
      : null;

  const totalHours = totalMinutesQuery.data !== undefined ? Math.round((totalMinutesQuery.data / 60) * 10) / 10 : null;

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    scrollContent: {
      padding: SPACING.screen,
    },
    header: {
      marginBottom: SPACING.section,
    },
    headerRow: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
    },
    title: {
      ...TYPOGRAPHY.largeTitle,
      color: COLORS.text,
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      marginTop: 4,
    },
    settingsButton: {
      width: 40,
      height: 40,
      borderRadius: 14,
      backgroundColor: COLORS.surface,
      alignItems: 'center',
      justifyContent: 'center',
      ...cardBorder(COLORS),
    },
    profileCard: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.element,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.element,
      ...cardBorder(COLORS),
    },
    avatar: {
      width: 64,
      height: 64,
      borderRadius: 32,
      alignItems: 'center',
      justifyContent: 'center',
      backgroundColor: '#8F7BF0',
    },
    avatarText: {
      fontSize: 28,
      fontWeight: '800',
      color: COLORS.accentText,
    },
    nameText: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
    },
    gradeText: {
      fontSize: 14,
      color: COLORS.mutedText,
      marginTop: 2,
    },
    statsGrid: {
      flexDirection: 'row',
      flexWrap: 'wrap',
      gap: SPACING.tight,
      marginBottom: SPACING.element,
    },
    statCard: {
      width: '48%',
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      ...cardBorder(COLORS),
    },
    statBadge: {
      width: 36,
      height: 36,
      borderRadius: 12,
      alignItems: 'center',
      justifyContent: 'center',
    },
    statNumber: {
      fontSize: 17,
      fontWeight: '800',
      color: COLORS.text,
    },
    statLabel: {
      fontSize: 11,
      color: COLORS.mutedText,
    },
    streakCard: {
      backgroundColor: '#FDF1DE',
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.element,
    },
    streakTopRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.element,
      marginBottom: SPACING.element,
    },
    streakIcon: {
      width: 48,
      height: 48,
      borderRadius: 24,
      backgroundColor: '#FFFFFF',
      alignItems: 'center',
      justifyContent: 'center',
    },
    streakLabel: {
      fontSize: 13,
      color: '#8A5A1E',
      marginBottom: 2,
    },
    streakNumber: {
      fontSize: 22,
      fontWeight: '800',
      color: COLORS.text,
    },
    streakSubtitle: {
      fontSize: 12,
      color: '#8A5A1E',
      marginTop: 2,
    },
    weekRow: {
      flexDirection: 'row',
      justifyContent: 'space-between',
    },
    weekDayCol: {
      alignItems: 'center',
      gap: 6,
    },
    weekDayLetter: {
      fontSize: 11,
      fontWeight: '700',
      color: '#8A5A1E',
    },
    weekDayDot: {
      width: 24,
      height: 24,
      borderRadius: 12,
      alignItems: 'center',
      justifyContent: 'center',
      backgroundColor: 'rgba(255,255,255,0.6)',
    },
    weekDayDotActive: {
      backgroundColor: STATUS_COLORS.success,
    },
    premiumCardWrapper: {
      borderRadius: RADIUS,
      overflow: 'hidden',
      marginBottom: SPACING.element,
    },
    premiumCard: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      padding: SPACING.element,
      backgroundColor: '#C9971F',
    },
    premiumIconBadge: {
      width: 40,
      height: 40,
      borderRadius: 12,
      backgroundColor: 'rgba(255,255,255,0.28)',
      alignItems: 'center',
      justifyContent: 'center',
    },
    premiumText: {
      flex: 1,
    },
    premiumTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: '#3A2A00',
    },
    premiumSubtitle: {
      ...TYPOGRAPHY.caption,
      color: '#5C4300',
      marginTop: 2,
    },
    section: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.element,
      ...cardBorder(COLORS),
    },
    sectionHeader: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      marginBottom: SPACING.element,
    },
    sectionTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
    },
    sectionSeeAll: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 2,
    },
    sectionSeeAllText: {
      fontSize: 13,
      fontWeight: '700',
      color: COLORS.accent,
    },
    objectiveRow: {
      marginBottom: SPACING.element,
    },
    objectiveTopRow: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      marginBottom: 6,
    },
    objectiveTitle: {
      fontSize: 14,
      fontWeight: '600',
      color: COLORS.text,
      flex: 1,
      marginRight: SPACING.tight,
    },
    objectiveFraction: {
      fontSize: 13,
      fontWeight: '700',
      color: COLORS.mutedText,
    },
    objectiveTrack: {
      height: 6,
      borderRadius: 3,
      backgroundColor: COLORS.border,
      overflow: 'hidden',
    },
    objectiveFill: {
      height: '100%',
      borderRadius: 3,
      backgroundColor: COLORS.accent,
    },
    achievementRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      marginBottom: SPACING.tight,
    },
    achievementBadge: {
      width: 40,
      height: 40,
      borderRadius: 14,
      alignItems: 'center',
      justifyContent: 'center',
    },
    achievementTextCol: {
      flex: 1,
    },
    achievementTitle: {
      fontSize: 14,
      fontWeight: '700',
      color: COLORS.text,
    },
    achievementDescription: {
      fontSize: 12,
      color: COLORS.mutedText,
      marginTop: 1,
    },
    activityRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      marginBottom: SPACING.tight,
    },
    activityIcon: {
      width: 36,
      height: 36,
      borderRadius: 12,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
    },
    activityTextCol: {
      flex: 1,
    },
    activityTitle: {
      fontSize: 14,
      fontWeight: '700',
      color: COLORS.text,
    },
    activitySubtitle: {
      fontSize: 12,
      color: COLORS.mutedText,
      marginTop: 1,
    },
    activityDate: {
      fontSize: 11,
      color: COLORS.mutedText,
    },
    settingsRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      ...cardBorder(COLORS),
    },
    settingsIcon: {
      width: 36,
      height: 36,
      borderRadius: 12,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
    },
    settingsText: {
      flex: 1,
    },
    settingsLabel: {
      fontSize: 14,
      fontWeight: '700',
      color: COLORS.text,
    },
    settingsSubtitle: {
      fontSize: 12,
      color: COLORS.mutedText,
      marginTop: 1,
    },
    emptyText: {
      fontSize: 13,
      color: COLORS.mutedText,
    },
  });

  const previewAchievements = (achievements ?? []).filter((a) => a.unlocked).slice(0, 2).concat((achievements ?? []).filter((a) => !a.unlocked).slice(0, 3 - (achievements ?? []).filter((a) => a.unlocked).length));

  return (
    <ScreenBackground>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <ScrollView contentContainerStyle={[styles.scrollContent, { paddingBottom: tabBarHeight + 24 }]}>
          <Animated.View entering={FadeIn.duration(400)}>
            <View style={styles.header}>
              <View style={styles.headerRow}>
                <View>
                  <ThemedText style={styles.title}>Mon profil</ThemedText>
                  <ThemedText style={styles.subtitle}>Gère ton compte et suis tes progrès.</ThemedText>
                </View>
                <Link href="/settings" asChild>
                  <BouncyPressable style={styles.settingsButton} hitSlop={8}>
                    <IconSymbol name="gearshape.fill" size={20} color={COLORS.mutedText} />
                  </BouncyPressable>
                </Link>
              </View>
            </View>

            <View style={styles.profileCard}>
              <LinearGradient colors={GRADIENTS.badge} style={styles.avatar} start={{ x: 0, y: 0 }} end={{ x: 1, y: 1 }}>
                <ThemedText style={styles.avatarText}>{initial}</ThemedText>
              </LinearGradient>
              <View>
                <ThemedText style={styles.nameText}>{displayName}</ThemedText>
                {gradeLabel ? <ThemedText style={styles.gradeText}>Élève de {gradeLabel}</ThemedText> : null}
              </View>
            </View>

            <View style={styles.statsGrid}>
              <View style={styles.statCard}>
                <View style={[styles.statBadge, { backgroundColor: STATUS_COLORS.info }]}>
                  <Ionicons name="book" size={16} color="#FFFFFF" />
                </View>
                <View>
                  <ThemedText style={styles.statNumber}>{visibleDisciplines.length}</ThemedText>
                  <ThemedText style={styles.statLabel}>Matières suivies</ThemedText>
                </View>
              </View>
              <View style={styles.statCard}>
                <View style={[styles.statBadge, { backgroundColor: '#8B6FF0' }]}>
                  <Ionicons name="school" size={16} color="#FFFFFF" />
                </View>
                <View>
                  <ThemedText style={styles.statNumber}>{completedCourseIds.length}</ThemedText>
                  <ThemedText style={styles.statLabel}>Leçons complétées</ThemedText>
                </View>
              </View>
              <View style={styles.statCard}>
                <View style={[styles.statBadge, { backgroundColor: FEEDBACK_COLORS.correct }]}>
                  <Ionicons name="checkmark-circle" size={16} color="#FFFFFF" />
                </View>
                <View>
                  <ThemedText style={styles.statNumber}>{averageScore !== null ? `${averageScore}%` : '—'}</ThemedText>
                  <ThemedText style={styles.statLabel}>Score moyen</ThemedText>
                </View>
              </View>
              <BouncyPressable style={styles.statCard} onPress={() => router.push('/garden')}>
                <View style={[styles.statBadge, { backgroundColor: STATUS_COLORS.warning }]}>
                  <Ionicons name="time" size={16} color="#FFFFFF" />
                </View>
                <View>
                  <ThemedText style={styles.statNumber}>{totalHours !== null ? `${totalHours}h` : '—'}</ThemedText>
                  <ThemedText style={styles.statLabel}>Temps d&apos;apprentissage</ThemedText>
                </View>
              </BouncyPressable>
            </View>

            <View style={styles.streakCard}>
              <View style={styles.streakTopRow}>
                <View style={styles.streakIcon}>
                  <ThemedText style={{ fontSize: 22 }}>🔥</ThemedText>
                </View>
                <View>
                  <ThemedText style={styles.streakLabel}>Série actuelle</ThemedText>
                  <ThemedText style={styles.streakNumber}>{streakQuery.data?.streak ?? 0} jours</ThemedText>
                  <ThemedText style={styles.streakSubtitle}>Continue comme ça !</ThemedText>
                </View>
              </View>
              <View style={styles.weekRow}>
                {WEEKDAY_LETTERS.map((letter, index) => {
                  const active = streakQuery.data?.weekDays[index] ?? false;
                  return (
                    <View key={index} style={styles.weekDayCol}>
                      <ThemedText style={styles.weekDayLetter}>{letter}</ThemedText>
                      <View style={[styles.weekDayDot, active && styles.weekDayDotActive]}>
                        {active ? <Ionicons name="checkmark" size={13} color="#FFFFFF" /> : null}
                      </View>
                    </View>
                  );
                })}
              </View>
            </View>

            {!isPremium ? (
              <Link href="/subscription" asChild>
                <BouncyPressable style={styles.premiumCardWrapper}>
                  <LinearGradient colors={GRADIENTS.gold} start={{ x: 0, y: 0 }} end={{ x: 1, y: 1 }} style={styles.premiumCard}>
                    <View style={styles.premiumIconBadge}>
                      <IconSymbol name="crown.fill" size={20} color="#3A2A00" />
                    </View>
                    <View style={styles.premiumText}>
                      <ThemedText style={styles.premiumTitle}>Passe Premium</ThemedText>
                      <ThemedText style={styles.premiumSubtitle}>IA illimitée, sans limite quotidienne</ThemedText>
                    </View>
                    <IconSymbol name="chevron.right" size={16} color="#3A2A00" />
                  </LinearGradient>
                </BouncyPressable>
              </Link>
            ) : null}

            <View style={styles.section}>
              <View style={styles.sectionHeader}>
                <ThemedText style={styles.sectionTitle}>Mes objectifs</ThemedText>
              </View>
              {(objectives ?? []).map((objective) => (
                <View key={objective.id} style={styles.objectiveRow}>
                  <View style={styles.objectiveTopRow}>
                    <ThemedText style={styles.objectiveTitle} numberOfLines={1}>
                      {objective.title}
                    </ThemedText>
                    <ThemedText style={styles.objectiveFraction}>
                      {objective.current}/{objective.target}
                    </ThemedText>
                  </View>
                  <View style={styles.objectiveTrack}>
                    <View style={[styles.objectiveFill, { width: `${Math.round((objective.current / objective.target) * 100)}%` }]} />
                  </View>
                </View>
              ))}
            </View>

            <View style={styles.section}>
              <View style={styles.sectionHeader}>
                <ThemedText style={styles.sectionTitle}>Mes succès</ThemedText>
                <BouncyPressable style={styles.sectionSeeAll} onPress={() => router.push('/achievements')}>
                  <ThemedText style={styles.sectionSeeAllText}>Voir tout</ThemedText>
                  <Ionicons name="chevron-forward" size={13} color={COLORS.accent} />
                </BouncyPressable>
              </View>
              {previewAchievements.length === 0 ? (
                <ThemedText style={styles.emptyText}>Termine ta première leçon pour débloquer un succès.</ThemedText>
              ) : (
                previewAchievements.map(({ achievement, unlocked }) => (
                  <View key={achievement.id} style={styles.achievementRow}>
                    <View style={[styles.achievementBadge, { backgroundColor: unlocked ? achievement.color : COLORS.locked }]}>
                      <IconSymbol name={unlocked ? achievement.icon : 'lock.fill'} size={18} color="#FFFFFF" />
                    </View>
                    <View style={styles.achievementTextCol}>
                      <ThemedText style={styles.achievementTitle}>{achievement.title}</ThemedText>
                      <ThemedText style={styles.achievementDescription}>{achievement.description}</ThemedText>
                    </View>
                  </View>
                ))
              )}
            </View>

            <View style={styles.section}>
              <View style={styles.sectionHeader}>
                <ThemedText style={styles.sectionTitle}>Activité récente</ThemedText>
                <BouncyPressable style={styles.sectionSeeAll} onPress={() => router.push('/course-history')}>
                  <ThemedText style={styles.sectionSeeAllText}>Voir tout</ThemedText>
                  <Ionicons name="chevron-forward" size={13} color={COLORS.accent} />
                </BouncyPressable>
              </View>
              {!recentActivity || recentActivity.length === 0 ? (
                <ThemedText style={styles.emptyText}>Rien à afficher pour l&apos;instant.</ThemedText>
              ) : (
                recentActivity.slice(0, 3).map((entry, index) => (
                  <View key={index} style={styles.activityRow}>
                    <View style={styles.activityIcon}>
                      <Ionicons name={entry.type === 'course' ? 'checkmark-circle' : 'timer'} size={16} color={COLORS.accent} />
                    </View>
                    <View style={styles.activityTextCol}>
                      <ThemedText style={styles.activityTitle} numberOfLines={1}>
                        {entry.type === 'course' ? entry.courseTitle : 'Session de concentration'}
                      </ThemedText>
                      <ThemedText style={styles.activitySubtitle}>
                        {entry.type === 'course' ? 'Leçon complétée' : `${entry.durationMinutes} min`}
                      </ThemedText>
                    </View>
                    <ThemedText style={styles.activityDate}>
                      {entry.at.toLocaleDateString('fr-FR', { day: 'numeric', month: 'short' })}
                    </ThemedText>
                  </View>
                ))
              )}
            </View>

            <Link href="/settings" asChild>
              <BouncyPressable style={styles.settingsRow}>
                <View style={styles.settingsIcon}>
                  <IconSymbol name="gearshape.fill" size={18} color={COLORS.accent} />
                </View>
                <View style={styles.settingsText}>
                  <ThemedText style={styles.settingsLabel}>Paramètres</ThemedText>
                  <ThemedText style={styles.settingsSubtitle}>Compte, notifications, aide</ThemedText>
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
