'use client';

import { useState, type ReactNode } from 'react';
import Link from 'next/link';
import { useAuth } from '../lib/auth-context';

export function AuthGate({ children }: { children: ReactNode }) {
  const { session, isAdmin, isLoading, signIn, signOut } = useAuth();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState<string | null>(null);
  const [submitting, setSubmitting] = useState(false);

  if (isLoading) {
    return <div className="centered">Chargement…</div>;
  }

  if (!session || !isAdmin) {
    return (
      <div className="centered">
        <form
          className="login-card"
          onSubmit={async (e) => {
            e.preventDefault();
            setSubmitting(true);
            setError(null);
            const message = await signIn(email, password);
            setSubmitting(false);
            if (message) setError(message);
            else if (session && !isAdmin) setError('Ce compte n\'est pas autorisé (non-admin).');
          }}
        >
          <h1>Noesis — Admin</h1>
          <p className="muted">Relecture et publication du contenu de cours.</p>
          <input
            type="email"
            placeholder="Email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
          <input
            type="password"
            placeholder="Mot de passe"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
          {session && !isAdmin ? (
            <p className="error">Ce compte existe mais n&apos;a pas les droits admin.</p>
          ) : null}
          {error ? <p className="error">{error}</p> : null}
          <button type="submit" disabled={submitting}>
            {submitting ? 'Connexion…' : 'Se connecter'}
          </button>
        </form>
      </div>
    );
  }

  return (
    <div>
      <nav className="topnav">
        <Link href="/">Noesis Admin</Link>
        <button onClick={() => signOut()}>Se déconnecter</button>
      </nav>
      <main className="content">{children}</main>
    </div>
  );
}
