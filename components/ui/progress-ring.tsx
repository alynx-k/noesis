import Svg, { Circle } from 'react-native-svg';

type ProgressRingProps = {
  progress: number; // 0-100
  size?: number;
  strokeWidth?: number;
  color: string;
  trackColor: string;
};

// Plain circular progress indicator (no animation) — used on Home's stats
// bar for "Progression globale". Deliberately simple: a track circle plus a
// second circle whose stroke-dasharray reveals only the completed fraction.
export function ProgressRing({ progress, size = 64, strokeWidth = 7, color, trackColor }: ProgressRingProps) {
  const radius = (size - strokeWidth) / 2;
  const circumference = 2 * Math.PI * radius;
  const clamped = Math.max(0, Math.min(100, progress));
  const dashOffset = circumference * (1 - clamped / 100);

  return (
    <Svg width={size} height={size} viewBox={`0 0 ${size} ${size}`}>
      <Circle cx={size / 2} cy={size / 2} r={radius} stroke={trackColor} strokeWidth={strokeWidth} fill="none" />
      <Circle
        cx={size / 2}
        cy={size / 2}
        r={radius}
        stroke={color}
        strokeWidth={strokeWidth}
        fill="none"
        strokeLinecap="round"
        strokeDasharray={`${circumference} ${circumference}`}
        strokeDashoffset={dashOffset}
        // Start at 12 o'clock instead of the SVG default (3 o'clock).
        rotation={-90}
        origin={`${size / 2}, ${size / 2}`}
      />
    </Svg>
  );
}
