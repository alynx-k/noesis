import 'jsr:@supabase/functions-js/edge-runtime.d.ts';
import { createClient } from 'jsr:@supabase/supabase-js@2';

const ANTHROPIC_API_KEY = Deno.env.get('ANTHROPIC_API_KEY');
const SUPABASE_URL = Deno.env.get('SUPABASE_URL')!;
const SUPABASE_ANON_KEY = Deno.env.get('SUPABASE_ANON_KEY')!;

const MAX_IMAGES = 5;

const PROMPT = `Tu es un outil automatisé qui ne produit QUE du JSON, jamais de texte conversationnel, jamais de question, jamais de phrase d'introduction ou de conclusion — quoi qu'il arrive, même si l'image est illisible, vide, floue ou ne contient aucun contenu exploitable.

Tu reçois une ou plusieurs photos de notes de cours ou d'un document (page de manuel, cours manuscrit, etc.), destinées à un(e) élève ivoirien(ne) du secondaire. À partir du contenu visible sur ces photos, tu dois produire DEUX choses : une fiche de révision écrite et structurée, et des cartes mémos question/réponse.

Réponds UNIQUEMENT avec un objet JSON valide, sans balises markdown, sans texte avant ou après, exactement au format :
{
  "title": "Titre court résumant le contenu (5 mots maximum)",
  "cards": [
    { "question": "...", "answer": "..." }
  ],
  "fiche": {
    "chapters": [
      {
        "title": "Chap. 1 — ...",
        "intro": "Une ou deux phrases d'introduction du chapitre.",
        "sections": [
          {
            "heading": "1. Titre de la sous-partie",
            "body": "Paragraphe explicatif rédigé en phrases complètes.",
            "highlights": ["terme clé exact tel qu'il apparaît dans body", "autre terme clé"],
            "table": { "headers": ["Colonne A", "Colonne B"], "rows": [["...", "..."]] },
            "callout": "Paraphrase courte à retenir pour l'examen, ou null"
          }
        ]
      }
    ]
  }
}

Règles :
- Entre 5 et 15 cartes mémos selon la densité du contenu visible. Question courte et précise, réponse concise (1 à 3 phrases maximum).
- La fiche a entre 1 et 4 chapitres, chacun avec 1 à 4 sous-parties ("sections").
- Chaque "heading" est court (moins de 8 mots). Chaque "body" fait 2 à 5 phrases.
- "highlights" liste les termes/expressions clés qui apparaissent MOT POUR MOT dans le texte de "body" correspondant (2 à 4 termes par section) — jamais un terme absent du texte.
- "table" est optionnel : mets un objet {headers, rows} UNIQUEMENT quand le contenu se prête naturellement à un tableau (dates, comparaisons, classifications), sinon mets null.
- "callout" est optionnel : sur environ une section sur deux, mets une reformulation courte et mémorisable à retenir pour l'examen ; sinon mets null. Ne mets jamais null pour "highlights", utilise un tableau vide [] si aucun terme ne se distingue.
- Utilise uniquement le contenu visible sur les photos, n'invente rien.
- Si l'image est illisible, vide, ou ne contient pas de contenu exploitable, réponds quand même avec ce JSON exact, sans rien demander de plus : {"title": "Image illisible", "cards": [], "fiche": { "chapters": [] }}`;

type ImageInput = {
  base64: string;
  mediaType: string;
};

type FicheTable = { headers: string[]; rows: string[][] };
type FicheSection = {
  heading: string;
  body: string;
  highlights: string[];
  table: FicheTable | null;
  callout: string | null;
};
type FicheChapter = { title: string; intro: string; sections: FicheSection[] };
type Fiche = { chapters: FicheChapter[] };

function sanitizeFiche(input: unknown): Fiche | null {
  if (!input || typeof input !== 'object' || !Array.isArray((input as { chapters?: unknown }).chapters)) {
    return null;
  }

  const chapters: FicheChapter[] = [];
  for (const rawChapter of (input as { chapters: unknown[] }).chapters) {
    if (!rawChapter || typeof rawChapter !== 'object') {
      continue;
    }
    const chapter = rawChapter as Record<string, unknown>;
    const rawSections = Array.isArray(chapter.sections) ? chapter.sections : [];

    const sections: FicheSection[] = [];
    for (const rawSection of rawSections) {
      if (!rawSection || typeof rawSection !== 'object') {
        continue;
      }
      const section = rawSection as Record<string, unknown>;
      if (typeof section.heading !== 'string' || typeof section.body !== 'string') {
        continue;
      }

      let table: FicheTable | null = null;
      if (section.table && typeof section.table === 'object') {
        const rawTable = section.table as Record<string, unknown>;
        if (Array.isArray(rawTable.headers) && Array.isArray(rawTable.rows)) {
          table = {
            headers: rawTable.headers.filter((h): h is string => typeof h === 'string'),
            rows: rawTable.rows
              .filter((row): row is unknown[] => Array.isArray(row))
              .map((row) => row.filter((cell): cell is string => typeof cell === 'string')),
          };
        }
      }

      sections.push({
        heading: section.heading,
        body: section.body,
        highlights: Array.isArray(section.highlights)
          ? section.highlights.filter((h): h is string => typeof h === 'string')
          : [],
        table,
        callout: typeof section.callout === 'string' ? section.callout : null,
      });
    }

    if (typeof chapter.title === 'string' && sections.length > 0) {
      chapters.push({
        title: chapter.title,
        intro: typeof chapter.intro === 'string' ? chapter.intro : '',
        sections,
      });
    }
  }

  return { chapters };
}

function parseDataUrl(value: string): ImageInput | null {
  const match = value.match(/^data:(image\/[a-zA-Z+]+);base64,(.+)$/);
  if (match) {
    return { mediaType: match[1], base64: match[2] };
  }
  // Bare base64 without a data URL prefix: assume JPEG.
  if (/^[A-Za-z0-9+/=]+$/.test(value.slice(0, 100))) {
    return { mediaType: 'image/jpeg', base64: value };
  }
  return null;
}

Deno.serve(async (req: Request) => {
  if (req.method !== 'POST') {
    return new Response(JSON.stringify({ error: 'Method not allowed' }), {
      status: 405,
      headers: { 'Content-Type': 'application/json' },
    });
  }

  try {
    const { images } = await req.json();

    if (!Array.isArray(images) || images.length === 0 || images.length > MAX_IMAGES) {
      return new Response(JSON.stringify({ error: 'Invalid request' }), {
        status: 400,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const parsedImages = images.map((image) => (typeof image === 'string' ? parseDataUrl(image) : null));
    if (parsedImages.some((image) => image === null)) {
      return new Response(JSON.stringify({ error: 'Invalid image data' }), {
        status: 400,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const authHeader = req.headers.get('Authorization') ?? '';
    const supabaseClient = createClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
      global: { headers: { Authorization: authHeader } },
    });

    const {
      data: { user },
      error: userError,
    } = await supabaseClient.auth.getUser();

    if (userError || !user) {
      return new Response(JSON.stringify({ error: 'Unauthorized' }), {
        status: 401,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const content = [
      ...(parsedImages as ImageInput[]).map((image) => ({
        type: 'image',
        source: { type: 'base64', media_type: image.mediaType, data: image.base64 },
      })),
      { type: 'text', text: PROMPT },
    ];

    const anthropicResponse = await fetch('https://api.anthropic.com/v1/messages', {
      method: 'POST',
      headers: {
        'content-type': 'application/json',
        'x-api-key': ANTHROPIC_API_KEY ?? '',
        'anthropic-version': '2023-06-01',
      },
      body: JSON.stringify({
        model: 'claude-sonnet-5',
        max_tokens: 4000,
        messages: [{ role: 'user', content }],
      }),
    });

    if (!anthropicResponse.ok) {
      const errorBody = await anthropicResponse.text();
      console.error('Anthropic API error:', anthropicResponse.status, errorBody);
      return new Response(JSON.stringify({ error: 'Anthropic API error' }), {
        status: 502,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const data = await anthropicResponse.json();
    // content[0] isn't reliably the text block — the model sometimes emits a
    // leading `thinking` block first, which has no `.text`.
    const textBlock = Array.isArray(data?.content) ? data.content.find((block: { type?: string }) => block.type === 'text') : undefined;
    const rawText = textBlock?.text ?? '';

    let parsed: {
      title?: string;
      cards?: { question: string; answer: string }[];
      fiche?: { chapters?: unknown[] };
    };
    try {
      const jsonMatch = rawText.match(/\{[\s\S]*\}/);
      parsed = JSON.parse(jsonMatch ? jsonMatch[0] : rawText);
    } catch (parseError) {
      console.error('Failed to parse model output:', parseError, rawText);
      return new Response(JSON.stringify({ error: 'Generation failed' }), {
        status: 502,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const cards = Array.isArray(parsed.cards) ? parsed.cards.filter((card) => card?.question && card?.answer) : [];
    const fiche = sanitizeFiche(parsed.fiche);

    if (cards.length === 0 && (!fiche || fiche.chapters.length === 0)) {
      return new Response(JSON.stringify({ error: 'No readable content found' }), {
        status: 422,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const title = typeof parsed.title === 'string' && parsed.title.trim() ? parsed.title.trim() : 'Fiche scannée';

    const { data: deck, error: deckError } = await supabaseClient
      .from('flashcard_decks')
      .insert({ user_id: user.id, title, fiche })
      .select('id')
      .single();

    if (deckError || !deck) {
      console.error('Failed to create deck:', deckError);
      return new Response(JSON.stringify({ error: 'Failed to save deck' }), {
        status: 500,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    const { error: cardsError } =
      cards.length > 0
        ? await supabaseClient.from('flashcards').insert(
            cards.map((card) => ({
              deck_id: deck.id,
              user_id: user.id,
              question: card.question,
              answer: card.answer,
            })),
          )
        : { error: null };

    if (cardsError) {
      console.error('Failed to save flashcards:', cardsError);
      return new Response(JSON.stringify({ error: 'Failed to save flashcards' }), {
        status: 500,
        headers: { 'Content-Type': 'application/json' },
      });
    }

    return new Response(JSON.stringify({ deckId: deck.id, title, cardCount: cards.length }), {
      headers: { 'Content-Type': 'application/json' },
    });
  } catch (error) {
    console.error('generate-flashcards error:', error);
    return new Response(JSON.stringify({ error: 'Internal error' }), {
      status: 500,
      headers: { 'Content-Type': 'application/json' },
    });
  }
});
