export type ObjectiveId =
  | 'reussir_bepc_bac'
  | 'ameliorer_notes'
  | 'combler_lacunes'
  | 'prendre_avance'
  | 'reviser_regulierement';

export const OBJECTIVES: { id: ObjectiveId; label: string }[] = [
  { id: 'reussir_bepc_bac', label: 'Réussir le BEPC ou le BAC' },
  { id: 'ameliorer_notes', label: 'Améliorer mes notes' },
  { id: 'combler_lacunes', label: 'Combler mes lacunes' },
  { id: 'prendre_avance', label: "Prendre de l'avance sur le programme" },
  { id: 'reviser_regulierement', label: 'Prendre l\'habitude de réviser régulièrement' },
];
