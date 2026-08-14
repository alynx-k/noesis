import { Discipline, DISCIPLINES } from '@/constants/disciplines';
import { CourseSummary, getCoursesForGrade } from '@/lib/courses';
import { getNextReviewDate, getNextReviewDates } from '@/lib/spaced-repetition';
import { supabase } from '@/lib/supabase';

export type NextUpCourse = {
  courseId: string;
  courseTitle: string;
  dueDate: Date;
};

// Lightweight version of loadCourseHistory below, for the Home screen's
// "reprise rapide" card — that one fetches answer_attempts per course (2
// round trips per course, fine for the dedicated history screen, much too
// heavy for a homepage widget), this only needs the single nearest due date.
export async function getNextUpCourse(grade: string, serie: string | null = null): Promise<NextUpCourse | null> {
  const courses = await getCoursesForGrade(grade, serie);
  const dates = await getNextReviewDates(courses.map((course) => course.id));

  let nextUp: NextUpCourse | null = null;
  for (const course of courses) {
    const due = dates[course.id];
    if (due && (!nextUp || due < nextUp.dueDate)) {
      nextUp = { courseId: course.id, courseTitle: course.title, dueDate: due };
    }
  }
  return nextUp;
}

export type ErrorType = 'étourderie' | 'confusion' | 'méthode';

export type CourseHistoryEntry = {
  courseId: string;
  courseTitle: string;
  total: number;
  goodPercentage: number;
  errorCounts: Record<ErrorType, number>;
  nextReviewDate: Date | null;
};

export type CourseHistorySection = {
  discipline: Discipline;
  courses: CourseHistoryEntry[];
};

async function loadEntry(course: CourseSummary): Promise<CourseHistoryEntry> {
  const [{ data, error }, nextReviewDate] = await Promise.all([
    supabase.from('answer_attempts').select('error_type, verdict').eq('course_id', course.id),
    getNextReviewDate(course.id),
  ]);

  const errorCounts: Record<ErrorType, number> = { étourderie: 0, confusion: 0, méthode: 0 };
  let good = 0;

  if (error) {
    console.error('Failed to load course history entry:', error);
  } else {
    for (const row of data ?? []) {
      if (row.verdict === 'correct' || row.verdict === 'partial') {
        good += 1;
      }
      if (row.error_type && row.error_type in errorCounts) {
        errorCounts[row.error_type as ErrorType] += 1;
      }
    }
  }

  const total = data?.length ?? 0;
  const goodPercentage = total > 0 ? Math.round((good / total) * 100) : 0;

  return { courseId: course.id, courseTitle: course.title, total, goodPercentage, errorCounts, nextReviewDate };
}

// Groups every course for this grade under its discipline (same grouping
// and order as the home screen's "Mes matières" grid), so the history reads
// as one organized list per subject instead of one long flat list sorted
// only by performance.
export async function loadCourseHistory(grade: string, serie: string | null = null): Promise<CourseHistorySection[]> {
  const courses = await getCoursesForGrade(grade, serie);
  const entries = await Promise.all(courses.map(loadEntry));
  const entryByCourseId = new Map(entries.map((entry) => [entry.courseId, entry]));

  const sections: CourseHistorySection[] = [];
  for (const discipline of DISCIPLINES) {
    const disciplineCourses = courses
      .filter((course) => discipline.subjects.includes(course.subject))
      .map((course) => entryByCourseId.get(course.id))
      .filter((entry): entry is CourseHistoryEntry => entry !== undefined);

    if (disciplineCourses.length > 0) {
      sections.push({ discipline, courses: disciplineCourses });
    }
  }
  return sections;
}
