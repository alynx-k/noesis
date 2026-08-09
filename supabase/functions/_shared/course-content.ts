// Both course content shapes stored in `courses.content` need to be
// flattened to plain text for AI grounding prompts (grade-answer,
// ai-tutor, and the homework-correction functions): the old flat
// `{ paragraphs }` shape produced by generate-course for not-yet-rewritten
// courses, and the richer `{ situation, sections, evaluation }` shape used
// by every hand-authored course (see lib/courses.ts's CourseContentV2).
// Returns null if `content` doesn't match either shape (e.g. still
// ungenerated).
export function flattenCourseContent(content: unknown): string | null {
  if (!content || typeof content !== 'object') {
    return null;
  }

  const flat = content as { paragraphs?: unknown };
  if (Array.isArray(flat.paragraphs) && flat.paragraphs.length > 0) {
    return flat.paragraphs.filter((p): p is string => typeof p === 'string').join('\n\n');
  }

  const rich = content as {
    situation?: { text?: unknown };
    sections?: unknown;
    evaluation?: { scenario?: unknown; questions?: unknown } | null;
  };

  if (!Array.isArray(rich.sections) || rich.sections.length === 0) {
    return null;
  }

  const parts: string[] = [];

  if (typeof rich.situation?.text === 'string') {
    parts.push(rich.situation.text);
  }

  for (const section of rich.sections) {
    if (!section || typeof section !== 'object') {
      continue;
    }
    const s = section as {
      heading?: unknown;
      body?: unknown;
      property?: { label?: unknown; text?: unknown } | null;
      example?: { statement?: unknown; solution?: unknown } | null;
      fixation?: { question?: unknown; solution?: unknown } | null;
      table?: { headers?: unknown; rows?: unknown } | null;
    };

    if (typeof s.heading === 'string') {
      parts.push(s.heading);
    }
    if (typeof s.body === 'string') {
      parts.push(s.body);
    }
    if (s.table && Array.isArray(s.table.rows)) {
      for (const row of s.table.rows) {
        if (Array.isArray(row)) {
          parts.push(row.filter((cell) => typeof cell === 'string').join(' — '));
        }
      }
    }
    if (s.property && typeof s.property.text === 'string') {
      parts.push(s.property.text);
    }
    if (s.example && typeof s.example.statement === 'string' && typeof s.example.solution === 'string') {
      parts.push(`${s.example.statement} ${s.example.solution}`);
    }
    if (s.fixation && typeof s.fixation.question === 'string' && typeof s.fixation.solution === 'string') {
      parts.push(`${s.fixation.question} ${s.fixation.solution}`);
    }
  }

  if (typeof rich.evaluation?.scenario === 'string') {
    parts.push(rich.evaluation.scenario);
  }
  if (Array.isArray(rich.evaluation?.questions)) {
    for (const q of rich.evaluation!.questions as unknown[]) {
      if (typeof q === 'string') {
        parts.push(q);
      }
    }
  }

  return parts.length > 0 ? parts.join('\n\n') : null;
}
