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

// Séries du lycée général ivoirien. Dès la 2nde, l'élève choisit une orientation
// (A ou C) ; le D n'apparaît qu'à partir de la 1ère (scission de la voie scientifique).
export type Serie = 'A' | 'C' | 'D';

export const SERIE_LABELS: Record<Serie, string> = {
  A: 'Série A (Lettres)',
  C: 'Série C (Maths-Physique)',
  D: 'Série D (Sciences)',
};

export function gradeRequiresSerie(grade: Grade): boolean {
  return grade === '2nde' || grade === '1ere' || grade === 'terminale';
}

export function seriesForGrade(grade: Grade): Serie[] {
  if (grade === '2nde') return ['A', 'C'];
  if (grade === '1ere' || grade === 'terminale') return ['A', 'C', 'D'];
  return [];
}

export function isLyceeGrade(grade: Grade): boolean {
  return LYCEE_GRADES.includes(grade);
}
