// Base (light) palette — also the fallback used by any file that hasn't
// been migrated to useThemeColors() yet (see hooks/use-theme-colors.ts).
// Keep LIGHT_COLORS and DARK_COLORS' keys in exact sync: every screen picks
// one or the other via that hook, so a missing key silently falls back to
// undefined in dark mode instead of erroring.
export const LIGHT_COLORS = {
  accent: '#0F6E56',
  accentSoft: '#E3F1EC',
  accentText: '#FFFFFF',
  background: '#F3F1EA',
  surface: '#FFFFFF',
  border: '#EDEEF0',
  // Visibly darker than `border`, for interactive chips/inputs that need to
  // read as tappable against the cream background (plain `border` is too
  // close to `background` for that).
  borderStrong: '#D9D4C4',
  gridLine: '#E4E1D6',
  text: '#14181B',
  mutedText: '#6B7280',
  placeholderText: '#9AA1A9',
  locked: '#C7CBD1',
  lockedBackground: '#F4F5F6',
  danger: '#B3261E',
};

// Dark counterpart — same roles, same relative contrast (surface a touch
// lighter than background, borderStrong clearly lighter than border), just
// inverted. accent/danger are brightened slightly versus their light values
// since the light versions read as muddy on a near-black background.
export const DARK_COLORS: typeof LIGHT_COLORS = {
  accent: '#22B58C',
  accentSoft: '#163A31',
  accentText: '#FFFFFF',
  background: '#17181C',
  surface: '#1E2025',
  border: '#2A2C31',
  borderStrong: '#3D3F46',
  gridLine: '#232530',
  text: '#F1F2F4',
  mutedText: '#9BA1AC',
  placeholderText: '#6E7480',
  locked: '#4A4D55',
  lockedBackground: '#20222A',
  danger: '#FF6B60',
};

// Kept for any file not yet migrated to useThemeColors() — always the light
// palette, so those screens just don't react to the OS theme until migrated.
export const COLORS = LIGHT_COLORS;

// Parkeur-style decorative gradients (avatars, badges, streak pill,
// premium/hero surfaces) — deliberately distinct from COLORS.accent, which
// stays the single functional color for buttons, links and states. These
// are self-contained colorful surfaces (always paired with white text/icons
// on top), not text-on-background, so unlike COLORS they stay the same in
// light and dark mode — inverting them would fight their own design intent.
export const GRADIENTS = {
  rainbow: ['#B9A6FF', '#FFD98A', '#93E7B0'] as const,
  badge: ['#C9B8FF', '#8F7BF0'] as const,
  hero: ['#7C6FE0', '#F2C879', '#8FE3A8'] as const,
  // Purple night-sky gradient for the full-screen focus-session view.
  night: ['#0B0F2B', '#1C1650', '#3A2E7A'] as const,
  // Achievement tier skins (facile/moyen/difficile), for the profile's
  // achievements board.
  bronze: ['#D9A066', '#8C5A2B'] as const,
  silver: ['#E4E7EC', '#8B94A3'] as const,
  gold: ['#F6D97A', '#C9971F'] as const,
  // Flame gradient for the achievements card background.
  fire: ['#FFCB69', '#FF7A30', '#D6401D'] as const,
  // Deep-space gradient for the "fusées lancées" card background.
  cosmic: ['#1C1650', '#4B3F94', '#7C6FE0'] as const,
};

export const RADIUS = 14;
export const PILL_RADIUS = 999;

export const FEEDBACK_COLORS = {
  correct: '#2E7D32',
  partial: '#ED6C02',
  incorrect: '#B3261E',
};

// Semantic status colors — success/warning/info alongside the existing
// correct/partial/incorrect trio, for use outside exercise grading (form
// validation, toasts, error/empty states). Same value in light/dark: these
// are always paired with white text/icons like GRADIENTS, not text-on-background.
export const STATUS_COLORS = {
  success: '#2E7D32',
  warning: '#ED6C02',
  error: '#B3261E',
  info: '#2F6FED',
};

// Cross-platform shadow scale for the few places that need real depth
// (modals, floating bars, toasts) rather than the app's default hairline
// border. Most surfaces should keep using cardBorder(colors), not this.
export const ELEVATION = {
  sm: {
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.08,
    shadowRadius: 6,
    elevation: 2,
  },
  md: {
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 6 },
    shadowOpacity: 0.12,
    shadowRadius: 14,
    elevation: 5,
  },
  lg: {
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 12 },
    shadowOpacity: 0.16,
    shadowRadius: 24,
    elevation: 10,
  },
};

// Named intensities for expo-blur's <BlurView intensity>, so glass surfaces
// (tab bar, toasts, modals) stay consistent instead of each picking its own number.
export const BLUR = {
  subtle: 40,
  standard: 80,
  heavy: 100,
};

// Named durations (ms) and easing curves for Reanimated timing/springs, so
// motion feels like one system instead of every component picking its own numbers.
export const MOTION = {
  duration: {
    fast: 150,
    base: 250,
    slow: 400,
  },
  spring: {
    snappy: { damping: 16, stiffness: 420 },
    gentle: { damping: 18, stiffness: 220 },
  },
};

export const Z_INDEX = {
  tabBar: 10,
  toast: 100,
  modal: 200,
};

export const SPACING = {
  xs: 4,
  tight: 8,
  element: 16,
  section: 24,
  screen: 24,
};

export const TYPOGRAPHY = {
  largeTitle: {
    fontSize: 28,
    lineHeight: 34,
    fontWeight: '800' as const,
    letterSpacing: -0.3,
  },
  title: {
    fontSize: 22,
    lineHeight: 28,
    fontWeight: '700' as const,
  },
  label: {
    fontSize: 13,
    fontWeight: '700' as const,
    letterSpacing: 0.4,
  },
  body: {
    fontSize: 16,
    lineHeight: 24,
  },
  caption: {
    fontSize: 13,
    lineHeight: 18,
  },
};

// Thin borders, not heavy shadows: cards separate from the background with a
// hairline-adjacent 1px border rather than elevation/shadow. Kept for
// unmigrated files — migrated ones should use cardBorder(colors) from
// hooks/use-theme-colors.ts instead, so the border color reacts to theme.
export const CARD_BORDER = {
  borderWidth: 1,
  borderColor: COLORS.border,
};
