import { useState } from 'react';

import { useAuth } from '@/context/auth';

// Login is a Supabase auth call, not server data to cache — a plain hook
// with local state is the right tool here, not a query/mutation.
export function useLoginForm() {
  const { signIn, signUp, signInWithGoogle, signInWithApple } = useAuth();
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState<string | null>(null);
  const [submitting, setSubmitting] = useState(false);

  const run = async (action: () => Promise<{ error: string | null }>) => {
    setError(null);
    setSubmitting(true);
    const { error } = await action();
    setSubmitting(false);
    if (error) {
      setError(error);
      return { error };
    }
    return { error: null };
  };

  return {
    email,
    setEmail,
    password,
    setPassword,
    error,
    submitting,
    handleSignIn: () => run(() => signIn(email, password)),
    handleSignUp: () => run(() => signUp(email, password)),
    handleOAuth: (provider: 'google' | 'apple') =>
      run(() => (provider === 'google' ? signInWithGoogle() : signInWithApple())),
  };
}
