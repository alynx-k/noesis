// Ancrage du tuteur IA sur le contenu des cours (Phase 16/17) : découpe les
// leçons publiées en sections, les embed, et retrouve la section la plus
// proche d'une question donnée via recherche vectorielle (match_lesson_sections).
//
// La synchronisation est paresseuse : ensureLessonSectionsUpToDate() ne
// recalcule que les leçons dont le contenu a changé depuis le dernier
// découpage (comparaison de hash), pas l'intégralité du catalogue à chaque
// question.

import { embedText } from './embeddings.ts';

// Similarité cosinus en dessous de laquelle on considère qu'aucune leçon ne
// répond vraiment à la question — le tuteur IA répond alors sans ancrage
// plutôt que d'injecter un passage de cours hors sujet.
const MIN_SIMILARITY = 0.5;

type Section = { heading: string | null; content: string };

function splitIntoSections(contentMd: string): Section[] {
  const lines = contentMd.split('\n');
  const sections: Section[] = [];
  let heading: string | null = null;
  let buffer: string[] = [];

  function flush() {
    const content = buffer.join('\n').trim();
    if (content) sections.push({ heading, content });
    buffer = [];
  }

  for (const line of lines) {
    const trimmed = line.trim();
    if (trimmed.startsWith('## ') || trimmed.startsWith('### ')) {
      flush();
      heading = trimmed.replace(/^#{2,3}\s+/, '');
    } else {
      buffer.push(line);
    }
  }
  flush();

  return sections;
}

async function hashContent(text: string): Promise<string> {
  const digest = await crypto.subtle.digest('SHA-256', new TextEncoder().encode(text));
  return Array.from(new Uint8Array(digest))
    .map((b) => b.toString(16).padStart(2, '0'))
    .join('');
}

// deno-lint-ignore no-explicit-any
export async function ensureLessonSectionsUpToDate(adminClient: any, geminiApiKey: string, grade: string, serie: string | null) {
  const { data: lessons, error } = await adminClient
    .from('lessons')
    .select('id, content_md, serie')
    .eq('status', 'published')
    .eq('grade', grade)
    .or(serie ? `serie.is.null,serie.eq.${serie}` : 'serie.is.null');
  if (error) {
    console.error('ensureLessonSectionsUpToDate: échec de lecture des leçons', error);
    return;
  }
  if (!lessons) return;

  for (const lesson of lessons) {
    const currentHash = await hashContent(lesson.content_md);

    const { data: existing } = await adminClient
      .from('lesson_sections')
      .select('id, lesson_content_hash')
      .eq('lesson_id', lesson.id)
      .limit(1);

    const isUpToDate = existing && existing.length > 0 && existing[0].lesson_content_hash === currentHash;
    if (isUpToDate) continue;

    const sections = splitIntoSections(lesson.content_md);
    if (sections.length === 0) continue;

    await adminClient.from('lesson_sections').delete().eq('lesson_id', lesson.id);

    for (const section of sections) {
      const textToEmbed = section.heading ? `${section.heading}\n${section.content}` : section.content;
      const embedding = await embedText(geminiApiKey, textToEmbed);
      // Série propre à la leçon (peut être null = commune à toutes les
      // séries), jamais celle de l'élève qui déclenche l'indexation —
      // sinon une leçon partagée entre séries se retrouve verrouillée à
      // la première série qui l'a indexée.
      await adminClient.from('lesson_sections').insert({
        lesson_id: lesson.id,
        grade,
        serie: lesson.serie,
        heading: section.heading,
        content: section.content,
        embedding,
        lesson_content_hash: currentHash,
      });
    }
  }
}

export type GroundingResult = {
  lessonTitle: string;
  heading: string | null;
  content: string;
};

export async function retrieveGroundingSection(
  // deno-lint-ignore no-explicit-any
  adminClient: any,
  geminiApiKey: string,
  grade: string,
  serie: string | null,
  queryText: string
): Promise<GroundingResult | null> {
  await ensureLessonSectionsUpToDate(adminClient, geminiApiKey, grade, serie);

  const queryEmbedding = await embedText(geminiApiKey, queryText);

  const { data: matches, error } = await adminClient.rpc('match_lesson_sections', {
    p_query_embedding: queryEmbedding,
    p_grade: grade,
    p_serie: serie,
    p_match_count: 1,
  });
  if (error) {
    console.error('retrieveGroundingSection: échec de match_lesson_sections', error);
    return null;
  }
  if (!matches || matches.length === 0) return null;

  const best = matches[0];
  if (best.similarity < MIN_SIMILARITY) return null;

  const { data: lesson } = await adminClient.from('lessons').select('title').eq('id', best.lesson_id).single();

  return {
    lessonTitle: lesson?.title ?? 'Leçon',
    heading: best.heading,
    content: best.content,
  };
}
