import { LinearGradient } from 'expo-linear-gradient';
import { Image, StyleSheet, View } from 'react-native';

import { IconSymbol, IconSymbolName } from '@/components/ui/icon-symbol';
import { COURSE_COVERS } from '@/constants/course-covers';

type LessonCoverBannerProps = {
  courseId: string;
  icon: IconSymbolName;
  cardGradient: readonly [string, string];
  badgeGradient: readonly [string, string];
};

// Real photo/illustration when one has been supplied for this lesson (see
// constants/course-covers.ts); otherwise a generated vector banner in the
// discipline's own colors — there's no image-generation tool available here,
// so this fallback is the honest default rather than a fake placeholder photo.
export function LessonCoverBanner({ courseId, icon, cardGradient, badgeGradient }: LessonCoverBannerProps) {
  const cover = COURSE_COVERS[courseId];

  if (cover) {
    return <Image source={cover} style={styles.image} resizeMode="cover" />;
  }

  return (
    <LinearGradient
      colors={cardGradient}
      start={{ x: 0, y: 0 }}
      end={{ x: 1, y: 1 }}
      style={[styles.image, styles.fallback, { backgroundColor: cardGradient[0] }]}>
      <View style={styles.glow} />
      <LinearGradient colors={badgeGradient} style={[styles.iconBadge, { backgroundColor: badgeGradient[0] }]}>
        <IconSymbol name={icon} size={26} color="#FFFFFF" />
      </LinearGradient>
    </LinearGradient>
  );
}

const styles = StyleSheet.create({
  image: {
    width: 96,
    height: 96,
    borderRadius: 16,
  },
  fallback: {
    alignItems: 'center',
    justifyContent: 'center',
    overflow: 'hidden',
  },
  glow: {
    position: 'absolute',
    width: 130,
    height: 130,
    borderRadius: 65,
    backgroundColor: 'rgba(255,255,255,0.25)',
    top: -40,
    right: -40,
  },
  iconBadge: {
    width: 44,
    height: 44,
    borderRadius: 14,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
