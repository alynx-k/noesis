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
