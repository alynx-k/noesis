import { ScrollViewStyleReset } from 'expo-router/html';

// Browser auto-translate (Chrome's "Translate this page") rewrites text
// nodes behind React's back, which crashes the app with a hard-to-diagnose
// "Failed to execute 'removeChild' — not a child of this node" the next
// time React tries to update anything in that subtree. `translate="no"` +
// the `google` meta tag ask Chrome not to auto-translate the app at all.
export default function Root({ children }: { children: React.ReactNode }) {
  return (
    <html lang="fr" translate="no">
      <head>
        <meta charSet="utf-8" />
        <meta httpEquiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="google" content="notranslate" />
        <ScrollViewStyleReset />
      </head>
      <body>{children}</body>
    </html>
  );
}
