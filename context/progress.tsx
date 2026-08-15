import { createContext, ReactNode, useContext, useEffect, useState } from 'react';

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

    setLoading(true);
    supabase
      .from('course_progress')
      .select('course_id')
      .eq('completed', true)
      .then(({ data, error }) => {
        if (error) {
          console.error('Failed to load course progress from Supabase:', error);
        } else if (data) {
          setCompletedCourseIds(data.map((row) => row.course_id));
        }
        setLoading(false);
      });
  }, [user]);

  const completeCourse = async (id: string) => {
    if (!user) {
      return;
    }

    setCompletedCourseIds((previous) => (previous.includes(id) ? previous : [...previous, id]));

    const { error } = await supabase
      .from('course_progress')
      .upsert({ user_id: user.id, course_id: id, completed: true, completed_at: new Date().toISOString() });

    if (error) {
      console.error('Failed to save course progress to Supabase:', error);
    } else {
      recordActivity();
      cancelTodayNotifications();
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
