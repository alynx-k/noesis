import { useEffect, useState } from 'react';
import { Image, StyleSheet, Text } from 'react-native';
import Animated, {
  Easing,
  runOnJS,
  useAnimatedStyle,
  useSharedValue,
  withDelay,
  withTiming,
} from 'react-native-reanimated';

// Matches the sampled background of assets/images/splash-logo.png exactly,
// so the square image blends into the screen with no visible edge.
const SPLASH_BACKGROUND = '#086753';

const ENTER_DURATION = 500;
const HOLD_DURATION = 1200;
const EXIT_DURATION = 450;

const LOGO_ASSET = require('../assets/images/splash-logo.png');

type AnimatedSplashProps = {
  onFinish: () => void;
};

// Standalone launch screen, shown briefly on cold start before whatever the
// app would normally show first (handled entirely by the root layout — see
// app/_layout.tsx). Deliberately self-contained: fixed brand colors, no
// theme/auth dependency, so it can't affect any other screen's logic.
export function AnimatedSplash({ onFinish }: AnimatedSplashProps) {
  const [imageReady, setImageReady] = useState(false);
  const logoOpacity = useSharedValue(0);
  const logoScale = useSharedValue(0.88);
  const overlayOpacity = useSharedValue(1);

  useEffect(() => {
    // The logo + "Noesis" text share one fade so they must appear together.
    // The image still decodes asynchronously though — starting the fade on
    // mount let the text (instant) show up a beat before the logo (still
    // loading). Waiting for onLoadEnd before animating fixes that race; the
    // image stays mounted-but-invisible (opacity 0) while it loads.
    if (!imageReady) {
      return;
    }

    logoOpacity.value = withTiming(1, { duration: ENTER_DURATION, easing: Easing.out(Easing.cubic) });
    logoScale.value = withTiming(1, { duration: ENTER_DURATION, easing: Easing.out(Easing.cubic) });

    overlayOpacity.value = withDelay(
      ENTER_DURATION + HOLD_DURATION,
      withTiming(0, { duration: EXIT_DURATION, easing: Easing.in(Easing.cubic) }, (finished) => {
        if (finished) {
          runOnJS(onFinish)();
        }
      }),
    );
  }, [imageReady, logoOpacity, logoScale, overlayOpacity, onFinish]);

  const logoStyle = useAnimatedStyle(() => ({
    opacity: logoOpacity.value,
    transform: [{ scale: logoScale.value }],
  }));

  const overlayStyle = useAnimatedStyle(() => ({
    opacity: overlayOpacity.value,
  }));

  return (
    <Animated.View style={[styles.overlay, overlayStyle]} pointerEvents="none">
      <Animated.View style={[styles.center, logoStyle]}>
        <Image
          source={LOGO_ASSET}
          style={styles.logo}
          resizeMode="contain"
          onLoadEnd={() => setImageReady(true)}
        />
        <Text style={styles.wordmark}>Noesis</Text>
      </Animated.View>
    </Animated.View>
  );
}

const styles = StyleSheet.create({
  overlay: {
    ...StyleSheet.absoluteFillObject,
    backgroundColor: SPLASH_BACKGROUND,
    alignItems: 'center',
    justifyContent: 'center',
    zIndex: 999,
  },
  center: {
    alignItems: 'center',
  },
  logo: {
    width: 220,
    height: 220,
  },
  wordmark: {
    marginTop: 16,
    fontSize: 22,
    fontWeight: '700',
    color: '#FFFFFF',
    letterSpacing: 0.5,
  },
});
