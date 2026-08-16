import { Discipline, DISCIPLINES } from '@/constants/disciplines';
import { CourseSummary, getCoursesForGrade } from '@/lib/courses';
import { getNextReviewDates } from '@/lib/spaced-repetition';
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

type AttemptRow = { course_id: string; error_type: string | null; verdict: string | null };

// One query for every course's attempts + one batched getNextReviewDates
// call, instead of loadEntry firing two round trips PER course (a 60-course
// grade meant ~120 requests). courses.length is nearly always well under
// Postgres's `.in()` practical limits, so this doesn't need its own
// chunking the way a truly large id list would.
function summarizeAttempts(rows: AttemptRow[]): { total: number; goodPercentage: number; errorCounts: Record<ErrorType, number> } {
  const errorCounts: Record<ErrorType, number> = { étourderie: 0, confusion: 0, méthode: 0 };
  let good = 0;
  for (const row of rows) {
    if (row.verdict === 'correct' || row.verdict === 'partial') {
      good += 1;
    }
    if (row.error_type && row.error_type in errorCounts) {
      errorCounts[row.error_type as ErrorType] += 1;
    }
  }
  const total = rows.length;
  return { total, goodPercentage: total > 0 ? Math.round((good / total) * 100) : 0, errorCounts };
}

// Groups every course for this grade under its discipline (same grouping
// and order as the home screen's "Mes matières" grid), so the history reads
// as one organized list per subject instead of one long flat list sorted
// only by performance.
export async function loadCourseHistory(grade: string, serie: string | null = null): Promise<CourseHistorySection[]> {
  const courses = await getCoursesForGrade(grade, serie);
  const courseIds = courses.map((course) => course.id);

  const [{ data: attemptRows, error: attemptsError }, nextReviewDates] = await Promise.all([
    courseIds.length > 0
      ? supabase.from('answer_attempts').select('course_id, error_type, verdict').in('course_id', courseIds)
      : Promise.resolve({ data: [] as AttemptRow[], error: null }),
    getNextReviewDates(courseIds),
  ]);

  if (attemptsError) {
    console.error('Failed to load course history attempts:', attemptsError);
  }

  const attemptsByCourse = new Map<string, AttemptRow[]>();
  for (const row of (attemptRows ?? []) as AttemptRow[]) {
    const existing = attemptsByCourse.get(row.course_id);
    if (existing) {
      existing.push(row);
    } else {
      attemptsByCourse.set(row.course_id, [row]);
    }
  }

  const entryByCourseId = new Map<string, CourseHistoryEntry>(
    courses.map((course) => {
      const summary = summarizeAttempts(attemptsByCourse.get(course.id) ?? []);
      return [
        course.id,
        { courseId: course.id, courseTitle: course.title, nextReviewDate: nextReviewDates[course.id] ?? null, ...summary },
      ];
    }),
  );

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
