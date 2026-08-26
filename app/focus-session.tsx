import Ionicons from '@expo/vector-icons/Ionicons';
import { LinearGradient } from 'expo-linear-gradient';
import { router } from 'expo-router';
import { useMemo, useState } from 'react';
import { KeyboardAvoidingView, Platform, ScrollView, StyleSheet, TextInput, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Svg, { Path } from 'react-native-svg';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { CelebrationBurst } from '@/components/celebration-burst';
import { ThemedText } from '@/components/themed-text';
import { ScreenBackground } from '@/components/screen-background';
import { ProgressRing } from '@/components/ui/progress-ring';
import { GRADIENTS, PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useFocusSession } from '@/context/focus-session';
import { useCourseHistory } from '@/hooks/queries/use-course-history';
import { useStreak } from '@/hooks/queries/use-streak';
import { useThemeColors } from '@/hooks/use-theme-colors';

const DURATION_PRESETS = [20, 30, 45, 60];

const DAILY_TIPS = [
  'Travaille en profondeur pendant 20 minutes, prends une pause de 5 minutes. Répète. La constance bat la motivation.',
  "Coupe les notifications avant de commencer — la concentration se construit, elle ne se récupère pas en 3 secondes.",
  "Relis tes erreurs d'hier avant d'attaquer un nouveau chapitre : c'est là que se cache la vraie progression.",
];

type ToggleKey = 'notifications' | 'music' | 'nature' | 'dnd';

function formatTime(totalSeconds: number): string {
  const minutes = Math.floor(totalSeconds / 60);
  const seconds = totalSeconds % 60;
  return `${minutes}:${seconds.toString().padStart(2, '0')}`;
}

// Purely decorative mountain-with-flag scene tucked into the bottom-right
// corner of the "Conseil du jour" card — a summit motif for "keep climbing",
// monochrome purple so it reads as background texture, not competing with
// the tip text next to it.
function TipMountainIllustration() {
  return (
    <Svg width={90} height={60} viewBox="0 0 90 60" pointerEvents="none">
      <Path d="M0 60 L28 20 L46 42 L58 26 L90 60 Z" fill="#B7A6E8" opacity={0.9} />
      <Path d="M34 60 L60 18 L90 60 Z" fill="#8F79D6" />
      <Path d="M60 18 L60 6" stroke="#5B3FA8" strokeWidth={1.5} />
      <Path d="M60 6 L72 10 L60 14 Z" fill="#E8544F" />
    </Svg>
  );
}

export default function FocusSessionScreen() {
  const COLORS = useThemeColors();
  const { phase, durationMinutes, remainingSeconds, start, reset } = useFocusSession();
  const streakQuery = useStreak();
  const historyQuery = useCourseHistory();

  const [selectedDuration, setSelectedDuration] = useState(20);
  const [customMode, setCustomMode] = useState(false);
  const [customInput, setCustomInput] = useState('20');
  const [objective, setObjective] = useState('');
  const [toggles, setToggles] = useState<Record<ToggleKey, boolean>>({
    notifications: false,
    music: false,
    nature: false,
    dnd: false,
  });

  const tip = useMemo(() => DAILY_TIPS[new Date().getDate() % DAILY_TIPS.length], []);

  const parsedCustom = parseInt(customInput, 10);
  const chosenMinutes = customMode ? parsedCustom : selectedDuration;
  const canStart = Number.isFinite(chosenMinutes) && chosenMinutes > 0 && chosenMinutes <= 240;

  const totalSeconds = durationMinutes * 60;
  const elapsedMinutes = phase === 'running' ? Math.floor((totalSeconds - remainingSeconds) / 60) : 0;
  // The ring reads as "time left in the tank": full at the start of a
  // session, draining down to empty at 0:00 — not the more common
  // "progress toward completion" direction.
  const ringProgress =
    phase === 'running' ? (remainingSeconds / totalSeconds) * 100 : phase === 'success' ? 0 : 92;

  const handleStart = () => {
    if (!canStart) {
      return;
    }
    start(chosenMinutes);
  };

  const handleRestart = () => {
    reset();
  };

  const handleBackHome = () => {
    reset();
    router.replace('/');
  };

  const handleViewObjectives = () => {
    router.push('/course-history');
  };

  const toggleKey = (key: ToggleKey) => setToggles((previous) => ({ ...previous, [key]: !previous[key] }));

  // Flattened, most-recent-first slice across every discipline's history —
  // there's no per-attempt timestamp to sort by yet, so "recent" here means
  // "first entries returned per discipline", good enough for a 2-item
  // preview whose whole point is a teaser, not an audit trail (see
  // app/course-history.tsx for the full, real list).
  const recentSessions = (historyQuery.data ?? [])
    .flatMap((section) => section.courses.map((course) => ({ ...course, discipline: section.discipline })))
    .slice(0, 3);

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    scrollContent: {
      padding: SPACING.screen,
      paddingBottom: SPACING.section + 24,
    },
    header: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      marginBottom: SPACING.element,
    },
    backButton: {
      width: 44,
      height: 44,
      borderRadius: 16,
      backgroundColor: '#F0EDFB',
      alignItems: 'center',
      justifyContent: 'center',
    },
    moreButton: {
      width: 44,
      height: 44,
      alignItems: 'center',
      justifyContent: 'center',
    },
    headerCenter: {
      flex: 1,
      alignItems: 'center',
    },
    rocketBadge: {
      width: 56,
      height: 56,
      borderRadius: 18,
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: SPACING.tight,
    },
    title: {
      ...TYPOGRAPHY.title,
      fontSize: 24,
      color: COLORS.text,
      textAlign: 'center',
    },
    subtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      textAlign: 'center',
      marginTop: 4,
      marginBottom: SPACING.element,
    },
    card: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.element,
      marginBottom: SPACING.element,
    },
    cardLabel: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      marginBottom: SPACING.tight,
    },
    pillRow: {
      flexDirection: 'row',
      flexWrap: 'nowrap',
      gap: 4,
      marginBottom: SPACING.tight,
    },
    pill: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 2,
      backgroundColor: '#F0EFF5',
      borderRadius: PILL_RADIUS,
      paddingVertical: 6,
      paddingHorizontal: 7,
      borderWidth: 1.5,
      borderColor: 'transparent',
      flexShrink: 1,
    },
    pillSelected: {
      backgroundColor: '#E7DFFC',
      borderColor: '#6D5BD0',
    },
    pillText: {
      fontSize: 10.5,
      fontWeight: '700',
      color: COLORS.mutedText,
    },
    pillTextSelected: {
      color: '#6D5BD0',
    },
    customInput: {
      alignSelf: 'flex-start',
      fontSize: 14,
      fontWeight: '700',
      color: COLORS.text,
      backgroundColor: '#F0EFF5',
      borderRadius: PILL_RADIUS,
      paddingVertical: 6,
      paddingHorizontal: 14,
      minWidth: 60,
      textAlign: 'center',
      marginBottom: SPACING.tight,
    },
    objectiveInput: {
      ...TYPOGRAPHY.body,
      fontSize: 14,
      color: COLORS.text,
      backgroundColor: '#F0EFF5',
      borderRadius: 14,
      paddingVertical: 10,
      paddingHorizontal: 14,
    },
    timerCardWrapper: {
      borderRadius: RADIUS + 4,
      overflow: 'hidden',
      marginBottom: SPACING.element,
    },
    timerCard: {
      padding: SPACING.element,
      alignItems: 'center',
    },
    modeFocusPill: {
      alignSelf: 'flex-end',
      flexDirection: 'row',
      alignItems: 'center',
      gap: 4,
      backgroundColor: '#FFFFFF',
      borderRadius: PILL_RADIUS,
      paddingVertical: 7,
      paddingHorizontal: 12,
      marginBottom: SPACING.tight,
    },
    modeFocusText: {
      fontSize: 13,
      fontWeight: '700',
      color: '#6D5BD0',
    },
    ringRow: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'center',
      gap: SPACING.tight,
      width: '100%',
      marginBottom: 24,
    },
    ringStage: {
      alignItems: 'center',
      justifyContent: 'center',
    },
    ringOverlay: {
      position: 'absolute',
      alignItems: 'center',
    },
    focusLabel: {
      fontSize: 12,
      color: COLORS.mutedText,
      marginBottom: 2,
    },
    timerText: {
      fontSize: 22,
      lineHeight: 28,
      fontWeight: '800',
      color: COLORS.text,
    },
    readySubtitle: {
      fontSize: 10,
      color: COLORS.mutedText,
      marginTop: 2,
      textAlign: 'center',
      paddingHorizontal: 8,
    },
    playButton: {
      position: 'absolute',
      bottom: -20,
      width: 48,
      height: 48,
      borderRadius: 24,
      backgroundColor: '#6D5BD0',
      alignItems: 'center',
      justifyContent: 'center',
      shadowColor: '#6D5BD0',
      shadowOffset: { width: 0, height: 6 },
      shadowOpacity: 0.35,
      shadowRadius: 10,
      elevation: 6,
    },
    sideStat: {
      alignItems: 'center',
      width: 58,
      flexShrink: 0,
    },
    sideStatBadge: {
      width: 32,
      height: 32,
      borderRadius: 11,
      backgroundColor: '#FFFFFF',
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: 6,
    },
    sideStatNumber: {
      fontSize: 14,
      fontWeight: '700',
      color: COLORS.text,
    },
    sideStatLabel: {
      fontSize: 11,
      color: COLORS.mutedText,
      textAlign: 'center',
    },
    resetButton: {
      alignSelf: 'center',
      flexDirection: 'row',
      alignItems: 'center',
      gap: 6,
      marginTop: SPACING.section + 16,
      paddingVertical: 8,
      paddingHorizontal: 16,
    },
    resetText: {
      fontSize: 14,
      fontWeight: '700',
      color: '#6D5BD0',
    },
    toggleRow: {
      flexDirection: 'row',
      justifyContent: 'space-between',
    },
    toggleItem: {
      flex: 1,
      alignItems: 'center',
      gap: 8,
      paddingVertical: 4,
    },
    toggleDivider: {
      width: StyleSheet.hairlineWidth,
      backgroundColor: COLORS.border,
    },
    toggleLabel: {
      fontSize: 12,
      color: COLORS.mutedText,
      textAlign: 'center',
      lineHeight: 15,
    },
    toggleLabelActive: {
      color: '#6D5BD0',
      fontWeight: '700',
    },
    tipCardWrapper: {
      borderRadius: RADIUS,
      overflow: 'hidden',
      marginBottom: SPACING.element,
    },
    tipCard: {
      flexDirection: 'row',
      alignItems: 'center',
      padding: SPACING.element,
      gap: SPACING.tight,
    },
    tipBadge: {
      width: 48,
      height: 48,
      borderRadius: 16,
      alignItems: 'center',
      justifyContent: 'center',
    },
    tipText: {
      flex: 1,
    },
    tipMountainBox: {
      width: 78,
      alignSelf: 'stretch',
      alignItems: 'flex-end',
      justifyContent: 'flex-end',
    },
    tipTitle: {
      fontSize: 15,
      fontWeight: '700',
      color: COLORS.text,
      marginBottom: 4,
    },
    tipBody: {
      fontSize: 13,
      color: COLORS.mutedText,
      lineHeight: 18,
    },
    historyHeader: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      marginBottom: SPACING.tight,
    },
    historyTitle: {
      fontSize: 16,
      fontWeight: '700',
      color: COLORS.text,
    },
    historySeeAll: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: 2,
    },
    historySeeAllText: {
      fontSize: 13,
      fontWeight: '700',
      color: '#6D5BD0',
    },
    historyRow: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      paddingVertical: SPACING.tight,
    },
    historyIconBadge: {
      width: 36,
      height: 36,
      borderRadius: 12,
      alignItems: 'center',
      justifyContent: 'center',
    },
    historyText: {
      flex: 1,
    },
    historyCourseTitle: {
      fontSize: 14,
      fontWeight: '700',
      color: COLORS.text,
    },
    historySubtitle: {
      fontSize: 12,
      color: COLORS.mutedText,
      marginTop: 2,
    },
    historyPercent: {
      fontSize: 15,
      fontWeight: '700',
    },
    bigButton: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'center',
      gap: 8,
      backgroundColor: '#6D5BD0',
      borderRadius: PILL_RADIUS,
      paddingVertical: 16,
    },
    bigButtonText: {
      color: '#FFFFFF',
      fontSize: 16,
      fontWeight: '700',
    },
    secondaryButton: {
      alignSelf: 'center',
      paddingVertical: 12,
      marginTop: SPACING.tight,
    },
    secondaryButtonText: {
      color: COLORS.mutedText,
      fontSize: 14,
      fontWeight: '600',
      textDecorationLine: 'underline',
    },
  });

  const timerLabel = phase === 'running' ? formatTime(remainingSeconds) : phase === 'success' ? '00:00' : `${chosenMinutes || 0}:00`;
  const readyText =
    phase === 'running'
      ? 'Concentration en cours…'
      : phase === 'success'
        ? 'Session terminée, bravo ! 🎉'
        : "Prêt ? C'est parti ! 🚀";

  return (
    <ScreenBackground color="#FAF8FC">
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <KeyboardAvoidingView style={{ flex: 1 }} behavior={Platform.OS === 'ios' ? 'padding' : undefined}>
          <ScrollView contentContainerStyle={styles.scrollContent} keyboardShouldPersistTaps="handled">
            <View style={styles.header}>
              <BouncyPressable style={styles.backButton} onPress={() => router.back()}>
                <Ionicons name="arrow-back" size={20} color={COLORS.text} />
              </BouncyPressable>
              <View style={styles.headerCenter}>
                <LinearGradient colors={GRADIENTS.badgeViolet} style={[styles.rocketBadge, { backgroundColor: GRADIENTS.badgeViolet[0] }]}>
                  <Ionicons name="rocket" size={26} color="#FFFFFF" />
                </LinearGradient>
                <ThemedText style={styles.title}>Session focus</ThemedText>
                <ThemedText style={styles.subtitle}>Reste concentré, construis ton futur.</ThemedText>
              </View>
              <View style={styles.moreButton}>
                <Ionicons name="ellipsis-horizontal" size={20} color={COLORS.mutedText} />
              </View>
            </View>

            {phase === 'idle' ? (
              <View style={styles.card}>
                <ThemedText style={styles.cardLabel}>Durée de la session</ThemedText>
                <View style={styles.pillRow}>
                  {DURATION_PRESETS.map((minutes) => {
                    const selected = !customMode && selectedDuration === minutes;
                    return (
                      <BouncyPressable
                        key={minutes}
                        style={[styles.pill, selected && styles.pillSelected]}
                        onPress={() => {
                          setCustomMode(false);
                          setSelectedDuration(minutes);
                        }}>
                        <ThemedText style={[styles.pillText, selected && styles.pillTextSelected]}>{minutes} min</ThemedText>
                      </BouncyPressable>
                    );
                  })}
                  <BouncyPressable
                    style={[styles.pill, customMode && styles.pillSelected]}
                    onPress={() => setCustomMode(true)}>
                    <ThemedText style={[styles.pillText, customMode && styles.pillTextSelected]} numberOfLines={1}>
                      Personnalisé
                    </ThemedText>
                    <Ionicons name="pencil" size={11} color={customMode ? '#6D5BD0' : COLORS.mutedText} />
                  </BouncyPressable>
                </View>

                {customMode ? (
                  <TextInput
                    style={styles.customInput}
                    keyboardType="number-pad"
                    value={customInput}
                    onChangeText={setCustomInput}
                    maxLength={3}
                    placeholder="Minutes"
                  />
                ) : null}

                <ThemedText style={styles.cardLabel}>Objectif de la session</ThemedText>
                <TextInput
                  style={styles.objectiveInput}
                  value={objective}
                  onChangeText={setObjective}
                  placeholder="Ex : Réviser les systèmes politiques de la Grèce antique"
                  placeholderTextColor={COLORS.placeholderText}
                  multiline
                />
              </View>
            ) : null}

            <View style={styles.timerCardWrapper}>
              <LinearGradient
                colors={GRADIENTS.focusTimerCard}
                start={{ x: 0.1, y: 0 }}
                end={{ x: 0.9, y: 1 }}
                style={[styles.timerCard, { backgroundColor: GRADIENTS.focusTimerCard[1] }]}>
                <BouncyPressable style={styles.modeFocusPill} onPress={handleViewObjectives}>
                  <Ionicons name="locate" size={14} color="#6D5BD0" />
                  <ThemedText style={styles.modeFocusText}>Mode focus</ThemedText>
                  <Ionicons name="chevron-forward" size={13} color="#6D5BD0" />
                </BouncyPressable>

                <View style={styles.ringRow}>
                  <View style={styles.sideStat}>
                    <View style={styles.sideStatBadge}>
                      <Ionicons name="stats-chart" size={18} color="#6D5BD0" />
                    </View>
                    <ThemedText style={styles.sideStatNumber}>{elapsedMinutes} min</ThemedText>
                    <ThemedText style={styles.sideStatLabel}>concentré</ThemedText>
                  </View>

                  <View style={styles.ringStage}>
                    <ProgressRing progress={ringProgress} size={132} strokeWidth={7} color="#6D5BD0" trackColor="#E8E3F7" />
                    <View style={styles.ringOverlay}>
                      <ThemedText style={styles.focusLabel}>Focus</ThemedText>
                      <ThemedText style={styles.timerText}>{timerLabel}</ThemedText>
                      <ThemedText style={styles.readySubtitle}>{readyText}</ThemedText>
                    </View>
                    {phase === 'idle' ? (
                      <BouncyPressable style={styles.playButton} onPress={handleStart} disabled={!canStart}>
                        <Ionicons name="play" size={26} color="#FFFFFF" />
                      </BouncyPressable>
                    ) : null}
                  </View>

                  <View style={styles.sideStat}>
                    <View style={styles.sideStatBadge}>
                      <ThemedText style={{ fontSize: 18 }}>🔥</ThemedText>
                    </View>
                    <ThemedText style={styles.sideStatNumber}>Série actuelle</ThemedText>
                    <ThemedText style={styles.sideStatLabel}>{streakQuery.data?.streak ?? 0} jour</ThemedText>
                  </View>
                </View>

                {phase !== 'idle' ? (
                  <BouncyPressable style={styles.resetButton} onPress={handleRestart}>
                    <Ionicons name="refresh" size={16} color="#6D5BD0" />
                    <ThemedText style={styles.resetText}>Réinitialiser</ThemedText>
                  </BouncyPressable>
                ) : null}
              </LinearGradient>
            </View>

            {phase === 'idle' ? (
              <>
                <View style={styles.card}>
                  <View style={styles.toggleRow}>
                    {(
                      [
                        { key: 'notifications' as const, icon: 'notifications-off-outline' as const, label: 'Bloquer\nnotifications' },
                        { key: 'music' as const, icon: 'musical-notes-outline' as const, label: 'Musique\nfocus' },
                        { key: 'nature' as const, icon: 'leaf-outline' as const, label: 'Sons\nnature' },
                        { key: 'dnd' as const, icon: 'moon-outline' as const, label: 'Mode\nne pas déranger' },
                      ]
                    ).map((item, index, array) => (
                      <View key={item.key} style={{ flexDirection: 'row', flex: 1 }}>
                        <BouncyPressable style={styles.toggleItem} onPress={() => toggleKey(item.key)}>
                          <Ionicons name={item.icon} size={22} color={toggles[item.key] ? '#6D5BD0' : COLORS.mutedText} />
                          <ThemedText style={[styles.toggleLabel, toggles[item.key] && styles.toggleLabelActive]}>
                            {item.label}
                          </ThemedText>
                        </BouncyPressable>
                        {index < array.length - 1 ? <View style={styles.toggleDivider} /> : null}
                      </View>
                    ))}
                  </View>
                </View>

                <View style={styles.tipCardWrapper}>
                  <LinearGradient
                    colors={GRADIENTS.hero}
                    start={{ x: 0, y: 0 }}
                    end={{ x: 1, y: 1 }}
                    style={[styles.tipCard, { backgroundColor: GRADIENTS.hero[0] }]}>
                    <LinearGradient colors={GRADIENTS.badgeViolet} style={[styles.tipBadge, { backgroundColor: GRADIENTS.badgeViolet[0] }]}>
                      <Ionicons name="bulb" size={22} color="#FFFFFF" />
                    </LinearGradient>
                    <View style={styles.tipText}>
                      <ThemedText style={styles.tipTitle}>Conseil du jour</ThemedText>
                      <ThemedText style={styles.tipBody}>{tip}</ThemedText>
                    </View>
                    <View style={styles.tipMountainBox}>
                      <TipMountainIllustration />
                    </View>
                  </LinearGradient>
                </View>

                {recentSessions.length > 0 ? (
                  <View style={styles.card}>
                    <View style={styles.historyHeader}>
                      <ThemedText style={styles.historyTitle}>Tes dernières sessions</ThemedText>
                      <BouncyPressable style={styles.historySeeAll} onPress={() => router.push('/course-history')}>
                        <ThemedText style={styles.historySeeAllText}>Voir tout</ThemedText>
                        <Ionicons name="chevron-forward" size={13} color="#6D5BD0" />
                      </BouncyPressable>
                    </View>
                    {recentSessions.map((entry) => {
                      const isFull = entry.goodPercentage >= 100;
                      return (
                        <View key={entry.courseId} style={styles.historyRow}>
                          <View
                            style={[
                              styles.historyIconBadge,
                              { backgroundColor: isFull ? '#DFF4E7' : '#FCE7CF' },
                            ]}>
                            <Ionicons
                              name={isFull ? 'checkmark-circle' : 'time'}
                              size={18}
                              color={isFull ? '#22A55D' : '#F5893A'}
                            />
                          </View>
                          <View style={styles.historyText}>
                            <ThemedText style={styles.historyCourseTitle} numberOfLines={1}>
                              {entry.courseTitle}
                            </ThemedText>
                            <ThemedText style={styles.historySubtitle}>{entry.discipline.label}</ThemedText>
                          </View>
                          <ThemedText style={[styles.historyPercent, { color: isFull ? '#22A55D' : '#F5893A' }]}>
                            {entry.goodPercentage} %
                          </ThemedText>
                        </View>
                      );
                    })}
                  </View>
                ) : null}

                <BouncyPressable style={styles.bigButton} onPress={handleViewObjectives}>
                  <Ionicons name="locate" size={18} color="#FFFFFF" />
                  <ThemedText style={styles.bigButtonText}>Voir mes objectifs</ThemedText>
                </BouncyPressable>
              </>
            ) : null}

            {phase === 'success' ? (
              <BouncyPressable style={styles.bigButton} onPress={handleBackHome}>
                <ThemedText style={styles.bigButtonText}>Retour à l&apos;accueil</ThemedText>
              </BouncyPressable>
            ) : null}

            {phase === 'failed' ? (
              <View style={styles.card}>
                <ThemedText style={styles.cardLabel}>La session s&apos;est arrêtée</ThemedText>
                <ThemedText style={styles.tipBody}>Pas de panique, on retente quand tu veux !</ThemedText>
                <BouncyPressable style={[styles.bigButton, { marginTop: SPACING.element }]} onPress={handleRestart}>
                  <ThemedText style={styles.bigButtonText}>Réessayer</ThemedText>
                </BouncyPressable>
                <BouncyPressable style={styles.secondaryButton} onPress={handleBackHome}>
                  <ThemedText style={styles.secondaryButtonText}>Retour à l&apos;accueil</ThemedText>
                </BouncyPressable>
              </View>
            ) : null}

            {phase === 'running' ? (
              <BouncyPressable style={styles.secondaryButton} onPress={() => router.replace('/')}>
                <ThemedText style={styles.secondaryButtonText}>Continuer sur Noesis</ThemedText>
              </BouncyPressable>
            ) : null}

          </ScrollView>
        </KeyboardAvoidingView>
      </SafeAreaView>
      {phase === 'success' ? <CelebrationBurst /> : null}
    </ScreenBackground>
  );
}
