import { StyleSheet, View } from 'react-native';
import Svg, { Circle, Line, Path, Text as SvgText } from 'react-native-svg';

import { CourseDiagram } from '@/lib/courses';
import { useThemeColors } from '@/hooks/use-theme-colors';

type GeometryDiagramProps = {
  diagram: CourseDiagram;
};

// Renders geometric figures from a plain points/segments description drawn
// fresh for this app — never a reproduction of a source textbook's image.
// Generic enough to cover any lesson's figure (Thalès, right triangles,
// vectors, etc.), not tied to one specific course.
const RIGHT_ANGLE_SIZE = 10;

export function GeometryDiagram({ diagram }: GeometryDiagramProps) {
  const COLORS = useThemeColors();
  const [width, height] = diagram.viewBox;

  const styles = StyleSheet.create({
    wrapper: {
      alignItems: 'center',
      justifyContent: 'center',
      paddingVertical: 8,
    },
  });

  const pointAt = (index: number) => diagram.points[index];

  return (
    <View style={styles.wrapper}>
      <Svg width={width} height={height} viewBox={`0 0 ${width} ${height}`}>
        {diagram.circle ? (
          <Circle
            cx={diagram.circle.cx}
            cy={diagram.circle.cy}
            r={diagram.circle.r}
            stroke={COLORS.mutedText}
            strokeWidth={1.5}
            fill="none"
          />
        ) : null}

        {diagram.dashedSegments?.map(([fromIndex, toIndex], index) => {
          const from = pointAt(fromIndex);
          const to = pointAt(toIndex);
          return (
            <Line
              key={`dashed-${index}`}
              x1={from.x}
              y1={from.y}
              x2={to.x}
              y2={to.y}
              stroke={COLORS.mutedText}
              strokeWidth={1.5}
              strokeDasharray="4,4"
            />
          );
        })}

        {diagram.segments.map(([fromIndex, toIndex], index) => {
          const from = pointAt(fromIndex);
          const to = pointAt(toIndex);
          return (
            <Line
              key={`segment-${index}`}
              x1={from.x}
              y1={from.y}
              x2={to.x}
              y2={to.y}
              stroke={COLORS.accent}
              strokeWidth={2}
            />
          );
        })}

        {diagram.rightAngleAt?.map((pointIndex) => {
          const point = pointAt(pointIndex);
          return (
            <Path
              key={`right-angle-${pointIndex}`}
              d={`M ${point.x} ${point.y - RIGHT_ANGLE_SIZE} L ${point.x + RIGHT_ANGLE_SIZE} ${point.y - RIGHT_ANGLE_SIZE} L ${point.x + RIGHT_ANGLE_SIZE} ${point.y}`}
              stroke={COLORS.mutedText}
              strokeWidth={1.5}
              fill="none"
            />
          );
        })}

        {diagram.points.map((point, index) => (
          <Circle key={`point-${index}`} cx={point.x} cy={point.y} r={3} fill={COLORS.text} />
        ))}

        {diagram.points.map(
          (point, index) =>
            point.label ? (
              <SvgText
                key={`label-${index}`}
                x={point.x + 8}
                y={point.y - 8}
                fontSize={14}
                fontWeight="700"
                fill={COLORS.text}>
                {point.label}
              </SvgText>
            ) : null,
        )}
      </Svg>
    </View>
  );
}
