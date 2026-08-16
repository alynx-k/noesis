import 'jsr:@supabase/functions-js/edge-runtime.d.ts';

// Wave requires HTTPS success_url/error_url — it cannot redirect straight to
// the app's `noesis://` scheme. This is the bridge: a tiny HTTPS page Wave's
// hosted checkout redirects to, which immediately hands off to the app via a
// JS redirect (the same technique Stripe/PayPal mobile checkouts use). The
// visible fallback link covers browsers that block the automatic redirect.
Deno.serve((req: Request) => {
  const url = new URL(req.url);
  const status = url.searchParams.get('status') === 'success' ? 'success' : 'error';
  const appUrl = `noesis://subscription?checkout=${status}`;
  const message =
    status === 'success' ? 'Paiement reçu — retour à Noesis...' : 'Paiement annulé ou refusé — retour à Noesis...';

  const html = `<!doctype html>
<html lang="fr">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Noesis</title>
<meta http-equiv="refresh" content="0;url=${appUrl}" />
<style>
  body { font-family: -apple-system, sans-serif; background: #0F6E56; color: #fff; display: flex;
         align-items: center; justify-content: center; min-height: 100vh; margin: 0; text-align: center; padding: 24px; }
  a { color: #fff; }
</style>
</head>
<body>
  <div>
    <p>${message}</p>
    <p><a href="${appUrl}">Retourner à Noesis</a></p>
  </div>
  <script>window.location.replace(${JSON.stringify(appUrl)});</script>
</body>
</html>`;

  return new Response(html, { headers: { 'Content-Type': 'text/html; charset=utf-8' } });
});
