import { router } from 'expo-router';
import { useEffect, useState } from 'react';
import { ScrollView, StyleSheet, Switch, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { GradePicker } from '@/components/grade-picker';
import { GridBackground } from '@/components/grid-background';
import { SeriePicker } from '@/components/serie-picker';
import { ThemedText } from '@/components/themed-text';
import { ScreenBackground } from '@/components/screen-background';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { GRADES, GradeId, isLyceeGrade, SERIES_BY_GRADE, SeriesId } from '@/constants/grades';
import { useAuth } from '@/context/auth';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { getGradeChangeEligibility, getGradeProfile, GradeProfile, updateGrade } from '@/lib/grade';
import {
  cancelAllReminders,
  isNotificationsEnabled,
  requestNotificationPermissions,
  scheduleDailyStreakReminder,
  setNotificationsEnabled,
} from '@/lib/notifications';

export default function SettingsScreen() {
  const COLORS = useThemeColors();
  const { user, signOut } = useAuth();
  const [gradeProfile, setGradeProfile] = useState<GradeProfile | null>(null);
  const [showGradePicker, setShowGradePicker] = useState(false);
  const [pendingGrade, setPendingGrade] = useState<GradeId | null>(null);
  const [gradeChangeError, setGradeChangeError] = useState<string | null>(null);
  const [changingGrade, setChangingGrade] = useState(false);
  const [notificationsOn, setNotificationsOn] = useState(false);

  useEffect(() => {
    getGradeProfile().then(setGradeProfile);
    isNotificationsEnabled().then(setNotificationsOn);
  }, []);

  const handleToggleNotifications = async (value: boolean) => {
    if (value) {
      const granted = await requestNotificationPermissions();
      if (!granted) {
        setNotificationsOn(false);
        return;
      }
      await scheduleDailyStreakReminder();
      await setNotificationsEnabled(true);
      setNotificationsOn(true);
    } else {
      await cancelAllReminders();
      await setNotificationsEnabled(false);
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
    const eligibility = getGradeChangeEligibility(gradeProfile);
    if (!eligibility.allowed && eligibility.nextAllowedDate) {
      setGradeChangeError(
        `Tu pourras changer de classe à partir du ${eligibility.nextAllowedDate.toLocaleDateString('fr-FR', {
          day: 'numeric',
          month: 'long',
          year: 'numeric',
        })}.`,
      );
      return;
    }
    setPendingGrade(null);
    setShowGradePicker((previous) => !previous);
  };

  const finalizeGradeChange = async (grade: GradeId, serie: SeriesId | null) => {
    if (!user || changingGrade) {
      return;
    }
    setShowGradePicker(false);
    setPendingGrade(null);
    if (gradeProfile && grade === gradeProfile.grade && serie === gradeProfile.serie) {
      return;
    }
    setChangingGrade(true);
    const { error } = await updateGrade(user.id, grade, serie);
    setChangingGrade(false);
    if (error) {
      setGradeChangeError(error);
      return;
    }
    setGradeProfile((previous) => (previous ? { ...previous, grade, serie, lastChangedAt: new Date() } : previous));
  };

  const handleSelectGrade = (grade: GradeId) => {
    if (isLyceeGrade(grade)) {
      setPendingGrade(grade);
      return;
    }
    finalizeGradeChange(grade, null);
  };

  const handleSignOut = async () => {
    await signOut();
    router.replace('/login');
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
    pickerWrapper: {
      marginTop: SPACING.tight,
      marginBottom: SPACING.tight,
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
      <GridBackground />
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <View style={styles.header}>
          <BouncyPressable style={styles.backButton} onPress={() => router.back()} hitSlop={8}>
            <IconSymbol name="chevron.right" size={18} color={COLORS.text} style={styles.backIcon} />
          </BouncyPressable>
          <ThemedText style={styles.headerTitle}>Réglages</ThemedText>
          <View style={styles.backButton} />
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
          <BouncyPressable style={styles.row} onPress={handleChangeGradePress} disabled={changingGrade}>
            <View style={styles.rowIcon}>
              <IconSymbol name="checkmark.circle.fill" size={18} color={COLORS.mutedText} />
            </View>
            <View style={styles.rowText}>
              <ThemedText style={styles.rowLabel}>Classe actuelle</ThemedText>
              <ThemedText style={styles.rowValue}>{gradeLabel}</ThemedText>
            </View>
            <ThemedText style={styles.changeLink}>Changer</ThemedText>
          </BouncyPressable>

          {showGradePicker && !pendingGrade ? (
            <View style={styles.pickerWrapper}>
              <GradePicker selectedGrade={gradeProfile?.grade} onSelect={handleSelectGrade} />
            </View>
          ) : null}
          {showGradePicker && pendingGrade ? (
            <View style={styles.pickerWrapper}>
              <BouncyPressable onPress={() => setPendingGrade(null)}>
                <ThemedText style={styles.changeLink}>‹ Changer de classe</ThemedText>
              </BouncyPressable>
              <SeriePicker
                grade={pendingGrade}
                selectedSerie={gradeProfile?.serie}
                onSelect={(serie) => finalizeGradeChange(pendingGrade, serie)}
              />
            </View>
          ) : null}
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

          <BouncyPressable style={styles.signOutButton} onPress={handleSignOut}>
            <ThemedText style={styles.signOutButtonText}>Se déconnecter</ThemedText>
          </BouncyPressable>
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
