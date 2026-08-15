import { useState } from 'react';

import { useAuth } from '@/context/auth';
import { AuthErrorField, translateAuthError } from '@/lib/auth-errors';

export type AuthMode = 'signin' | 'signup';

export type AuthFieldErrors = Partial<Record<AuthErrorField, string>>;

// Login is a Supabase auth call, not server data to cache — a plain hook
// with local state is the right tool here, not a query/mutation.
export function useLoginForm() {
  const { signIn, signUp, signInWithGoogle, signInWithApple } = useAuth();
  const [mode, setModeState] = useState<AuthMode>('signin');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [prenom, setPrenom] = useState('');
  const [errors, setErrors] = useState<AuthFieldErrors>({});
  const [submitting, setSubmitting] = useState(false);

  // Switching tabs clears whatever error was showing on the other one —
  // stale errors from a different mode/field set would just be confusing.
  const setMode = (next: AuthMode) => {
    setErrors({});
    setModeState(next);
  };

  const applyResult = (error: string | null) => {
    if (!error) {
      setErrors({});
      return;
    }
    const translated = translateAuthError(error);
    setErrors({ [translated.field]: translated.message });
  };

  const handleSignIn = async () => {
    const fieldErrors: AuthFieldErrors = {};
    if (!email.trim()) fieldErrors.email = 'Indique ton adresse e-mail.';
    if (!password) fieldErrors.password = 'Indique ton mot de passe.';
    if (Object.keys(fieldErrors).length > 0) {
      setErrors(fieldErrors);
      return;
    }

    setErrors({});
    setSubmitting(true);
    const { error } = await signIn(email, password);
    setSubmitting(false);
    applyResult(error);
  };

  const handleSignUp = async () => {
    const fieldErrors: AuthFieldErrors = {};
    if (!prenom.trim()) fieldErrors.prenom = 'Indique ton prénom.';
    if (!email.trim()) fieldErrors.email = 'Indique ton adresse e-mail.';
    if (!password) fieldErrors.password = 'Indique un mot de passe.';
    if (Object.keys(fieldErrors).length > 0) {
      setErrors(fieldErrors);
      return;
    }

    setErrors({});
    setSubmitting(true);
    const { error } = await signUp(email, password, prenom.trim());
    setSubmitting(false);
    applyResult(error);
  };

  const handleOAuth = async (provider: 'google' | 'apple') => {
    setErrors({});
    const { error } = await (provider === 'google' ? signInWithGoogle() : signInWithApple());
    if (error) {
      applyResult(error);
    }
    return { error };
  };

  return {
    mode,
    setMode,
    email,
    setEmail,
    password,
    setPassword,
    prenom,
    setPrenom,
    errors,
    submitting,
    handleSignIn,
    handleSignUp,
    handleOAuth,
  };
}
