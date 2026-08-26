import { IconSymbolName } from '@/components/ui/icon-symbol';
import { FEEDBACK_COLORS, STATUS_COLORS } from '@/constants/design';

export type AchievementStats = {
  completedLessons: number;
  streak: number;
  averageScore: number | null;
  successfulSessions: number;
};

export type Achievement = {
  id: string;
  title: string;
  description: string;
  icon: IconSymbolName;
  color: string;
  isUnlocked: (stats: AchievementStats) => boolean;
};

// Every condition here reads from real, already-tracked progress data
// (course_progress, the streak system, answer_attempts, focus_sessions) —
// no separate "achievement points" ledger, so a threshold here always means
// the same thing it means everywhere else in the app.
export const ACHIEVEMENTS: Achievement[] = [
  {
    id: 'premier-pas',
    title: 'Premier pas',
    description: 'Termine ta première leçon',
    icon: 'checkmark.circle.fill',
    color: STATUS_COLORS.info,
    isUnlocked: (stats) => stats.completedLessons >= 1,
  },
  {
    id: 'perseverant',
    title: 'Persévérant',
    description: 'Atteins une série de 7 jours',
    icon: 'flame.fill',
    color: STATUS_COLORS.warning,
    isUnlocked: (stats) => stats.streak >= 7,
  },
  {
    id: 'apprenant-regulier',
    title: 'Apprenant régulier',
    description: 'Termine 50 leçons',
    icon: 'book.fill',
    color: FEEDBACK_COLORS.correct,
    isUnlocked: (stats) => stats.completedLessons >= 50,
  },
  {
    id: 'sans-faute',
    title: 'Sans faute',
    description: 'Atteins 90% de score moyen',
    icon: 'lightbulb.fill',
    color: '#8B6FF0',
    isUnlocked: (stats) => (stats.averageScore ?? 0) >= 90,
  },
  {
    id: 'concentre',
    title: 'Concentré',
    description: 'Termine 10 sessions de concentration',
    icon: 'clock.arrow.circlepath',
    color: STATUS_COLORS.error,
    isUnlocked: (stats) => stats.successfulSessions >= 10,
  },
];
