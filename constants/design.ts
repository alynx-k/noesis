// Base (light) palette — also the fallback used by any file that hasn't
// been migrated to useThemeColors() yet (see hooks/use-theme-colors.ts).
// Keep LIGHT_COLORS and DARK_COLORS' keys in exact sync: every screen picks
// one or the other via that hook, so a missing key silently falls back to
// undefined in dark mode instead of erroring.
export const LIGHT_COLORS = {
  accent: '#6D5BD0',
  accentSoft: '#EFEBFC',
  accentText: '#FFFFFF',
  background: '#FAF8FC',
  surface: '#FFFFFF',
  border: '#ECEAF5',
  // Visibly darker than `border`, for interactive chips/inputs that need to
  // read as tappable against the pale lavender background (plain `border`
  // is too close to `background` for that).
  borderStrong: '#DAD6EC',
  text: '#1B2140',
  mutedText: '#6B7280',
  placeholderText: '#9AA1A9',
  locked: '#C7CBD1',
  lockedBackground: '#F4F3FA',
  danger: '#EF4444',
};

// Dark counterpart — same roles, same relative contrast (surface a touch
// lighter than background, borderStrong clearly lighter than border), just
// inverted. accent/danger are brightened slightly versus their light values
// since the light versions read as muddy on a near-black background.
export const DARK_COLORS: typeof LIGHT_COLORS = {
  accent: '#8B7AF0',
  accentSoft: '#241F42',
  accentText: '#FFFFFF',
  background: '#131226',
  surface: '#1C1A34',
  border: '#2A2748',
  borderStrong: '#3C3860',
  text: '#F1EFFB',
  mutedText: '#A8A4C7',
  placeholderText: '#736E99',
  locked: '#3C3860',
  lockedBackground: '#1F1D3A',
  danger: '#FF6B6B',
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
  badge: ['#FDBA74', '#FB923C'] as const,
  // Soft pastel lavender — the "Session focus" card background.
  hero: ['#E9E1FC', '#F3EEFD'] as const,
  // Soft pastel mint — the "Reprise rapide" card background.
  mint: ['#DFF4E7', '#EEF9F1'] as const,
  // Deep indigo night gradient for the full-screen focus-session view.
  night: ['#0B0A1A', '#1A1740', '#2E2A63'] as const,
  // Achievement tier skins (facile/moyen/difficile), for the profile's
  // achievements board — also the bottom 3 of the 8-tier league ladder
  // (see app/(tabs)/communaute.tsx), each tier visibly richer than the last.
  bronze: ['#D9A066', '#8C5A2B'] as const,
  silver: ['#E4E7EC', '#8B94A3'] as const,
  gold: ['#F6D97A', '#C9971F'] as const,
  // League tiers above gold — platinum/diamond/heroic/master escalate in
  // saturation and coolness, grandmaster is the one 3-stop, iridescent skin
  // (gold-pink-violet) so the very top of the ladder reads as genuinely
  // more special, not just a different flat color.
  platinum: ['#CFF3EA', '#3FAE93'] as const,
  diamond: ['#CFE3FF', '#3B6FE0'] as const,
  heroic: ['#FFD3B0', '#E85D2E'] as const,
  master: ['#DCC9FF', '#7C3AED'] as const,
  grandmaster: ['#FFE9A8', '#FF7AD9', '#7C3AED'] as const,
  // Flame gradient for the achievements card background.
  fire: ['#FFCB69', '#FF7A30', '#D6401D'] as const,
  // Soft pastel sky-blue — the "Discuter avec IA" and "Sessions
  // personnalisées" card background.
  cosmic: ['#DCE7FC', '#EEF3FE'] as const,
  // Medium-saturated duotone icon-badge fills for the three Home action
  // cards (Reprise rapide / Session focus / Discuter avec IA) — same
  // light-to-dark-same-hue formula as each discipline's badgeGradient.
  badgeMint: ['#1A9C7C', '#0D5C46'] as const,
  badgeViolet: ['#8B6FF0', '#6142C7'] as const,
  badgeAzure: ['#4F7DF0', '#2F58C7'] as const,
  // Soft three-stop lavender blend — the big timer card on the focus
  // session screen.
  focusTimerCard: ['#F5EEFB', '#E9E3FA', '#DDD6F7'] as const,
};

export const RADIUS = 20;
export const PILL_RADIUS = 999;

export const FEEDBACK_COLORS = {
  correct: '#22A55D',
  partial: '#F5893A',
  incorrect: '#EF4444',
};

// Semantic status colors — success/warning/info alongside the existing
// correct/partial/incorrect trio, for use outside exercise grading (form
// validation, toasts, error/empty states). Same value in light/dark: these
// are always paired with white text/icons like GRADIENTS, not text-on-background.
export const STATUS_COLORS = {
  success: '#22A55D',
  warning: '#F5893A',
  error: '#EF4444',
  info: '#3B82F6',
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

// The site's cubic-bezier(0.16,1,0.3,1) "ease" — a fast-out, gentle-settle
// curve, distinct from Reanimated's default easings. Stored as plain control
// points (not an Easing.bezier(...) call) so this file stays framework-free;
// screens do Easing.bezier(...MOTION.easeControlPoints).
export const MOTION_EASE_CONTROL_POINTS: readonly [number, number, number, number] = [0.16, 1, 0.3, 1];

// Ambient halo colors for soft background glows behind hero/header areas —
// same hues as the website's floating hero blobs, used at low opacity behind
// blurred circles rather than as flat fills.
export const HALO_COLORS = {
  violet: '#6D5BD0',
  gold: '#F6C6E0',
  teal: '#16A085',
} as const;

export const SPACING = {
  xs: 4,
  tight: 8,
  element: 16,
  section: 24,
  screen: 24,
};

// Every style here stays on the system sans-serif face (no fontFamily
// override) — largeTitle/title used to load a Cinzel serif display face
// from an earlier, abandoned redesign; that font never got a matching
// visual pass on the rest of the app, so headlines ended up looking
// mismatched against the plain-sans body/caption text everywhere else.
export const TYPOGRAPHY = {
  largeTitle: {
    fontSize: 28,
    lineHeight: 34,
    fontWeight: '700' as const,
    letterSpacing: 0.2,
  },
  title: {
    fontSize: 20,
    lineHeight: 26,
    fontWeight: '700' as const,
    letterSpacing: 0.1,
  },
  // Reserved for one hero moment per screen at most — matches the site's
  // hero-title accent span, not a general-purpose style.
  displayItalic: {
    fontStyle: 'italic' as const,
    fontSize: 20,
    lineHeight: 26,
    fontWeight: '700' as const,
    letterSpacing: 0.1,
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
