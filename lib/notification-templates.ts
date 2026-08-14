// Copy bank for local/push notifications — Duolingo-style passive-aggressive,
// theatrical guilt trips rather than neutral reminders. Pure data + string
// formatting: scheduling (lib/notifications.ts) picks a category based on
// the trigger (time of day, streak loss, a personalized moment) and calls
// getRandomFormattedNotification to get the actual body text.

export type NotificationCategory = 'A' | 'B' | 'C' | 'D' | 'E' | 'F';

export type NotificationTemplate = {
  id: string;
  category: NotificationCategory;
  text: string;
};

export type NotificationVariables = {
  prenom?: string;
  streak?: number | string;
  jours_inactif?: number | string;
  matiere?: string;
};

// Reference only — A (dramatic/personalized) and F (streak loss) are
// triggered by events, not a clock, so they have no hour range.
export const CATEGORY_INFO: Record<NotificationCategory, { label: string; hours: [number, number] | null }> = {
  A: { label: 'Dramatique & Personnalisé', hours: null },
  B: { label: 'Matin', hours: [8, 12] },
  C: { label: 'Après-midi', hours: [12, 18] },
  D: { label: 'Début de soirée', hours: [18, 21] },
  E: { label: 'Urgence', hours: [21, 24] },
  F: { label: 'Perte de série / abandon 48h', hours: null },
};

// Picks the time-of-day category for an hour (0-23). B/C/D/E only — A and F
// are event-triggered (see CATEGORY_INFO), never picked by the clock alone.
export function getCategoryForHour(hour: number): NotificationCategory {
  if (hour >= 8 && hour < 12) return 'B';
  if (hour >= 12 && hour < 18) return 'C';
  if (hour >= 18 && hour < 21) return 'D';
  return 'E';
}

export const NOTIFICATION_TEMPLATES: NotificationTemplate[] = [
  // ---------------------------------------------------------------------
  // CATEGORY_A — Dramatique & Personnalisé (15)
  // ---------------------------------------------------------------------
  { id: 'A1', category: 'A', text: 'On doit parler, {prenom}. Toi, moi, et cette série de {streak} jours que tu es en train d’oublier.' },
  { id: 'A2', category: 'A', text: 'J’ai relu nos échanges, {prenom}. C’était beau, avant.' },
  { id: 'A3', category: 'A', text: '{prenom}. Assieds-toi. J’ai quelque chose à te dire sur ta série de {streak} jours.' },
  { id: 'A4', category: 'A', text: 'Ça va, {prenom} ? Tu n’as pas donné de nouvelles. Ni à moi, ni à {matiere}.' },
  { id: 'A5', category: 'A', text: 'Je ne suis pas fâché, {prenom}. Juste... déçu. Beaucoup déçu.' },
  { id: 'A6', category: 'A', text: '{streak} jours de série, construits un par un. Et toi, tu regardes ailleurs.' },
  { id: 'A7', category: 'A', text: '{prenom}, si tu m’abandonnes, dis-le-moi en face. Pas en silence.' },
  { id: 'A8', category: 'A', text: 'J’ai gardé ta place, {prenom}. Tout est resté exactement comme tu l’as laissé.' },
  { id: 'A9', category: 'A', text: 'On y était presque, {prenom}. {streak} jours. Et puis plus rien.' },
  { id: 'A10', category: 'A', text: 'Je ne vais pas insister. Je vais juste... attendre. Ici. Seul. Avec ta série de {streak} jours.' },
  { id: 'A11', category: 'A', text: '{prenom}, dis-moi que ce n’est qu’une pause, et pas un adieu.' },
  { id: 'A12', category: 'A', text: 'Tu te souviens de moi, {prenom} ? On révisait {matiere} ensemble, avant.' },
  { id: 'A13', category: 'A', text: 'J’ai relu ton historique cette nuit, {prenom}. Je n’ai pas très bien dormi.' },
  { id: 'A14', category: 'A', text: '{prenom}, chaque jour sans toi, ta série de {streak} jours s’éteint un peu plus.' },
  { id: 'A15', category: 'A', text: 'Ce n’est pas un reproche, {prenom}. C’est juste que {streak} jours, ça ne se remplace pas.' },

  // ---------------------------------------------------------------------
  // CATEGORY_B — Matin 08h-12h (20)
  // ---------------------------------------------------------------------
  { id: 'B1', category: 'B', text: 'Bonjour {prenom}. Le café peut attendre. Pas {matiere}.' },
  { id: 'B2', category: 'B', text: 'Il est 8h. Tes révisions de {matiere}, elles, sont réveillées depuis longtemps.' },
  { id: 'B3', category: 'B', text: '{prenom}, un bon matin commence par 5 minutes de {matiere}. Ou pas. C’est toi qui vois.' },
  { id: 'B4', category: 'B', text: 'Debout, {prenom} ! Ta série de {streak} jours n’attend que toi.' },
  { id: 'B5', category: 'B', text: 'Le soleil se lève, {prenom}. Ta série de {streak} jours attend de voir si tu vas la sauver aujourd’hui.' },
  { id: 'B6', category: 'B', text: 'Matinée productive en vue ? {matiere} t’attend, {prenom}.' },
  { id: 'B7', category: 'B', text: '{prenom}, tu as bien dormi ? Tant mieux. {matiere}, elle, n’a pas dormi du tout, elle t’attendait.' },
  { id: 'B8', category: 'B', text: 'Petit-déjeuner : fait. Révisions de {matiere} : toujours pas. On y va, {prenom} ?' },
  { id: 'B9', category: 'B', text: '8h du matin, {prenom}. L’heure parfaite pour ne pas décevoir ta série de {streak} jours.' },
  { id: 'B10', category: 'B', text: 'Je sais, il est tôt. Mais {matiere} ne va pas se réviser toute seule, {prenom}.' },
  { id: 'B11', category: 'B', text: '{prenom}, cinq minutes de {matiere} avant de partir, et je ne dis plus rien de la journée. Promis.' },
  { id: 'B12', category: 'B', text: 'Le matin, c’est sacré pour la mémoire, {prenom}. Ne gâche pas ça.' },
  { id: 'B13', category: 'B', text: 'Ta série de {streak} jours a bien dormi. Elle compte sur toi pour continuer aujourd’hui.' },
  { id: 'B14', category: 'B', text: '{prenom}, une bonne matinée commence rarement en m’ignorant.' },
  { id: 'B15', category: 'B', text: 'Il fait beau, {prenom}. Encore plus beau après 10 minutes de {matiere}.' },
  { id: 'B16', category: 'B', text: 'Objectif du matin : ouvrir l’appli. Objectif bonus : réviser {matiere}. À toi de jouer, {prenom}.' },
  { id: 'B17', category: 'B', text: '{prenom}, ta série de {streak} jours te dit bonjour. Elle attend une réponse.' },
  { id: 'B18', category: 'B', text: 'Avant les cours, {matiere} a besoin de dix minutes de toi, {prenom}.' },
  { id: 'B19', category: 'B', text: 'Debout tôt, {prenom} ? Alors {matiere} n’a plus aucune excuse.' },
  { id: 'B20', category: 'B', text: 'Un bon départ en {matiere} ce matin, et ta journée entière sera plus légère, {prenom}.' },

  // ---------------------------------------------------------------------
  // CATEGORY_C — Après-midi 12h-18h (20)
  // ---------------------------------------------------------------------
  { id: 'C1', category: 'C', text: '{prenom}, la pause déjeuner est finie. {matiere} t’attend pour la suite.' },
  { id: 'C2', category: 'C', text: 'L’après-midi est parfait pour rattraper {matiere}, {prenom}. Personne ne le saura. Sauf moi.' },
  { id: 'C3', category: 'C', text: '{prenom}, entre midi et le goûter, il y a de la place pour {matiere}.' },
  { id: 'C4', category: 'C', text: 'Ta série de {streak} jours n’a pas bougé depuis ce matin, {prenom}. C’est louche.' },
  { id: 'C5', category: 'C', text: '{prenom}, tu as sûrement dix minutes entre deux activités. {matiere} en a besoin.' },
  { id: 'C6', category: 'C', text: 'L’après-midi traîne, {prenom}. {matiere} aussi, si tu ne t’y mets pas.' },
  { id: 'C7', category: 'C', text: 'Petit rappel : {matiere} existe toujours, {prenom}. Elle attend patiemment.' },
  { id: 'C8', category: 'C', text: '{prenom}, ta série de {streak} jours regarde l’horloge avec toi.' },
  { id: 'C9', category: 'C', text: 'Encore un peu de temps libre, {prenom} ? {matiere} adorerait le récupérer.' },
  { id: 'C10', category: 'C', text: 'Ce n’est pas urgent, {prenom}. Juste {matiere}, qui attend patiemment depuis ce matin.' },
  { id: 'C11', category: 'C', text: '{prenom}, l’après-midi est jeune. Ta série de {streak} jours, elle, vieillit vite.' },
  { id: 'C12', category: 'C', text: 'Une révision de {matiere} maintenant t’évitera une panique ce soir, {prenom}.' },
  { id: 'C13', category: 'C', text: '{prenom}, je ne veux pas te presser. Mais {matiere} n’a personne d’autre que toi.' },
  { id: 'C14', category: 'C', text: 'Tu fais une pause, {prenom} ? {matiere} en profite pour te faire un signe.' },
  { id: 'C15', category: 'C', text: '{prenom}, il est encore temps de sauver ta série de {streak} jours aujourd’hui.' },
  { id: 'C16', category: 'C', text: 'L’après-midi, c’est le meilleur moment pour {matiere}, selon des études que je viens d’inventer.' },
  { id: 'C17', category: 'C', text: '{prenom}, {matiere} n’a pas bougé depuis ce matin. Toi non plus, apparemment.' },
  { id: 'C18', category: 'C', text: 'On fait 10 minutes de {matiere}, {prenom} ? Juste pour voir ta tête se rallumer.' },
  { id: 'C19', category: 'C', text: '{prenom}, ta série de {streak} jours te fixe depuis l’écran de l’appli.' },
  { id: 'C20', category: 'C', text: 'Il reste des heures avant le soir, {prenom}. {matiere} pourrait en profiter.' },

  // ---------------------------------------------------------------------
  // CATEGORY_D — Début de soirée 18h-21h (20)
  // ---------------------------------------------------------------------
  { id: 'D1', category: 'D', text: '{prenom}, la journée touche à sa fin. Ta série de {streak} jours aussi, si tu ne fais rien.' },
  { id: 'D2', category: 'D', text: '18h, {prenom}. C’est l’heure où {matiere} commence à s’inquiéter.' },
  { id: 'D3', category: 'D', text: '{prenom}, il reste quelques heures avant que ta série de {streak} jours ne devienne un souvenir.' },
  { id: 'D4', category: 'D', text: 'Le dîner peut attendre 10 minutes, {prenom}. {matiere}, elle, attend depuis ce matin.' },
  { id: 'D5', category: 'D', text: '{prenom}, la soirée commence. Ta série de {streak} jours retient son souffle.' },
  { id: 'D6', category: 'D', text: 'Encore un peu de temps avant que la journée se referme, {prenom}. Utilise-le pour {matiere}.' },
  { id: 'D7', category: 'D', text: '{prenom}, j’ai vérifié : tu n’as pas encore ouvert {matiere} aujourd’hui. On corrige ça ?' },
  { id: 'D8', category: 'D', text: 'Le soir tombe, {prenom}. Ta série de {streak} jours devient nerveuse.' },
  { id: 'D9', category: 'D', text: '{prenom}, une petite session de {matiere} avant le dîner, et la soirée sera tranquille.' },
  { id: 'D10', category: 'D', text: 'Il est 18h passé, {prenom}. {matiere} commence à se sentir un peu abandonnée.' },
  { id: 'D11', category: 'D', text: '{prenom}, ta série de {streak} jours te regarde avec de grands yeux inquiets.' },
  { id: 'D12', category: 'D', text: 'Avant que la soirée ne t’avale, {prenom}, dix minutes de {matiere} s’imposent.' },
  { id: 'D13', category: 'D', text: '{prenom}, il te reste quelques heures. Ta série de {streak} jours en a besoin de dix minutes.' },
  { id: 'D14', category: 'D', text: 'Ce n’est pas encore la panique, {prenom}. Mais {matiere} commence à regarder l’heure.' },
  { id: 'D15', category: 'D', text: '{prenom}, la journée se termine bientôt. Ta série de {streak} jours aimerait un geste.' },
  { id: 'D16', category: 'D', text: 'Après le dîner, il sera plus tard, {prenom}. {matiere} préférerait maintenant.' },
  { id: 'D17', category: 'D', text: '{prenom}, ta série de {streak} jours a survécu à pire. Mais elle aimerait un signe de vie.' },
  { id: 'D18', category: 'D', text: '18h-21h, {prenom} : la dernière fenêtre confortable pour {matiere}. Après, ça devient dramatique.' },
  { id: 'D19', category: 'D', text: '{prenom}, je ne panique pas encore. Je te préviens juste, calmement, que le temps file.' },
  { id: 'D20', category: 'D', text: 'Ta série de {streak} jours t’envoie ce message via moi, {prenom} : « reviens, s’il te plaît ».' },

  // ---------------------------------------------------------------------
  // CATEGORY_E — Urgence 21h-23h59 (15)
  // ---------------------------------------------------------------------
  { id: 'E1', category: 'E', text: '{prenom}. IL EST TARD. Ta série de {streak} jours agonise en silence.' },
  { id: 'E2', category: 'E', text: 'Minuit approche, {prenom}. Ta série de {streak} jours aussi, mais dans l’autre sens.' },
  { id: 'E3', category: 'E', text: '{prenom}, c’est le moment ou jamais. Littéralement. {matiere} t’attend pour la dernière fois aujourd’hui.' },
  { id: 'E4', category: 'E', text: 'URGENT : {prenom}, ta série de {streak} jours a moins de 3 heures à vivre.' },
  { id: 'E5', category: 'E', text: '{prenom}, je ne veux pas être dramatique. Trop tard. Ta série de {streak} jours se meurt.' },
  { id: 'E6', category: 'E', text: 'Dernière ligne droite, {prenom}. {matiere}, 5 minutes, et tout est sauvé.' },
  { id: 'E7', category: 'E', text: '{prenom}, il est tard, je sais. Mais ta série de {streak} jours ne connaît pas l’heure, elle.' },
  { id: 'E8', category: 'E', text: 'Le compte à rebours a commencé, {prenom}. Ta série de {streak} jours te fixe.' },
  { id: 'E9', category: 'E', text: '{prenom}, avant de dormir, une dernière pensée pour {matiere} ?' },
  { id: 'E10', category: 'E', text: 'Ce serait dommage de perdre {streak} jours pour 5 minutes non données, {prenom}.' },
  { id: 'E11', category: 'E', text: '{prenom}, il reste peu de temps. Ta série de {streak} jours retient son souffle jusqu’à minuit.' },
  { id: 'E12', category: 'E', text: '23h passées, {prenom}. Ta série de {streak} jours joue sa survie maintenant.' },
  { id: 'E13', category: 'E', text: '{prenom}, ne t’endors pas encore. {matiere} et ta série de {streak} jours ont besoin de toi.' },
  { id: 'E14', category: 'E', text: 'Dernier avertissement, {prenom} : après minuit, ta série de {streak} jours ne sera plus qu’un souvenir.' },
  { id: 'E15', category: 'E', text: '{prenom}, il est presque minuit. Une dernière chance de sauver {streak} jours d’efforts.' },

  // ---------------------------------------------------------------------
  // CATEGORY_F — Perte de Streak / Abandon 48h (10)
  // ---------------------------------------------------------------------
  { id: 'F1', category: 'F', text: '{prenom}, ça fait {jours_inactif} jours. Ta série est partie. Je ne dis pas ça pour te blesser. Si, un peu.' },
  { id: 'F2', category: 'F', text: '{jours_inactif} jours sans nouvelles, {prenom}. Ta série de {streak} jours n’a pas survécu.' },
  { id: 'F3', category: 'F', text: '{prenom}, je t’ai attendu {jours_inactif} jours. Ta série, elle, n’a pas eu cette patience.' },
  { id: 'F4', category: 'F', text: 'C’est fini, {prenom}. Ta série est tombée à zéro après {jours_inactif} jours de silence.' },
  { id: 'F5', category: 'F', text: '{prenom}, {jours_inactif} jours. On ne va pas se mentir, ça fait mal de le dire.' },
  { id: 'F6', category: 'F', text: 'Ta série est morte, {prenom}. {jours_inactif} jours d’absence, ça laisse des traces.' },
  { id: 'F7', category: 'F', text: '{prenom}, ça fait {jours_inactif} jours. {matiere} commence sérieusement à s’interroger sur toi.' },
  { id: 'F8', category: 'F', text: 'Je ne vais pas faire semblant, {prenom} : {jours_inactif} jours d’absence, c’est long pour moi aussi.' },
  { id: 'F9', category: 'F', text: '{prenom}, après {jours_inactif} jours, je me demandais si tu existais encore. Rassure-moi.' },
  { id: 'F10', category: 'F', text: 'Ta série est un souvenir maintenant, {prenom}. Mais on peut en recommencer une, si tu reviens.' },
];

const TEMPLATES_BY_ID = new Map(NOTIFICATION_TEMPLATES.map((template) => [template.id, template]));

const TEMPLATES_BY_CATEGORY: Record<NotificationCategory, NotificationTemplate[]> = {
  A: [],
  B: [],
  C: [],
  D: [],
  E: [],
  F: [],
};
for (const template of NOTIFICATION_TEMPLATES) {
  TEMPLATES_BY_CATEGORY[template.category].push(template);
}

const DEFAULT_VARIABLES: Required<NotificationVariables> = {
  prenom: 'champion',
  streak: 0,
  jours_inactif: 0,
  matiere: 'tes cours',
};

// Replaces {prenom}, {streak}, {jours_inactif}, {matiere} with real values,
// falling back to a generic placeholder for whichever ones the caller
// doesn't have on hand (e.g. no matière selected yet).
export function formatNotification(templateId: string, data: NotificationVariables = {}): string {
  const template = TEMPLATES_BY_ID.get(templateId);
  if (!template) {
    throw new Error(`Notification template introuvable : "${templateId}"`);
  }

  const variables = { ...DEFAULT_VARIABLES, ...data };

  return template.text
    .replace(/\{prenom\}/g, String(variables.prenom))
    .replace(/\{streak\}/g, String(variables.streak))
    .replace(/\{jours_inactif\}/g, String(variables.jours_inactif))
    .replace(/\{matiere\}/g, String(variables.matiere));
}

// Picks a random template from a category, avoiding an immediate repeat of
// the last one served from that same category (per app session — this is
// in-memory, not persisted).
const lastShownIdByCategory = new Map<NotificationCategory, string>();

export function getRandomTemplate(category: NotificationCategory): NotificationTemplate {
  const pool = TEMPLATES_BY_CATEGORY[category];
  if (!pool || pool.length === 0) {
    throw new Error(`Catégorie de notification inconnue : "${category}"`);
  }

  if (pool.length === 1) {
    return pool[0];
  }

  const lastId = lastShownIdByCategory.get(category);
  let pick = pool[Math.floor(Math.random() * pool.length)];
  while (pick.id === lastId) {
    pick = pool[Math.floor(Math.random() * pool.length)];
  }
  lastShownIdByCategory.set(category, pick.id);
  return pick;
}

// Convenience wrapper for the common case: pick a random template for the
// category, then format it in one call.
export function getRandomFormattedNotification(category: NotificationCategory, data: NotificationVariables = {}): string {
  const template = getRandomTemplate(category);
  return formatNotification(template.id, data);
}
