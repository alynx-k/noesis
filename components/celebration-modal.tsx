import { Modal, StyleSheet, Text, View } from 'react-native';
import { Button } from './ui/Button';
import { palette, fonts, radius, spacing } from '../constants/theme';
import { TIER_COLORS, TIER_LABELS } from '../constants/leagues';
import type { PendingCelebration } from '../hooks/queries/use-celebrations';

type Props = {
  celebration: PendingCelebration | null;
  onDismiss: () => void;
  dismissing: boolean;
};

export function CelebrationModal({ celebration, onDismiss, dismissing }: Props) {
  if (!celebration) return null;

  const isLeague = celebration.event_type === 'league_promotion';
  const accentColor = isLeague && celebration.tier != null ? TIER_COLORS[celebration.tier] : palette.primary;
  const title = isLeague
    ? `Palier ${celebration.tier != null ? TIER_LABELS[celebration.tier] : ''} atteint !`
    : `Série de ${celebration.streak_days} jours !`;
  const body = isLeague
    ? "Tu as été promu dans ta ligue cette semaine. Continue sur ta lancée."
    : "Tu révises régulièrement depuis plusieurs jours d'affilée. Bravo pour ta constance.";

  return (
    <Modal visible transparent animationType="fade" statusBarTranslucent>
      <View style={styles.backdrop}>
        <View style={styles.card}>
          <View
            style={[styles.shape, { width: 70, height: 70, backgroundColor: accentColor, top: -20, left: -15, transform: [{ rotate: '18deg' }] }]}
          />
          <View
            style={[styles.shape, styles.circle, { width: 40, height: 40, backgroundColor: palette.primary, top: 16, right: 6, transform: [{ rotate: '-12deg' }] }]}
          />
          <View
            style={[styles.shape, { width: 30, height: 30, backgroundColor: palette.success, bottom: -8, left: '38%', transform: [{ rotate: '25deg' }] }]}
          />
          <View
            style={[styles.shape, { width: 50, height: 50, backgroundColor: TIER_COLORS[1], bottom: 10, right: -15, transform: [{ rotate: '8deg' }] }]}
          />
          <Text style={styles.title}>{title}</Text>
          <Text style={styles.body}>{body}</Text>
          <Button label="Continuer" onPress={onDismiss} loading={dismissing} style={styles.dismissButton} />
        </View>
      </View>
    </Modal>
  );
}

const styles = StyleSheet.create({
  backdrop: {
    flex: 1,
    backgroundColor: 'rgba(0,0,0,0.55)',
    alignItems: 'center',
    justifyContent: 'center',
    padding: spacing.lg,
  },
  card: {
    width: '100%',
    maxWidth: 380,
    overflow: 'hidden',
    borderRadius: radius.lg,
    backgroundColor: palette.secondary,
    padding: spacing['2xl'],
    alignItems: 'center',
  },
  shape: {
    position: 'absolute',
    borderRadius: 6,
    opacity: 0.85,
  },
  circle: {
    borderRadius: 9999,
  },
  title: {
    color: '#FFFFFF',
    fontFamily: fonts.display,
    fontSize: 24,
    textAlign: 'center',
    marginBottom: spacing.xs,
  },
  body: {
    color: '#C9CEDD',
    fontFamily: fonts.body,
    fontSize: 14,
    textAlign: 'center',
    marginBottom: spacing.lg,
  },
  dismissButton: {
    marginTop: spacing.sm,
    alignSelf: 'stretch',
  },
});
