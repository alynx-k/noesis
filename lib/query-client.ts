import { QueryClient } from '@tanstack/react-query';

// Curriculum content is immutable once generated (courses table is only ever
// written by the generate-course edge function), so it never needs a
// background refetch — everything else defaults to a short stale time so
// screens feel fresh without re-fetching on every focus.
export const DEFAULT_STALE_TIME = 30_000;
export const CONTENT_STALE_TIME = Infinity;

export const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: DEFAULT_STALE_TIME,
      retry: 2,
      networkMode: 'online',
    },
    mutations: {
      // A rejected mutation (grade an answer, complete a course) must never
      // silently retry and risk a duplicate write — surface the error once.
      retry: 0,
      networkMode: 'online',
    },
  },
});
