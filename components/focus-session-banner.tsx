import { useEffect, useRef, useState } from 'react';
import { Animated, Dimensions, PanResponder, Pressable, StyleSheet, Text } from 'react-native';
import { router, usePathname } from 'expo-router';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import { useFocusSession } from '../context/focus-session';
import { useAppTheme } from '../hooks/use-app-theme';
import { fonts, radius, spacing } from '../constants/theme';

const BADGE_SIZE = 56;

// Pastille flottante déplaçable/masquable, visible sur le reste de l'app
// pendant qu'une session de concentration tourne en arrière-plan (l'élève
// peut naviguer ailleurs pour faire une leçon/exercice sans perdre le
// minuteur), et quand elle vient de se terminer pour qu'il puisse revenir
// voir son résumé XP.
export function FocusSessionBanner() {
  const theme = useAppTheme();
  const insets = useSafeAreaInsets();
  const pathname = usePathname();
  const { phase, remainingMs } = useFocusSession();

  const [hidden, setHidden] = useState(false);
  const screen = Dimensions.get('window');
  const defaultPosition = useRef({
    x: screen.width - BADGE_SIZE - spacing.md,
    y: screen.height - BADGE_SIZE - insets.bottom - spacing.xl * 3,
  }).current;
  const pan = useRef(new Animated.ValueXY(defaultPosition)).current;
  const dragged = useRef(false);

  const panResponder = useRef(
    PanResponder.create({
      onMoveShouldSetPanResponder: (_e, gesture) => Math.abs(gesture.dx) > 4 || Math.abs(gesture.dy) > 4,
      onPanResponderGrant: () => {
        dragged.current = false;
        pan.setOffset({ x: (pan.x as unknown as { _value: number })._value, y: (pan.y as unknown as { _value: number })._value });
        pan.setValue({ x: 0, y: 0 });
      },
      onPanResponderMove: (_e, gesture) => {
        if (Math.abs(gesture.dx) > 4 || Math.abs(gesture.dy) > 4) dragged.current = true;
        Animated.event([null, { dx: pan.x, dy: pan.y }], { useNativeDriver: false })(_e, gesture);
      },
      onPanResponderRelease: () => {
        pan.flattenOffset();
      },
    })
  ).current;

  useEffect(() => {
    if (phase === 'running') setHidden(false);
  }, [phase]);

  if (phase === 'idle' || pathname === '/focus-session' || hidden) return null;

  const totalSeconds = Math.ceil(remainingMs / 1000);
  const mm = String(Math.floor(totalSeconds / 60)).padStart(2, '0');
  const ss = String(totalSeconds % 60).padStart(2, '0');

  return (
    <Animated.View
      style={[styles.wrapper, { transform: pan.getTranslateTransform() }]}
      {...panResponder.panHandlers}
    >
      <Pressable
        onPress={() => {
          if (!dragged.current) router.push('/focus-session');
        }}
        style={[styles.badge, { backgroundColor: theme.primary }]}
      >
        {phase === 'running' ? (
          <>
            <Text style={styles.emoji}>🎯</Text>
            <Text style={styles.time}>
              {mm}:{ss}
            </Text>
          </>
        ) : (
          <Text style={styles.emoji}>🎉</Text>
        )}
      </Pressable>
      <Pressable onPress={() => setHidden(true)} style={[styles.closeButton, { backgroundColor: theme.background, borderColor: theme.border }]}>
        <Text style={{ color: theme.textMuted, fontSize: 11, fontFamily: fonts.bodyBold }}>✕</Text>
      </Pressable>
    </Animated.View>
  );
}

const styles = StyleSheet.create({
  wrapper: {
    position: 'absolute',
    width: BADGE_SIZE,
    height: BADGE_SIZE,
  },
  badge: {
    width: BADGE_SIZE,
    height: BADGE_SIZE,
    borderRadius: BADGE_SIZE / 2,
    alignItems: 'center',
    justifyContent: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.25,
    shadowRadius: 6,
    elevation: 5,
  },
  emoji: { fontSize: 16 },
  time: { color: '#FFFFFF', fontFamily: fonts.dataBold, fontSize: 10 },
  closeButton: {
    position: 'absolute',
    top: -6,
    right: -6,
    width: 20,
    height: 20,
    borderRadius: 10,
    borderWidth: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
