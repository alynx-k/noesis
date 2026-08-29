import type { ReactNode } from 'react';
import type { Metadata } from 'next';
import { AuthProvider } from '../lib/auth-context';
import { AuthGate } from '../components/auth-gate';
import './globals.css';

export const metadata: Metadata = {
  title: 'Noesis — Admin',
  description: 'Relecture et publication du contenu de cours Noesis.',
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="fr">
      <body>
        <AuthProvider>
          <AuthGate>{children}</AuthGate>
        </AuthProvider>
      </body>
    </html>
  );
}
