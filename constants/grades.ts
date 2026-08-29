export type Grade = '6e' | '5e' | '4e' | '3e' | '2nde' | '1ere' | 'terminale';

export const COLLEGE_GRADES: Grade[] = ['6e', '5e', '4e', '3e'];
export const LYCEE_GRADES: Grade[] = ['2nde', '1ere', 'terminale'];

export const GRADE_LABELS: Record<Grade, string> = {
  '6e': '6ème',
  '5e': '5ème',
  '4e': '4ème',
  '3e': '3ème',
  '2nde': '2nde',
  '1ere': '1ère',
  terminale: 'Terminale',
};

// Séries provisoires du lycée général ivoirien — la 2nde reste en tronc commun.
// À affiner par l'équipe de contenu si des séries supplémentaires doivent être couvertes.
export type Serie = 'A' | 'C' | 'D';

export const SERIE_LABELS: Record<Serie, string> = {
  A: 'Série A (Lettres)',
  C: 'Série C (Maths-Physique)',
  D: 'Série D (Sciences)',
};

export function gradeRequiresSerie(grade: Grade): boolean {
  return grade === '1ere' || grade === 'terminale';
}

export function isLyceeGrade(grade: Grade): boolean {
  return LYCEE_GRADES.includes(grade);
}
