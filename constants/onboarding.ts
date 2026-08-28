import type { ComponentProps } from 'react';
import Ionicons from '@expo/vector-icons/Ionicons';

type IoniconName = ComponentProps<typeof Ionicons>['name'];

export type MotivationId = 'notes' | 'examen' | 'comprendre' | 'avance' | 'concours' | 'autre';

export const MOTIVATIONS: { id: MotivationId; label: string; icon: IoniconName }[] = [
  { id: 'notes', label: 'Améliorer mes notes', icon: 'trending-up' },
  { id: 'examen', label: 'Réussir un examen', icon: 'checkmark-done-circle' },
  { id: 'comprendre', label: 'Comprendre mes cours', icon: 'book' },
  { id: 'avance', label: "Prendre de l'avance", icon: 'flash' },
  { id: 'concours', label: 'Préparer un concours', icon: 'trophy' },
  { id: 'autre', label: 'Autre', icon: 'ellipsis-horizontal-circle' },
];

export type DailyTimeId = 'moins_30' | '30_60' | '1h_2h' | 'plus_2h';

export const DAILY_TIME_OPTIONS: { id: DailyTimeId; label: string }[] = [
  { id: 'moins_30', label: 'Moins de 30 min' },
  { id: '30_60', label: '30 min à 1h' },
  { id: '1h_2h', label: '1h à 2h' },
  { id: 'plus_2h', label: 'Plus de 2h' },
];

// Minutes used to prefill focus-session.tsx's duration picker — a
// deliberately simple midpoint per bucket, not a promise of precision.
export const DAILY_TIME_TO_MINUTES: Record<DailyTimeId, number> = {
  moins_30: 20,
  '30_60': 45,
  '1h_2h': 90,
  plus_2h: 120,
};

export type NiveauWaitlistId = 'superieur' | 'autre';

export const NIVEAU_WAITLIST_LABELS: Record<NiveauWaitlistId, string> = {
  superieur: 'Supérieur (BTS, Licence, Master...)',
  autre: 'Autre (formation, autodidacte...)',
};
