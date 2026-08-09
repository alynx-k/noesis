import Svg, { Circle, Defs, Ellipse, LinearGradient, Path, Stop } from 'react-native-svg';

type PlanetIconProps = {
  size?: number;
  baseColor: string;
  shadeColor: string;
  hasRing?: boolean;
  locked?: boolean;
};

// Reusable stylized "3D sticker" planet: gradient sphere (react-native-svg's
// own SVG-level gradient, not expo-linear-gradient, so it renders reliably
// regardless of the native-gradient issue seen elsewhere), a soft shaded
// crescent for depth, a specular highlight, and an optional Saturn-style
// ring drawn behind the sphere (its middle hidden by the circle drawn after
// it — the classic flat-icon trick for "ring behind planet").
export function PlanetIcon({ size = 64, baseColor, shadeColor, hasRing, locked }: PlanetIconProps) {
  const gradientId = `planet-${baseColor.replace('#', '')}`;
  const fill = locked ? '#C7CBD1' : `url(#${gradientId})`;
  const r = 20;
  const cx = 32;
  const cy = 32;
  const box = 64;

  return (
    <Svg width={size} height={size} viewBox={`0 0 ${box} ${box}`}>
      <Defs>
        <LinearGradient id={gradientId} x1="0.2" y1="0" x2="0.8" y2="1">
          <Stop offset="0" stopColor={baseColor} />
          <Stop offset="1" stopColor={shadeColor} />
        </LinearGradient>
      </Defs>

      {hasRing ? (
        <Ellipse
          cx={cx}
          cy={cy}
          rx={r * 1.6}
          ry={r * 0.4}
          stroke={locked ? '#C7CBD1' : shadeColor}
          strokeWidth={3}
          fill="none"
          opacity={0.9}
          transform={`rotate(-14 ${cx} ${cy})`}
        />
      ) : null}

      <Circle cx={cx} cy={cy} r={r} fill={fill} />

      {!locked ? (
        <>
          <Path
            d={`M ${cx - r * 0.3} ${cy - r} A ${r} ${r} 0 0 1 ${cx - r * 0.3} ${cy + r} A ${r * 0.85} ${r * 0.85} 0 0 0 ${cx - r * 0.3} ${cy - r} Z`}
            fill="#000000"
            opacity={0.14}
          />
          <Ellipse cx={cx - r * 0.35} cy={cy - r * 0.35} rx={r * 0.25} ry={r * 0.18} fill="#FFFFFF" opacity={0.35} />
        </>
      ) : (
        <Circle cx={cx} cy={cy} r={r} fill="none" stroke="#B4B8C0" strokeWidth={1.5} strokeDasharray="4 3" />
      )}
    </Svg>
  );
}
