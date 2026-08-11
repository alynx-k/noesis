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
  // Two-stop diagonal gradient for this discipline's icon badge on Home —
  // same light-to-dark duotone formula as the app's other gradients (see
  // GRADIENTS in constants/design.ts), just one distinct hue per subject
  // instead of every card sharing the same green.
  gradient: readonly [string, string];
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
    gradient: ['#5BA8E8', '#1E5FA3'],
  },
  {
    id: 'mathematiques',
    label: 'Mathématiques',
    available: true,
    icon: 'function',
    subjects: ['mathematiques'],
    gradient: ['#8F7BF0', '#5A4FBF'],
  },
  {
    id: 'anglais',
    label: 'Anglais',
    available: true,
    icon: 'text.bubble.fill',
    subjects: ['anglais'],
    gradient: ['#4FC3C0', '#1B8C89'],
  },
  {
    id: 'francais',
    label: 'Français',
    available: true,
    icon: 'book.fill',
    subjects: ['francais'],
    gradient: ['#EF8B86', '#C9463F'],
  },
  {
    id: 'edhc',
    label: 'EDHC',
    available: true,
    icon: 'heart.fill',
    subjects: ['edhc'],
    gradient: ['#F09BC0', '#D1568F'],
  },
  {
    id: 'physique-chimie',
    label: 'Physique-Chimie',
    available: true,
    icon: 'atom',
    subjects: ['physique-chimie'],
    gradient: ['#F6C667', '#DB8A1F'],
  },
  {
    id: 'svt',
    label: 'SVT',
    available: true,
    icon: 'leaf.fill',
    subjects: ['svt'],
    gradient: ['#5FC98A', '#1F8F5A'],
  },
  {
    id: 'espagnol',
    label: 'Espagnol',
    available: true,
    icon: 'flag.fill',
    subjects: ['espagnol'],
    gradient: ['#F0855A', '#D1502B'],
  },
  {
    id: 'allemand',
    label: 'Allemand',
    available: true,
    icon: 'character.book.closed.fill',
    subjects: ['allemand'],
    gradient: ['#D9A066', '#96622E'],
  },
  // Lycée-only disciplines: Philosophie appears from la 1ère, TICE only in
  // 1ère séries C/D — see getDisciplineIdsFor below.
  {
    id: 'philosophie',
    label: 'Philosophie',
    available: true,
    icon: 'brain.head.profile',
    subjects: ['philosophie'],
    gradient: ['#B08BE0', '#6B4AA8'],
  },
  {
    id: 'tice',
    label: 'TICE',
    available: true,
    icon: 'desktopcomputer',
    subjects: ['tice'],
    gradient: ['#7FB8D9', '#3D7DA3'],
  },
];

// Which discipline ids are visible for a given grade (+ série for lycée
// grades). Collège has one uniform list; lycée subjects genuinely change by
// grade and série (Philosophie starts en 1ère, Terminale A drops
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
