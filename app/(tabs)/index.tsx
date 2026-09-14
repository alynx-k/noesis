import { useMemo } from 'react';
import { Pressable, ScrollView, StyleSheet, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { router } from 'expo-router';
import { Ionicons } from '@expo/vector-icons';
import { useAuth } from '../../context/auth';
import { useStreak } from '../../hooks/queries/use-streak';
import { usePendingCelebrations, useMarkCelebrationSeen } from '../../hooks/queries/use-celebrations';
import { useMyLeagueBoard } from '../../hooks/queries/use-league';
import { useSubjects } from '../../hooks/queries/use-subjects';
import { useVisibleLessons, type LessonSummary } from '../../hooks/queries/use-lessons';
import { useCompletedLessonIds } from '../../hooks/queries/use-lesson-progress';
import { CelebrationModal } from '../../components/celebration-modal';
import { useAppTheme } from '../../hooks/use-app-theme';
import { GRADE_LABELS, SERIE_LABELS } from '../../constants/grades';
import { TIER_LABELS } from '../../constants/leagues';
import { fonts, radius, spacing } from '../../constants/theme';

function getInitials(email: string | null): string {
  if (!email) return '?';
  return email.split('@')[0].slice(0, 2).toUpperCase();
}

function abbreviateSubject(name: string): string {
  if (name.includes('-')) {
    return name
      .split('-')
      .map((part) => part[0])
      .join('')
      .toUpperCase();
  }
  if (name.length <= 4) return name.toUpperCase();
  return name[0].toUpperCase();
}

function formatRank(rank: number): string {
  return rank === 1 ? '1er' : `${rank}e`;
}

type ResumeItem = {
  lessonId: string;
  subjectName: string;
  lessonTitle: string;
  chapterOrder: number;
  completedCount: number;
  total: number;
};

export default function Accueil() {
  const theme = useAppTheme();
  const { profile } = useAuth();
  const streak = useStreak();
  const pendingCelebrations = usePendingCelebrations();
  const markSeen = useMarkCelebrationSeen();
  const leagueBoard = useMyLeagueBoard();
  const subjects = useSubjects();
  const lessons = useVisibleLessons();
  const progress = useCompletedLessonIds();

  const gradeLabel = profile?.grade ? GRADE_LABELS[profile.grade] : null;
  const serieLabel = profile?.serie ? SERIE_LABELS[profile.serie] : null;
  const currentStreak = streak.data?.current_streak ?? 0;
  const currentCelebration = pendingCelebrations.data?.[0] ?? null;

  const rows = leagueBoard.data ?? [];
  const myRow = rows.find((row) => row.is_me) ?? null;
  const rowAbove = myRow ? rows.find((row) => row.rank === myRow.rank - 1) ?? null : null;

  const { programmeProgressPct, resumeItems } = useMemo(() => {
    const subjectList = subjects.data ?? [];
    const lessonList = lessons.data ?? [];
    const completed = progress.data ?? new Set<string>();

    const lessonsBySubject = new Map<string, LessonSummary[]>();
    for (const lesson of lessonList) {
      const list = lessonsBySubject.get(lesson.subject_id) ?? [];
      list.push(lesson);
      lessonsBySubject.set(lesson.subject_id, list);
    }

    const totalLessons = lessonList.length;
    const totalCompleted = lessonList.filter((lesson) => completed.has(lesson.id)).length;
    const pct = totalLessons > 0 ? Math.round((totalCompleted / totalLessons) * 100) : 0;

    const items: ResumeItem[] = [];
    for (const subject of subjectList) {
      const subjectLessons = lessonsBySubject.get(subject.id) ?? [];
      if (subjectLessons.length === 0) continue;
      const completedCount = subjectLessons.filter((lesson) => completed.has(lesson.id)).length;
      if (completedCount >= subjectLessons.length) continue;
      const nextLesson = subjectLessons.find((lesson) => !completed.has(lesson.id));
      if (!nextLesson) continue;
      items.push({
        lessonId: nextLesson.id,
        subjectName: subject.name,
        lessonTitle: nextLesson.title,
        chapterOrder: nextLesson.chapter_order,
        completedCount,
        total: subjectLessons.length,
      });
    }

    return { programmeProgressPct: pct, resumeItems: items.slice(0, 3) };
  }, [subjects.data, lessons.data, progress.data]);

  return (
    <SafeAreaView style={[styles.safe, { backgroundColor: theme.background }]}>
      <CelebrationModal
        celebration={currentCelebration}
        dismissing={markSeen.isPending}
        onDismiss={() => {
          if (currentCelebration) {
            markSeen.mutate({ event_type: currentCelebration.event_type, event_key: currentCelebration.event_key });
          }
        }}
      />
      <ScrollView contentContainerStyle={styles.content}>
        <View style={styles.headerRow}>
          <View style={[styles.avatar, { backgroundColor: theme.secondary }]}>
            <Text style={[styles.avatarText, { fontFamily: fonts.display }]}>{getInitials(profile?.email ?? null)}</Text>
          </View>
          <View style={{ alignItems: 'flex-end', gap: spacing.xs }}>
            <View style={[styles.streakChip, { backgroundColor: theme.primaryTint }]}>
              <Text style={{ color: theme.primary, fontFamily: fonts.dataBold, fontSize: 14 }}>
                🔥 {currentStreak} jour{currentStreak > 1 ? 's' : ''}
              </Text>
            </View>
            {streak.data ? (
              <Text style={{ color: theme.textMuted, fontFamily: fonts.body, fontSize: 11.5 }}>
                🧊 {streak.data.freezes_available} gel{streak.data.freezes_available > 1 ? 's' : ''}
              </Text>
            ) : null}
          </View>
        </View>

        <Text style={[styles.greeting, { color: theme.text, fontFamily: fonts.display }]}>
          Salut{profile?.email ? `, ${profile.email.split('@')[0]}` : ''} 👋
        </Text>
        <Text style={[styles.subtitle, { color: theme.textMuted }]}>
          {gradeLabel ? `${gradeLabel}${serieLabel ? ` · ${serieLabel}` : ''}` : 'Profil en cours de configuration'}
        </Text>

        <View style={styles.statRow}>
          <View style={[styles.statCard, { backgroundColor: theme.card, borderColor: theme.border }]}>
            <Text style={[styles.statNum, { color: theme.text, fontFamily: fonts.dataBold }]}>{myRow?.xp ?? 0}</Text>
            <Text style={[styles.statLabel, { color: theme.textMuted }]}>XP cette semaine</Text>
          </View>
          <View style={[styles.statCard, { backgroundColor: theme.card, borderColor: theme.border }]}>
            <Text style={[styles.statNum, { color: theme.text, fontFamily: fonts.dataBold }]}>{programmeProgressPct}%</Text>
            <Text style={[styles.statLabel, { color: theme.textMuted }]}>
              {gradeLabel ? `Programme ${gradeLabel}` : 'Programme'}
            </Text>
          </View>
        </View>

        {myRow ? (
          <Pressable
            onPress={() => router.push('/ligue')}
            style={[styles.leagueCard, { backgroundColor: theme.secondary }]}
          >
            <Text style={styles.leagueTier}>
              Ligue {TIER_LABELS[myRow.tier]}
              {gradeLabel ? ` · Classe ${gradeLabel}${serieLabel ? ` ${serieLabel}` : ''}` : ''}
            </Text>
            <Text style={[styles.leagueRank, { fontFamily: fonts.displayBlack }]}>{formatRank(myRow.rank)} place</Text>
            <Text style={styles.leagueSub}>
              {rowAbove
                ? `Encore ${rowAbove.xp - myRow.xp} XP pour dépasser le ${formatRank(rowAbove.rank)}`
                : 'Tu es en tête de ta ligue cette semaine !'}
            </Text>
          </Pressable>
        ) : null}

        {resumeItems.length > 0 ? (
          <>
            <Text style={[styles.sectionLabel, { color: theme.textMuted }]}>Reprendre</Text>
            {resumeItems.map((item) => (
              <Pressable
                key={item.lessonId}
                onPress={() => router.push({ pathname: '/course/[id]', params: { id: item.lessonId } })}
                style={[styles.courseItem, { backgroundColor: theme.card, borderColor: theme.border }]}
              >
                <View style={[styles.courseIcon, { backgroundColor: theme.primaryTint }]}>
                  <Text style={{ color: theme.primary, fontFamily: fonts.display, fontSize: 14 }}>
                    {abbreviateSubject(item.subjectName)}
                  </Text>
                </View>
                <View style={styles.courseInfo}>
                  <Text style={[styles.courseName, { color: theme.text }]}>
                    {item.lessonTitle} — Chap. {item.chapterOrder}
                  </Text>
                  <Text style={[styles.courseMeta, { color: theme.textMuted }]}>
                    {item.subjectName}
                    {gradeLabel ? ` · ${gradeLabel}` : ''}
                  </Text>
                  <View style={[styles.progressBar, { backgroundColor: theme.border }]}>
                    <View
                      style={[
                        styles.progressBarFill,
                        { backgroundColor: theme.primary, width: `${Math.round((item.completedCount / item.total) * 100)}%` },
                      ]}
                    />
                  </View>
                </View>
              </Pressable>
            ))}
          </>
        ) : null}

        <Text style={[styles.sectionLabel, { color: theme.textMuted }]}>Accès rapide</Text>

        <Pressable
          onPress={() => router.push('/ai-chat')}
          style={[styles.quickRow, { backgroundColor: theme.card, borderColor: theme.border }]}
        >
          <Ionicons name="chatbubbles-outline" size={19} color={theme.primary} />
          <Text style={[styles.quickLabel, { color: theme.text }]}>Demander au tuteur IA</Text>
          <Ionicons name="chevron-forward" size={18} color={theme.textMuted} />
        </Pressable>

        <Pressable
          onPress={() => router.push('/focus-session')}
          style={[styles.quickRow, { backgroundColor: theme.card, borderColor: theme.border }]}
        >
          <Ionicons name="timer-outline" size={19} color={theme.primary} />
          <Text style={[styles.quickLabel, { color: theme.text }]}>Lancer une session de concentration</Text>
          <Ionicons name="chevron-forward" size={18} color={theme.textMuted} />
        </Pressable>

        <Pressable
          onPress={() => router.push('/summaries')}
          style={[styles.quickRow, { backgroundColor: theme.card, borderColor: theme.border }]}
        >
          <Ionicons name="document-text-outline" size={19} color={theme.primary} />
          <Text style={[styles.quickLabel, { color: theme.text }]}>Créer une synthèse de cours</Text>
          <Ionicons name="chevron-forward" size={18} color={theme.textMuted} />
        </Pressable>
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safe: { flex: 1 },
  content: { padding: spacing.lg, gap: spacing.sm, paddingBottom: spacing.xl },
  headerRow: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'flex-start' },
  avatar: { width: 40, height: 40, borderRadius: radius.full, alignItems: 'center', justifyContent: 'center' },
  avatarText: { color: '#FFFFFF', fontSize: 15 },
  greeting: { fontSize: 22, marginTop: spacing.sm },
  subtitle: { fontFamily: fonts.body, fontSize: 15, marginTop: 2, marginBottom: spacing.xs },
  streakChip: {
    borderRadius: radius.full,
    paddingHorizontal: spacing.sm + 2,
    paddingVertical: spacing.xs + 2,
  },
  statRow: { flexDirection: 'row', gap: spacing.sm },
  statCard: { flex: 1, borderWidth: 1, borderRadius: radius.md, padding: spacing.md },
  statNum: { fontSize: 22 },
  statLabel: { fontFamily: fonts.body, fontSize: 12, marginTop: 2 },
  leagueCard: { borderRadius: radius.lg, padding: spacing.md + 2 },
  leagueTier: {
    color: 'rgba(255,255,255,0.75)',
    fontFamily: fonts.bodySemiBold,
    fontSize: 12,
    textTransform: 'uppercase',
    letterSpacing: 0.5,
  },
  leagueRank: { color: '#FFFFFF', fontSize: 28, marginTop: 4, marginBottom: 2 },
  leagueSub: { color: 'rgba(255,255,255,0.85)', fontFamily: fonts.body, fontSize: 13 },
  sectionLabel: {
    fontFamily: fonts.bodySemiBold,
    fontSize: 13,
    textTransform: 'uppercase',
    letterSpacing: 0.5,
    marginTop: spacing.sm,
  },
  courseItem: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: spacing.sm + 2,
    borderWidth: 1,
    borderRadius: radius.md,
    padding: spacing.sm + 4,
  },
  courseIcon: { width: 38, height: 38, borderRadius: radius.sm, alignItems: 'center', justifyContent: 'center' },
  courseInfo: { flex: 1, gap: 2 },
  courseName: { fontFamily: fonts.bodySemiBold, fontSize: 14.5 },
  courseMeta: { fontFamily: fonts.body, fontSize: 12.5 },
  progressBar: { height: 5, borderRadius: radius.full, marginTop: spacing.xs, overflow: 'hidden' },
  progressBarFill: { height: '100%' },
  quickRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: spacing.sm,
    borderWidth: 1,
    borderRadius: radius.md,
    padding: spacing.sm + 4,
  },
  quickLabel: { flex: 1, fontFamily: fonts.bodySemiBold, fontSize: 14.5 },
});
