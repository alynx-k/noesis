// Vérifie qu'une requête de webhook de paiement porte le secret attendu avant
// de faire confiance à son contenu (sans ça, n'importe qui qui devine l'URL du
// webhook peut se déclencher Premium gratuitement). Le secret est vérifié soit
// dans l'en-tête x-webhook-secret, soit dans le paramètre ?secret= de l'URL
// (utile pour les fournisseurs dont le tableau de bord ne permet pas d'ajouter
// un en-tête personnalisé à l'URL de callback enregistrée).
//
// Choix : un secret partagé plutôt qu'une vérification HMAC spécifique à
// chaque fournisseur, car aucun compte marchand réel n'est encore ouvert et
// les formats de signature (Wave-Signature, etc.) ne sont pas confirmables
// sans lui. Le secret partagé ferme la faille dès maintenant ; à remplacer
// par la vérification HMAC propre à chaque fournisseur une fois les comptes
// marchands actifs.
export function verifyWebhookSecret(req: Request, envVarName: string): boolean {
  const expected = Deno.env.get(envVarName);
  if (!expected) return false; // pas configuré = on ne fait jamais confiance par défaut

  const url = new URL(req.url);
  const provided = req.headers.get('x-webhook-secret') ?? url.searchParams.get('secret');
  if (!provided) return false;

  return timingSafeEqual(provided, expected);
}

function timingSafeEqual(a: string, b: string): boolean {
  if (a.length !== b.length) return false;
  let diff = 0;
  for (let i = 0; i < a.length; i++) {
    diff |= a.charCodeAt(i) ^ b.charCodeAt(i);
  }
  return diff === 0;
}
