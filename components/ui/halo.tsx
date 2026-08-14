import { StyleProp, ViewStyle } from 'react-native';
import Svg, { Defs, RadialGradient, Rect, Stop } from 'react-native-svg';

type HaloProps = {
  color: string;
  size?: number;
  opacity?: number;
  style?: StyleProp<ViewStyle>;
};

// Soft ambient glow blob — the RN equivalent of the website's blurred
// hero-blob divs. A plain colored circle can't be softened by blurring (blur
// only affects edges, and a flat fill has none), so this uses an SVG radial
// gradient fading to transparent instead, which is what actually produces
// the glow look. Meant to sit absolutely positioned behind hero/header
// content, one or two per screen at most — an ambient signature, not a
// pattern to sprinkle everywhere.
export function Halo({ color, size = 280, opacity = 0.35, style }: HaloProps) {
  const gradientId = `halo-${color.replace('#', '')}`;

  return (
    <Svg
      width={size}
      height={size}
      viewBox="0 0 100 100"
      style={[{ width: size, height: size, opacity }, style]}
      pointerEvents="none">
      <Defs>
        <RadialGradient id={gradientId} cx="50%" cy="50%" r="50%">
          <Stop offset="0%" stopColor={color} stopOpacity={1} />
          <Stop offset="100%" stopColor={color} stopOpacity={0} />
        </RadialGradient>
      </Defs>
      <Rect x={0} y={0} width={100} height={100} fill={`url(#${gradientId})`} />
    </Svg>
  );
}
