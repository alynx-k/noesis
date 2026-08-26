// Rough reading-time estimate (average adult silent-reading speed, ~200
// words/minute) — used to show real, content-derived minute counts on the
// course screen instead of a fabricated fixed duration.
export function estimateReadingMinutes(text: string): number {
  const wordCount = text.trim().split(/\s+/).filter(Boolean).length;
  return Math.max(1, Math.round(wordCount / 200));
}
