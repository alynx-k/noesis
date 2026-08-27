import { createContext, ReactNode, useContext, useEffect, useState } from 'react';

import { toast } from '@/components/ui/toast';
import { useAuth } from '@/context/auth';
import { cancelTodayNotifications } from '@/lib/notification-scheduler';
import { recordActivity } from '@/lib/streak';
import { supabase } from '@/lib/supabase';

type ProgressContextValue = {
  completedCourseIds: string[];
  loading: boolean;
  completeCourse: (id: string) => Promise<void>;
};

const ProgressContext = createContext<ProgressContextValue | undefined>(undefined);

export function ProgressProvider({ children }: { children: ReactNode }) {
  const { user } = useAuth();
  const [completedCourseIds, setCompletedCourseIds] = useState<string[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!user) {
      setCompletedCourseIds([]);
      setLoading(false);
      return;
    }

    let cancelled = false;

    // Right after sign-in, the just-minted JWT's `iat` can be a hair ahead
    // of PostgREST's own clock (skew between Supabase's own services, not
    // the device's) — it rejects with PGRST303 "JWT issued at future" for
    // what's really just a race, not a real auth failure. Retrying after a
    // short pause lets PostgREST's clock catch up instead of surfacing a
    // scary error for something that resolves itself in ~1-2 seconds.
    async function loadWithRetry(attempt = 0): Promise<void> {
      const { data, error } = await supabase.from('course_progress').select('course_id').eq('completed', true);

      if (cancelled) {
        return;
      }

      if (error) {
        if (error.code === 'PGRST303' && attempt < 3) {
          setTimeout(() => loadWithRetry(attempt + 1), 1500);
          return;
        }
        console.error('Failed to load course progress from Supabase:', error);
      } else if (data) {
        setCompletedCourseIds(data.map((row) => row.course_id));
      }
      setLoading(false);
    }

    setLoading(true);
    loadWithRetry();

    return () => {
      cancelled = true;
    };
  }, [user]);

  const completeCourse = async (id: string) => {
    if (!user) {
      return;
    }

    const wasAlreadyCompleted = completedCourseIds.includes(id);
    setCompletedCourseIds((previous) => (previous.includes(id) ? previous : [...previous, id]));

    const { error } = await supabase
      .from('course_progress')
      .upsert({ user_id: user.id, course_id: id, completed: true, completed_at: new Date().toISOString() });

    if (error) {
      console.error('Failed to save course progress to Supabase:', error);
      // Roll back the optimistic update — otherwise the completion
      // badge/celebration stays visible until the next full reload
      // silently makes it disappear, reading as "you lost your progress"
      // with no explanation for why.
      if (!wasAlreadyCompleted) {
        setCompletedCourseIds((previous) => previous.filter((completedId) => completedId !== id));
      }
      toast.show('Impossible d’enregistrer ta progression, réessaie.', { variant: 'error' });
    } else {
      recordActivity();
      cancelTodayNotifications(user.id);
    }
  };

  return (
    <ProgressContext.Provider value={{ completedCourseIds, loading, completeCourse }}>
      {children}
    </ProgressContext.Provider>
  );
}

export function useProgress() {
  const context = useContext(ProgressContext);
  if (!context) {
    throw new Error('useProgress must be used within a ProgressProvider');
  }
  return context;
}
