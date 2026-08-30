'use client';

import { useEffect, useState } from 'react';
import { useParams, useRouter } from 'next/navigation';
import Link from 'next/link';
import { supabase } from '../../../lib/supabase';

type LessonDetail = {
  id: string;
  title: string;
  content_md: string;
  status: 'draft' | 'published';
  grade: string;
  serie: string | null;
};

const OPTION_IDS = ['a', 'b', 'c', 'd'] as const;

type ExerciseRow = {
  id: string;
  question_md: string;
  options: { id: string; text: string }[];
  sort_order: number;
  status: 'draft' | 'published';
  correct_option_id: string;
  explanation_md: string;
};

type ExerciseForm = {
  question_md: string;
  optionTexts: Record<string, string>;
  correct_option_id: string;
  explanation_md: string;
};

const emptyForm: ExerciseForm = {
  question_md: '',
  optionTexts: { a: '', b: '', c: '', d: '' },
  correct_option_id: 'a',
  explanation_md: '',
};

function ExercisesSection({ lessonId }: { lessonId: string }) {
  const [exercises, setExercises] = useState<ExerciseRow[] | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [form, setForm] = useState<ExerciseForm>(emptyForm);
  const [editingId, setEditingId] = useState<string | null>(null);
  const [saving, setSaving] = useState(false);

  async function loadExercises() {
    const { data: exerciseRows, error: exError } = await supabase
      .from('exercises')
      .select('id, question_md, options, sort_order, status')
      .eq('lesson_id', lessonId)
      .order('sort_order');
    if (exError) {
      setError(exError.message);
      return;
    }
    const ids = (exerciseRows ?? []).map((row) => row.id);
    const { data: answerRows, error: ansError } = await supabase
      .from('exercise_answers')
      .select('exercise_id, correct_option_id, explanation_md')
      .in('exercise_id', ids.length > 0 ? ids : ['00000000-0000-0000-0000-000000000000']);
    if (ansError) {
      setError(ansError.message);
      return;
    }
    const answerByExercise = new Map(answerRows?.map((a) => [a.exercise_id, a]));
    setExercises(
      (exerciseRows ?? []).map((row) => ({
        ...row,
        options: row.options as { id: string; text: string }[],
        correct_option_id: answerByExercise.get(row.id)?.correct_option_id ?? 'a',
        explanation_md: answerByExercise.get(row.id)?.explanation_md ?? '',
      })),
    );
  }

  useEffect(() => {
    loadExercises();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [lessonId]);

  function startEdit(exercise: ExerciseRow) {
    setEditingId(exercise.id);
    setForm({
      question_md: exercise.question_md,
      optionTexts: Object.fromEntries(OPTION_IDS.map((id) => [id, exercise.options.find((o) => o.id === id)?.text ?? ''])),
      correct_option_id: exercise.correct_option_id,
      explanation_md: exercise.explanation_md,
    });
  }

  function resetForm() {
    setEditingId(null);
    setForm(emptyForm);
  }

  async function handleSubmit() {
    setSaving(true);
    setError(null);
    const options = OPTION_IDS.map((id) => ({ id, text: form.optionTexts[id] }));

    if (editingId) {
      const { error: updateError } = await supabase
        .from('exercises')
        .update({ question_md: form.question_md, options })
        .eq('id', editingId);
      const { error: answerError } = updateError
        ? { error: updateError }
        : await supabase
            .from('exercise_answers')
            .update({ correct_option_id: form.correct_option_id, explanation_md: form.explanation_md })
            .eq('exercise_id', editingId);
      setSaving(false);
      if (updateError || answerError) {
        setError((updateError ?? answerError)!.message);
        return;
      }
    } else {
      const sortOrder = exercises?.length ?? 0;
      const { data: inserted, error: insertError } = await supabase
        .from('exercises')
        .insert({ lesson_id: lessonId, question_md: form.question_md, options, sort_order: sortOrder })
        .select('id')
        .single();
      if (insertError || !inserted) {
        setSaving(false);
        setError(insertError?.message ?? 'Échec de la création.');
        return;
      }
      const { error: answerError } = await supabase.from('exercise_answers').insert({
        exercise_id: inserted.id,
        correct_option_id: form.correct_option_id,
        explanation_md: form.explanation_md,
      });
      setSaving(false);
      if (answerError) {
        setError(answerError.message);
        return;
      }
    }

    resetForm();
    await loadExercises();
  }

  async function togglePublish(exercise: ExerciseRow) {
    const nextStatus = exercise.status === 'draft' ? 'published' : 'draft';
    const { error: toggleError } = await supabase.from('exercises').update({ status: nextStatus }).eq('id', exercise.id);
    if (toggleError) {
      setError(toggleError.message);
      return;
    }
    await loadExercises();
  }

  async function handleDelete(exerciseId: string) {
    const { error: deleteError } = await supabase.from('exercises').delete().eq('id', exerciseId);
    if (deleteError) {
      setError(deleteError.message);
      return;
    }
    if (editingId === exerciseId) resetForm();
    await loadExercises();
  }

  return (
    <div style={{ marginTop: 40 }}>
      <h2>Exercices</h2>
      {error ? <p className="error">{error}</p> : null}

      {exercises === null ? (
        <p className="muted">Chargement…</p>
      ) : exercises.length === 0 ? (
        <p className="muted">Aucun exercice pour cette leçon.</p>
      ) : (
        <table>
          <thead>
            <tr>
              <th>Question</th>
              <th>Statut</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            {exercises.map((exercise) => (
              <tr key={exercise.id} onClick={() => startEdit(exercise)}>
                <td>{exercise.question_md.slice(0, 60)}</td>
                <td>
                  <span className={`badge ${exercise.status}`}>
                    {exercise.status === 'draft' ? 'Brouillon' : 'Publié'}
                  </span>
                </td>
                <td style={{ display: 'flex', gap: 8 }}>
                  <button
                    className="secondary"
                    onClick={(e) => {
                      e.stopPropagation();
                      togglePublish(exercise);
                    }}
                  >
                    {exercise.status === 'draft' ? 'Publier' : 'Dépublier'}
                  </button>
                  <button
                    className="secondary"
                    onClick={(e) => {
                      e.stopPropagation();
                      handleDelete(exercise.id);
                    }}
                  >
                    Supprimer
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      )}

      <div className="editor" style={{ marginTop: 20 }}>
        <h3 style={{ margin: 0 }}>{editingId ? 'Modifier l’exercice' : 'Nouvel exercice'}</h3>
        <textarea
          value={form.question_md}
          onChange={(e) => setForm((f) => ({ ...f, question_md: e.target.value }))}
          placeholder="Question (Markdown)"
          style={{ minHeight: 100 }}
        />
        {OPTION_IDS.map((id) => (
          <div key={id} style={{ display: 'flex', gap: 8, alignItems: 'center' }}>
            <input
              type="radio"
              name="correct_option"
              checked={form.correct_option_id === id}
              onChange={() => setForm((f) => ({ ...f, correct_option_id: id }))}
            />
            <input
              value={form.optionTexts[id]}
              onChange={(e) => setForm((f) => ({ ...f, optionTexts: { ...f.optionTexts, [id]: e.target.value } }))}
              placeholder={`Option ${id.toUpperCase()}`}
              style={{ flex: 1 }}
            />
          </div>
        ))}
        <p className="muted" style={{ margin: 0 }}>Le bouton radio sélectionne la bonne réponse.</p>
        <textarea
          value={form.explanation_md}
          onChange={(e) => setForm((f) => ({ ...f, explanation_md: e.target.value }))}
          placeholder="Explication de la correction (Markdown)"
          style={{ minHeight: 80 }}
        />
        <div className="editor-actions">
          <button
            disabled={saving || !form.question_md || OPTION_IDS.some((id) => !form.optionTexts[id])}
            onClick={handleSubmit}
          >
            {editingId ? 'Enregistrer' : 'Ajouter'}
          </button>
          {editingId ? (
            <button className="secondary" onClick={resetForm}>
              Annuler
            </button>
          ) : null}
        </div>
      </div>
    </div>
  );
}

type DeckRow = {
  id: string;
  title: string;
  status: 'draft' | 'published';
  flashcards: { id: string }[];
};

function DecksSection({ lessonId }: { lessonId: string }) {
  const router = useRouter();
  const [decks, setDecks] = useState<DeckRow[] | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [newTitle, setNewTitle] = useState('');
  const [saving, setSaving] = useState(false);

  async function loadDecks() {
    const { data, error: loadError } = await supabase
      .from('flashcard_decks')
      .select('id, title, status, flashcards(id)')
      .eq('lesson_id', lessonId)
      .order('created_at');
    if (loadError) {
      setError(loadError.message);
      return;
    }
    setDecks(data as unknown as DeckRow[]);
  }

  useEffect(() => {
    loadDecks();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [lessonId]);

  async function handleCreate() {
    setSaving(true);
    setError(null);
    const { error: insertError } = await supabase.from('flashcard_decks').insert({ lesson_id: lessonId, title: newTitle });
    setSaving(false);
    if (insertError) {
      setError(insertError.message);
      return;
    }
    setNewTitle('');
    await loadDecks();
  }

  async function togglePublish(deck: DeckRow) {
    const nextStatus = deck.status === 'draft' ? 'published' : 'draft';
    const { error: toggleError } = await supabase.from('flashcard_decks').update({ status: nextStatus }).eq('id', deck.id);
    if (toggleError) {
      setError(toggleError.message);
      return;
    }
    await loadDecks();
  }

  async function handleDelete(deckId: string) {
    const { error: deleteError } = await supabase.from('flashcard_decks').delete().eq('id', deckId);
    if (deleteError) {
      setError(deleteError.message);
      return;
    }
    await loadDecks();
  }

  return (
    <div style={{ marginTop: 40 }}>
      <h2>Decks de flashcards</h2>
      {error ? <p className="error">{error}</p> : null}

      {decks === null ? (
        <p className="muted">Chargement…</p>
      ) : decks.length === 0 ? (
        <p className="muted">Aucun deck pour cette leçon.</p>
      ) : (
        <table>
          <thead>
            <tr>
              <th>Titre</th>
              <th>Cartes</th>
              <th>Statut</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            {decks.map((deck) => (
              <tr key={deck.id} onClick={() => router.push(`/decks/${deck.id}`)}>
                <td>{deck.title}</td>
                <td>{deck.flashcards.length}</td>
                <td>
                  <span className={`badge ${deck.status}`}>{deck.status === 'draft' ? 'Brouillon' : 'Publié'}</span>
                </td>
                <td style={{ display: 'flex', gap: 8 }}>
                  <button
                    className="secondary"
                    onClick={(e) => {
                      e.stopPropagation();
                      togglePublish(deck);
                    }}
                  >
                    {deck.status === 'draft' ? 'Publier' : 'Dépublier'}
                  </button>
                  <button
                    className="secondary"
                    onClick={(e) => {
                      e.stopPropagation();
                      handleDelete(deck.id);
                    }}
                  >
                    Supprimer
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      )}

      <div className="editor" style={{ marginTop: 20, flexDirection: 'row' }}>
        <input
          value={newTitle}
          onChange={(e) => setNewTitle(e.target.value)}
          placeholder="Titre du nouveau deck"
          style={{ flex: 1 }}
        />
        <button disabled={saving || !newTitle} onClick={handleCreate}>
          Créer
        </button>
      </div>
    </div>
  );
}

export default function LessonEditor() {
  const params = useParams<{ id: string }>();
  const router = useRouter();
  const [lesson, setLesson] = useState<LessonDetail | null>(null);
  const [title, setTitle] = useState('');
  const [contentMd, setContentMd] = useState('');
  const [error, setError] = useState<string | null>(null);
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    supabase
      .from('lessons')
      .select('id, title, content_md, status, grade, serie')
      .eq('id', params.id)
      .single()
      .then(({ data, error: queryError }) => {
        if (queryError) {
          setError(queryError.message);
          return;
        }
        setLesson(data as LessonDetail);
        setTitle(data.title);
        setContentMd(data.content_md);
      });
  }, [params.id]);

  async function handleSave(nextStatus?: 'draft' | 'published') {
    setSaving(true);
    setError(null);
    const update: Record<string, unknown> = { title, content_md: contentMd };
    if (nextStatus) {
      update.status = nextStatus;
      if (nextStatus === 'published') update.published_at = new Date().toISOString();
    }
    const { error: updateError } = await supabase.from('lessons').update(update).eq('id', params.id);
    setSaving(false);
    if (updateError) {
      setError(updateError.message);
      return;
    }
    if (nextStatus) router.push('/');
    else setLesson((prev) => (prev ? { ...prev, title, content_md: contentMd } : prev));
  }

  if (error && !lesson) return <p className="error">{error}</p>;
  if (!lesson) return <p className="muted">Chargement…</p>;

  return (
    <div>
      <Link href="/" className="back-link">
        ← Retour
      </Link>
      <h1>Relecture</h1>
      <p className="muted">
        {lesson.grade}
        {lesson.serie ? ` (${lesson.serie})` : ''} · <span className={`badge ${lesson.status}`}>{lesson.status}</span>
      </p>

      <div className="editor">
        <input value={title} onChange={(e) => setTitle(e.target.value)} placeholder="Titre de la leçon" />
        <textarea
          value={contentMd}
          onChange={(e) => setContentMd(e.target.value)}
          placeholder="Contenu Markdown (##, ###, **gras**, `code`)"
        />
        {error ? <p className="error">{error}</p> : null}
        <div className="editor-actions">
          <button className="secondary" disabled={saving} onClick={() => handleSave()}>
            Enregistrer le brouillon
          </button>
          {lesson.status === 'draft' ? (
            <button disabled={saving} onClick={() => handleSave('published')}>
              Publier
            </button>
          ) : (
            <button className="secondary" disabled={saving} onClick={() => handleSave('draft')}>
              Dépublier
            </button>
          )}
        </div>
      </div>

      <ExercisesSection lessonId={lesson.id} />
      <DecksSection lessonId={lesson.id} />
    </div>
  );
}
