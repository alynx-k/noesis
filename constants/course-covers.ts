// Optional per-course cover images for the "Continuer à apprendre" card on
// app/subject/[disciplineId].tsx. There's no AI image-generation tool in
// this environment, so these start out empty — a course with no entry here
// just renders the vector LessonCoverBanner fallback instead of a photo.
//
// To add a real cover once an image is supplied for a lesson:
//   1. Drop the file in assets/images/course-covers/<courseId>.jpg
//   2. Add a line below: '<courseId>': require('@/assets/images/course-covers/<courseId>.jpg'),
import { ImageSourcePropType } from 'react-native';

export const COURSE_COVERS: Partial<Record<string, ImageSourcePropType>> = {};
