import { router } from 'expo-router';
import { useEffect, useState } from 'react';
import { ActivityIndicator, Modal, Platform, ScrollView, StyleSheet, Switch, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { GradePicker } from '@/components/grade-picker';
import { SeriePicker } from '@/components/serie-picker';
import { ThemedText } from '@/components/themed-text';
import { ScreenBackground } from '@/components/screen-background';
import { ConfirmDialog } from '@/components/ui/confirm-dialog';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { Skeleton } from '@/components/ui/skeleton';
import { toast } from '@/components/ui/toast';
import { PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { GRADES, GradeId, isLyceeGrade, SERIES_BY_GRADE, SeriesId } from '@/constants/grades';
import { useAuth } from '@/context/auth';
import { useGradeProfile, useUpdateGrade } from '@/hooks/queries/use-grade-profile';
import { useNextUpCourse } from '@/hooks/queries/use-next-up';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { cancelAllReminders, isNotificationsEnabled, requestNotificationPermissions } from '@/lib/notifications';
import { cancelTodayNotifications, runDailyNotificationCycle, setPushNotificationsEnabled } from '@/lib/notification-scheduler';
import { getDisplayName } from '@/lib/profile';

// Deliberate floor under the sign-out loading state — see
// handleConfirmSignOut for why 5s and not just "however long the network
// call takes".
const SIGN_OUT_MIN_DURATION_MS = 5000;

export default function SettingsScreen() {
  const COLORS = useThemeColors();
  const { user, signOut } = useAuth();
  const gradeProfileQuery = useGradeProfile();
  const gradeProfile = gradeProfileQuery.data ?? null;
  const updateGradeMutation = useUpdateGrade();
  const nextUpQuery = useNextUpCourse();
  const [showGradePicker, setShowGradePicker] = useState(false);
  const [pendingGrade, setPendingGrade] = useState<GradeId | null>(null);
  const [gradeChangeError, setGradeChangeError] = useState<string | null>(null);
  const [notificationsOn, setNotificationsOn] = useState(false);
  const [showSignOutConfirm, setShowSignOutConfirm] = useState(false);
  const [isLoggingOut, setIsLoggingOut] = useState(false);

  useEffect(() => {
    isNotificationsEnabled().then(setNotificationsOn);
  }, []);

  const handleToggleNotifications = async (value: boolean) => {
    if (value) {
      const granted = await requestNotificationPermissions();
      if (!granted) {
        setNotificationsOn(false);
        return;
      }
      await setPushNotificationsEnabled(true);
      setNotificationsOn(true);
      // Evaluate right away rather than waiting for tomorrow's app-open
      // cycle, so flipping the toggle on feels immediate.
      await runDailyNotificationCycle({
        prenom: getDisplayName(user),
        matiere: nextUpQuery.data?.courseTitle ?? 'tes cours',
      });
    } else {
      await cancelAllReminders();
      await cancelTodayNotifications();
      await setPushNotificationsEnabled(false);
      setNotificationsOn(false);
    }
  };

  const gradeLabelBase = gradeProfile ? GRADES.find((grade) => grade.id === gradeProfile.grade)?.label : null;
  const serieLabel = gradeProfile?.serie
    ? SERIES_BY_GRADE[gradeProfile.grade]?.find((s) => s.id === gradeProfile.serie)?.label
    : null;
  const gradeLabel = serieLabel ? `${gradeLabelBase} — ${serieLabel}` : gradeLabelBase;

  const handleChangeGradePress = () => {
    setGradeChangeError(null);
    if (!gradeProfile) {
      return;
    }
    setPendingGrade(null);
    setShowGradePicker(true);
  };

  const closeGradePicker = () => {
    setShowGradePicker(false);
    setPendingGrade(null);
  };

  const finalizeGradeChange = async (grade: GradeId, serie: SeriesId | null) => {
    if (!user || updateGradeMutation.isPending) {
      return;
    }
    setShowGradePicker(false);
    setPendingGrade(null);
    if (gradeProfile && grade === gradeProfile.grade && serie === gradeProfile.serie) {
      return;
    }
    const { error } = await updateGradeMutation.mutateAsync({ grade, serie });
    if (error) {
      setGradeChangeError(error);
    }
  };

  const handleSelectGrade = (grade: GradeId) => {
    if (isLyceeGrade(grade)) {
      setPendingGrade(grade);
      return;
    }
    finalizeGradeChange(grade, null);
  };

  const handleSignOutPress = () => {
    setShowSignOutConfirm(true);
  };

  const handleConfirmSignOut = async () => {
    setIsLoggingOut(true);
    // Show the loading state for the full floor BEFORE touching the
    // session at all — nothing here changes global auth state yet, so
    // this screen stays mounted and the timer actually completes.
    // (Calling signOut() first was the bug: Supabase fires its
    // onAuthStateChange listener — context/auth.tsx — the moment the
    // local session clears, which flips the root gate to "needs-auth" and
    // makes Stack.Protected redirect to /login immediately, unmounting
    // this screen mid-timer. The explicit router.replace('/login') that
    // used to follow then raced that automatic redirect, which is what
    // rendered the login screen twice.)
    await new Promise((resolve) => setTimeout(resolve, SIGN_OUT_MIN_DURATION_MS));

    try {
      await signOut();
      // No manual navigation here: signOut() clears the session, the
      // gate reacts on its own and Stack.Protected redirects to /login —
      // the same "let the gate do it" pattern the onboarding screens use.
      // Its own network duration (a real call to Supabase's
      // /auth/v1/logout) adds on top of the floor above, so a slow
      // connection genuinely waits longer, never capped.
    } catch (error) {
      console.error('Sign-out request failed:', error);
      toast.show('Impossible de se déconnecter, réessaie.', { variant: 'error' });
      setIsLoggingOut(false);
      setShowSignOutConfirm(false);
    }
  };

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    header: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      paddingHorizontal: SPACING.screen,
      paddingTop: SPACING.tight,
      paddingBottom: SPACING.element,
    },
    backButton: {
      width: 36,
      height: 36,
      borderRadius: 18,
      backgroundColor: COLORS.surface,
      alignItems: 'center',
      justifyContent: 'center',
      ...cardBorder(COLORS),
    },
    backIcon: {
      transform: [{ scaleX: -1 }],
    },
    // Same footprint as backButton for header symmetry, but no visible
    // circle — previously reused styles.backButton here, which drew an
    // empty white/bordered circle with nothing in it.
    headerSpacer: {
      width: 36,
      height: 36,
    },
    headerTitle: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
    },
    scrollContent: {
      padding: SPACING.screen,
      paddingTop: 0,
      paddingBottom: 40,
    },
    sectionTitle: {
      ...TYPOGRAPHY.label,
      color: COLORS.mutedText,
      textTransform: 'uppercase',
      marginBottom: SPACING.tight,
      marginTop: SPACING.element,
    },
    row: {
      flexDirection: 'row',
      alignItems: 'center',
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      gap: SPACING.tight,
      ...cardBorder(COLORS),
    },
    rowIcon: {
      width: 36,
      height: 36,
      borderRadius: 18,
      backgroundColor: COLORS.lockedBackground,
      alignItems: 'center',
      justifyContent: 'center',
    },
    rowText: {
      flex: 1,
    },
    rowLabel: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
    },
    rowValue: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      marginTop: 2,
    },
    changeLink: {
      color: COLORS.accent,
      fontSize: 14,
      fontWeight: '700',
    },
    error: {
      color: COLORS.danger,
      marginTop: 8,
    },
    signOutButton: {
      borderWidth: 1.5,
      borderColor: COLORS.danger,
      borderRadius: PILL_RADIUS,
      paddingVertical: 16,
      alignItems: 'center',
      marginTop: SPACING.section,
    },
    signOutButtonText: {
      color: COLORS.danger,
      fontSize: 16,
      fontWeight: '700',
    },
  });

  return (
    <ScreenBackground>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <View style={styles.header}>
          <BouncyPressable style={styles.backButton} onPress={() => router.back()} hitSlop={8}>
            <IconSymbol name="chevron.right" size={18} color={COLORS.text} style={styles.backIcon} />
          </BouncyPressable>
          <ThemedText style={styles.headerTitle}>Réglages</ThemedText>
          <View style={styles.headerSpacer} />
        </View>

        <ScrollView contentContainerStyle={styles.scrollContent}>
          <ThemedText style={styles.sectionTitle}>Compte</ThemedText>
          <View style={styles.row}>
            <View style={styles.rowIcon}>
              <IconSymbol name="person.fill" size={18} color={COLORS.mutedText} />
            </View>
            <View style={styles.rowText}>
              <ThemedText style={styles.rowLabel}>Email</ThemedText>
              <ThemedText style={styles.rowValue}>{user?.email}</ThemedText>
            </View>
          </View>

          <ThemedText style={styles.sectionTitle}>Classe</ThemedText>
          <BouncyPressable style={styles.row} onPress={handleChangeGradePress} disabled={updateGradeMutation.isPending}>
            <View style={styles.rowIcon}>
              <IconSymbol name="checkmark.circle.fill" size={18} color={COLORS.mutedText} />
            </View>
            <View style={styles.rowText}>
              <ThemedText style={styles.rowLabel}>Classe actuelle</ThemedText>
              {gradeProfileQuery.isPending ? (
                <Skeleton width={120} height={18} style={{ marginTop: 4 }} />
              ) : (
                <ThemedText style={styles.rowValue}>{gradeLabel}</ThemedText>
              )}
            </View>
            <ThemedText style={styles.changeLink}>Changer</ThemedText>
          </BouncyPressable>
          {gradeChangeError ? <ThemedText style={styles.error}>{gradeChangeError}</ThemedText> : null}

          <ThemedText style={styles.sectionTitle}>Notifications</ThemedText>
          <View style={styles.row}>
            <View style={styles.rowIcon}>
              <IconSymbol name="sparkles" size={18} color={COLORS.mutedText} />
            </View>
            <View style={styles.rowText}>
              <ThemedText style={styles.rowLabel}>Rappels</ThemedText>
              <ThemedText style={styles.rowValue}>Série quotidienne et révisions à faire</ThemedText>
            </View>
            <Switch
              value={notificationsOn}
              onValueChange={handleToggleNotifications}
              trackColor={{ false: COLORS.borderStrong, true: COLORS.accent }}
              thumbColor={COLORS.surface}
            />
          </View>

          <BouncyPressable style={styles.signOutButton} onPress={handleSignOutPress} disabled={isLoggingOut}>
            {isLoggingOut ? (
              <ActivityIndicator color={COLORS.danger} />
            ) : (
              <ThemedText style={styles.signOutButtonText}>Se déconnecter</ThemedText>
            )}
          </BouncyPressable>
        </ScrollView>
      </SafeAreaView>

      <ConfirmDialog
        visible={showSignOutConfirm}
        title="Se déconnecter"
        message="Veux-tu vraiment te déconnecter ?"
        confirmLabel="Se déconnecter"
        cancelLabel="Annuler"
        destructive
        loading={isLoggingOut}
        loadingIcon="rectangle.portrait.and.arrow.right"
        loadingTitle="Déconnexion en cours…"
        loadingMessage="On efface ta session locale, un instant."
        onConfirm={handleConfirmSignOut}
        onCancel={() => setShowSignOutConfirm(false)}
      />

      <Modal
        visible={showGradePicker}
        animationType="slide"
        presentationStyle={Platform.OS === 'ios' ? 'pageSheet' : undefined}
        onRequestClose={closeGradePicker}>
        <ScreenBackground>
          <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
            <View style={styles.header}>
              {pendingGrade ? (
                <BouncyPressable style={styles.backButton} onPress={() => setPendingGrade(null)} hitSlop={8}>
                  <IconSymbol name="chevron.right" size={18} color={COLORS.text} style={styles.backIcon} />
                </BouncyPressable>
              ) : (
                <View style={styles.headerSpacer} />
              )}
              <ThemedText style={styles.headerTitle}>Changer de classe</ThemedText>
              <BouncyPressable style={styles.backButton} onPress={closeGradePicker} hitSlop={8}>
                <IconSymbol name="xmark" size={18} color={COLORS.text} />
              </BouncyPressable>
            </View>
            <ScrollView contentContainerStyle={styles.scrollContent}>
              {pendingGrade ? (
                <SeriePicker
                  grade={pendingGrade}
                  selectedSerie={gradeProfile?.serie}
                  onSelect={(serie) => finalizeGradeChange(pendingGrade, serie)}
                />
              ) : (
                <GradePicker selectedGrade={gradeProfile?.grade} onSelect={handleSelectGrade} />
              )}
            </ScrollView>
          </SafeAreaView>
        </ScreenBackground>
      </Modal>
    </ScreenBackground>
  );
}
