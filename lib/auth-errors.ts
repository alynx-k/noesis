export type AuthErrorField = 'prenom' | 'email' | 'password' | 'general';

export type TranslatedAuthError = {
  field: AuthErrorField;
  message: string;
};

// Supabase Auth (GoTrue) error messages come back in English with no
// localization option — this maps the ones users can actually hit here
// (email/password sign-in and sign-up) to French, and to the field the
// message is about so the UI can show it under that field instead of as a
// generic banner. Matched by keyword rather than exact string, since GoTrue
// phrasing varies slightly by version/context.
const TRANSLATIONS: { match: RegExp; field: AuthErrorField; message: string }[] = [
  { match: /missing email or phone/i, field: 'email', message: 'Veuillez saisir votre adresse e-mail.' },
  { match: /unable to validate email address|invalid email/i, field: 'email', message: 'Adresse e-mail invalide.' },
  { match: /email not confirmed/i, field: 'email', message: "Confirme ton adresse e-mail avant de te connecter." },
  { match: /user already registered|already been registered/i, field: 'email', message: 'Un compte existe déjà avec cette adresse e-mail.' },
  { match: /invalid login credentials/i, field: 'password', message: 'E-mail ou mot de passe incorrect.' },
  { match: /missing password|password is required/i, field: 'password', message: 'Veuillez saisir un mot de passe.' },
  { match: /password should be at least|password.*too short/i, field: 'password', message: 'Le mot de passe doit contenir au moins 6 caractères.' },
  { match: /rate limit|too many requests/i, field: 'general', message: 'Trop de tentatives. Réessaie dans quelques minutes.' },
  { match: /network/i, field: 'general', message: 'Problème de connexion. Vérifie ton réseau et réessaie.' },
];

export function translateAuthError(rawMessage: string): TranslatedAuthError {
  for (const entry of TRANSLATIONS) {
    if (entry.match.test(rawMessage)) {
      return { field: entry.field, message: entry.message };
    }
  }
  return { field: 'general', message: 'Une erreur est survenue. Réessaie.' };
}
