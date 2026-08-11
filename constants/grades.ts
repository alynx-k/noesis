export type GradeId = '6eme' | '5eme' | '4eme' | '3eme' | '2nde' | '1ere' | 'terminale';

export type Grade = {
  id: GradeId;
  label: string;
  available: boolean;
};

export const GRADES: Grade[] = [
  { id: '6eme', label: '6ème', available: true },
  { id: '5eme', label: '5ème', available: true },
  { id: '4eme', label: '4ème', available: true },
  { id: '3eme', label: '3ème', available: true },
  { id: '2nde', label: '2nde', available: true },
  { id: '1ere', label: '1ère', available: true },
  { id: 'terminale', label: 'Terminale', available: true },
];

// A "série" (track) only applies to lycée grades — collège has one uniform
// subject list per grade. Seconde only splits into A/C on the real source
// (lyc.ecole-ci.org); Première/Terminale split into A/C/D.
export type SeriesId = 'A' | 'C' | 'D';

export const LYCEE_GRADES: GradeId[] = ['2nde', '1ere', 'terminale'];

export function isLyceeGrade(grade: GradeId): boolean {
  return LYCEE_GRADES.includes(grade);
}

export const SERIES_BY_GRADE: Partial<Record<GradeId, { id: SeriesId; label: string }[]>> = {
  '2nde': [
    { id: 'A', label: 'Série A (littéraire)' },
    { id: 'C', label: 'Série C (scientifique)' },
  ],
  '1ere': [
    { id: 'A', label: 'Série A (littéraire)' },
    { id: 'C', label: 'Série C (scientifique)' },
    { id: 'D', label: 'Série D (scientifique)' },
  ],
  terminale: [
    { id: 'A', label: 'Série A (littéraire)' },
    { id: 'C', label: 'Série C (scientifique)' },
    { id: 'D', label: 'Série D (scientifique)' },
  ],
};
