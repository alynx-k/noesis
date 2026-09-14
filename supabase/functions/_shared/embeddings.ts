// Calcul d'embeddings via Gemini, pour la recherche par similarité du tuteur
// IA (voir lesson-grounding.ts). Dimension réduite à 768 via
// outputDimensionality — la dimension par défaut du modèle (3072) dépasse la
// limite d'index HNSW de pgvector (2000).

const GEMINI_EMBEDDING_MODEL = Deno.env.get('GEMINI_EMBEDDING_MODEL') ?? 'gemini-embedding-2';
const EMBEDDING_DIMENSION = 768;

export async function embedText(apiKey: string, text: string): Promise<number[]> {
  const response = await fetch(
    `https://generativelanguage.googleapis.com/v1beta/models/${GEMINI_EMBEDDING_MODEL}:embedContent?key=${apiKey}`,
    {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        content: { parts: [{ text }] },
        outputDimensionality: EMBEDDING_DIMENSION,
      }),
    }
  );

  if (!response.ok) {
    const errText = await response.text();
    throw new Error(`Gemini embedding a répondu ${response.status}: ${errText}`);
  }

  const data = await response.json();
  const values = data?.embedding?.values;
  if (!Array.isArray(values) || values.length !== EMBEDDING_DIMENSION) {
    throw new Error('Embedding Gemini vide ou de dimension inattendue.');
  }
  return values as number[];
}
