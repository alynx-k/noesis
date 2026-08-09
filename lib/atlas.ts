import { Destination, DESTINATIONS } from '@/constants/destinations';
import { getLaunches } from '@/lib/focus-session';

export type AtlasEntry = {
  destination: Destination;
  unlocked: boolean;
  reachedAt: Date | null;
  sessionsRemaining: number;
};

export type AtlasOverview = {
  entries: AtlasEntry[];
  totalSessions: number;
  unlockedCount: number;
};

export async function getAtlasOverview(): Promise<AtlasOverview> {
  const launches = await getLaunches();
  const totalSessions = launches.length;

  const entries: AtlasEntry[] = DESTINATIONS.map((destination) => {
    const unlocked = totalSessions >= destination.threshold;
    return {
      destination,
      unlocked,
      reachedAt: unlocked ? (launches[destination.threshold - 1]?.completedAt ?? null) : null,
      sessionsRemaining: unlocked ? 0 : destination.threshold - totalSessions,
    };
  });

  return { entries, totalSessions, unlockedCount: entries.filter((entry) => entry.unlocked).length };
}

// Which destination a launch with this sequence number (1-based, oldest
// first) actually reaches — the farthest destination unlocked so far, since
// sessions between two thresholds revisit the current frontier.
export function destinationForSequence(sequence: number): Destination {
  let current = DESTINATIONS[0];
  for (const destination of DESTINATIONS) {
    if (destination.threshold <= sequence) {
      current = destination;
    } else {
      break;
    }
  }
  return current;
}

// The destination is newly reached only on the exact launch whose sequence
// matches its threshold — every later launch just revisits it.
export function newlyUnlockedDestination(sequence: number): Destination | null {
  return DESTINATIONS.find((destination) => destination.threshold === sequence) ?? null;
}
