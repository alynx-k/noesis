import { GradeId, isLyceeGrade, SeriesId } from '@/constants/grades';

export type DisciplineId =
  | 'histoire-geographie'
  | 'mathematiques'
  | 'anglais'
  | 'francais'
  | 'edhc'
  | 'physique-chimie'
  | 'svt'
  | 'espagnol'
  | 'allemand'
  | 'philosophie'
  | 'tice';

export type Discipline = {
  id: DisciplineId;
  label: string;
  available: boolean;
  icon:
    | 'globe'
    | 'function'
    | 'text.bubble.fill'
    | 'book.fill'
    | 'heart.fill'
    | 'atom'
    | 'leaf.fill'
    | 'flag.fill'
    | 'character.book.closed.fill'
    | 'brain.head.profile'
    | 'desktopcomputer';
  // Values of the `subject` column (in the `courses` table) grouped under
  // this discipline. Histoire-Géographie is the one discipline that's
  // actually two subjects shown together under subheadings; every other
  // discipline maps to a single matching subject value.
  subjects: string[];
  // Very pale two-stop pastel gradient — the whole card's background on Home.
  cardGradient: readonly [string, string];
  // Medium-saturated two-stop duotone — the icon badge's own gradient fill
  // (opaque square, white icon on top), one hue family per subject.
  badgeGradient: readonly [string, string];
  // Single solid tone from the same hue family — the progress bar fill.
  solidColor: string;
};

// Espagnol and Allemand are the LV2 (second foreign language) disciplines:
// a student studies exactly one of them at their real school, so exactly one
// of these two entries is ever shown — filtered by the student's saved
// choice (see lib/lv2.ts), never both. Both are declared `available: true`
// since availability isn't the gate here, the LV2 choice is.
export const DISCIPLINES: Discipline[] = [
  {
    id: 'histoire-geographie',
    label: 'Histoire-Géographie',
    available: true,
    icon: 'globe',
    subjects: ['geographie', 'histoire'],
    cardGradient: ['#CDEEF0', '#E4F7F7'],
    badgeGradient: ['#1FA6B0', '#0E7A8C'],
    solidColor: '#1B95A0',
  },
  {
    id: 'mathematiques',
    label: 'Mathématiques',
    available: true,
    icon: 'function',
    subjects: ['mathematiques'],
    cardGradient: ['#E1D9FC', '#EEE9FD'],
    badgeGradient: ['#8B6FF0', '#6142C7'],
    solidColor: '#6E4FE0',
  },
  {
    id: 'anglais',
    label: 'Anglais',
    available: true,
    icon: 'text.bubble.fill',
    subjects: ['anglais'],
    cardGradient: ['#D7F2E0', '#E9F8EE'],
    badgeGradient: ['#3FC57A', '#1F9C55'],
    solidColor: '#2FAE63',
  },
  {
    id: 'francais',
    label: 'Français',
    available: true,
    icon: 'book.fill',
    subjects: ['francais'],
    cardGradient: ['#FBD9D3', '#FCE9E4'],
    badgeGradient: ['#F2704A', '#D8402A'],
    solidColor: '#E8543A',
  },
  {
    id: 'edhc',
    label: 'EDHC',
    available: true,
    icon: 'heart.fill',
    subjects: ['edhc'],
    cardGradient: ['#FCE1EE', '#FDEDF5'],
    badgeGradient: ['#F27CB0', '#D8508C'],
    solidColor: '#E85D9E',
  },
  {
    id: 'physique-chimie',
    label: 'Physique-Chimie',
    available: true,
    icon: 'atom',
    subjects: ['physique-chimie'],
    cardGradient: ['#FCE4C8', '#FDF0DE'],
    badgeGradient: ['#FFA94D', '#E8791F'],
    solidColor: '#F58B2E',
  },
  {
    id: 'svt',
    label: 'SVT',
    available: true,
    icon: 'leaf.fill',
    subjects: ['svt'],
    cardGradient: ['#D7F2E0', '#E9F8EE'],
    badgeGradient: ['#4FBE5C', '#2E9440'],
    solidColor: '#3FAE4A',
  },
  {
    id: 'espagnol',
    label: 'Espagnol',
    available: true,
    icon: 'flag.fill',
    subjects: ['espagnol'],
    cardGradient: ['#FBD9DC', '#FCE7E9'],
    badgeGradient: ['#F0564F', '#D8342A'],
    solidColor: '#E8443F',
  },
  {
    id: 'allemand',
    label: 'Allemand',
    available: true,
    icon: 'character.book.closed.fill',
    subjects: ['allemand'],
    cardGradient: ['#FCE4C8', '#FDF0DE'],
    badgeGradient: ['#E0A05C', '#B87233'],
    solidColor: '#D68A4E',
  },
  // Lycée-only disciplines: Philosophie appears from la 1ère, TICE only in
  // 1ère séries C/D — see getDisciplineIdsFor below.
  {
    id: 'philosophie',
    label: 'Philosophie',
    available: true,
    icon: 'brain.head.profile',
    subjects: ['philosophie'],
    cardGradient: ['#E1D9FC', '#EEE9FD'],
    badgeGradient: ['#B49AE0', '#8A69C4'],
    solidColor: '#9B7FC4',
  },
  {
    id: 'tice',
    label: 'TICE',
    available: true,
    icon: 'desktopcomputer',
    subjects: ['tice'],
    cardGradient: ['#DCE7FC', '#EEF3FE'],
    badgeGradient: ['#4F7DF0', '#2F58C7'],
    solidColor: '#3B82F6',
  },
];

// Which discipline ids are visible for a given grade (+ série for lycée
// grades). Collège has one uniform list; lycée subjects genuinely change by
// grade et série (Philosophie starts en 1ère, Terminale A drops
// Physique-Chimie, séries C/D drop les LV2 à partir de la 1ère, TICE
// n'existe qu'en 1ère C/D) — confirmed against lyc.ecole-ci.org's own
// category structure per série.
export function getDisciplineIdsFor(grade: GradeId, serie: SeriesId | null): DisciplineId[] {
  if (!isLyceeGrade(grade)) {
    return ['histoire-geographie', 'mathematiques', 'anglais', 'francais', 'edhc', 'physique-chimie', 'svt', 'espagnol', 'allemand'];
  }

  const core: DisciplineId[] = ['histoire-geographie', 'mathematiques', 'anglais', 'francais', 'physique-chimie', 'svt'];

  if (grade === '2nde') {
    return [...core, 'espagnol', 'allemand'];
  }

  if (serie === 'A') {
    const seriesA: DisciplineId[] = [...core, 'espagnol', 'allemand', 'philosophie'];
    return grade === 'terminale' ? seriesA.filter((id) => id !== 'physique-chimie') : seriesA;
  }

  // Séries C/D (1ère/Terminale): no LV2, Philosophie present, TICE only in 1ère.
  const seriesCD: DisciplineId[] = [...core, 'philosophie'];
  return grade === '1ere' ? [...seriesCD, 'tice'] : seriesCD;
}
