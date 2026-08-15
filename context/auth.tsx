import type { Session, User } from '@supabase/supabase-js';
import * as Linking from 'expo-linking';
import * as WebBrowser from 'expo-web-browser';
import { createContext, ReactNode, useContext, useEffect, useState } from 'react';

import { supabase } from '@/lib/supabase';

type OAuthProvider = 'google' | 'apple';

type AuthContextValue = {
  session: Session | null;
  user: User | null;
  loading: boolean;
  signIn: (email: string, password: string) => Promise<{ error: string | null }>;
  // needsConfirmation: true when the sign-up succeeded but GoTrue didn't
  // return a session — meaning "Confirm email" is on for this project and
  // the account can't sign in until the link in that email is clicked.
  signUp: (email: string, password: string, prenom: string) => Promise<{ error: string | null; needsConfirmation: boolean }>;
  resendConfirmationEmail: (email: string) => Promise<{ error: string | null }>;
  signInWithGoogle: () => Promise<{ error: string | null }>;
  signInWithApple: () => Promise<{ error: string | null }>;
  signOut: () => Promise<void>;
  // True right after an email/password or OAuth sign-in/sign-up actually
  // succeeds — never set by the cold-boot session restore, only by a user
  // action taken this app session. Lets the gate hold its loading screen
  // for a minimum duration on that specific transition, without also
  // delaying every ordinary app reopen (session restore) by the same
  // amount.
  justAuthenticated: boolean;
  clearJustAuthenticated: () => void;
};

const AuthContext = createContext<AuthContextValue | undefined>(undefined);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [session, setSession] = useState<Session | null>(null);
  const [loading, setLoading] = useState(true);
  const [justAuthenticated, setJustAuthenticated] = useState(false);

  useEffect(() => {
    supabase.auth.getSession().then(({ data }) => {
      setSession(data.session);
      setLoading(false);
    });

    const { data: listener } = supabase.auth.onAuthStateChange((_event, newSession) => {
      setSession(newSession);
    });

    return () => {
      listener.subscription.unsubscribe();
    };
  }, []);

  const signIn = async (email: string, password: string) => {
    const { error } = await supabase.auth.signInWithPassword({ email, password });
    if (!error) {
      setJustAuthenticated(true);
    }
    return { error: error?.message ?? null };
  };

  const signUp = async (email: string, password: string, prenom: string) => {
    const { data, error } = await supabase.auth.signUp({ email, password, options: { data: { prenom } } });
    if (error) {
      return { error: error.message, needsConfirmation: false };
    }
    if (data.session) {
      setJustAuthenticated(true);
    }
    return { error: null, needsConfirmation: !data.session };
  };

  const resendConfirmationEmail = async (email: string) => {
    const { error } = await supabase.auth.resend({ type: 'signup', email });
    return { error: error?.message ?? null };
  };

  const signInWithProvider = async (provider: OAuthProvider) => {
    const redirectTo = Linking.createURL('/auth/callback');

    const { data, error } = await supabase.auth.signInWithOAuth({
      provider,
      options: { redirectTo, skipBrowserRedirect: true },
    });
    if (error || !data?.url) {
      return { error: error?.message ?? 'Impossible de démarrer la connexion.' };
    }

    const result = await WebBrowser.openAuthSessionAsync(data.url, redirectTo);
    if (result.type !== 'success' || !result.url) {
      return { error: result.type === 'cancel' || result.type === 'dismiss' ? null : 'La connexion a échoué.' };
    }

    const code = new URL(result.url).searchParams.get('code');
    if (!code) {
      return { error: 'Réponse invalide du fournisseur de connexion.' };
    }

    const { error: exchangeError } = await supabase.auth.exchangeCodeForSession(code);
    if (!exchangeError) {
      setJustAuthenticated(true);
    }
    return { error: exchangeError?.message ?? null };
  };

  const signInWithGoogle = () => signInWithProvider('google');
  const signInWithApple = () => signInWithProvider('apple');

  const signOut = async () => {
    await supabase.auth.signOut();
    setJustAuthenticated(false);
  };

  return (
    <AuthContext.Provider
      value={{
        session,
        user: session?.user ?? null,
        loading,
        signIn,
        signUp,
        resendConfirmationEmail,
        signInWithGoogle,
        signInWithApple,
        signOut,
        justAuthenticated,
        clearJustAuthenticated: () => setJustAuthenticated(false),
      }}
    >
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
}
