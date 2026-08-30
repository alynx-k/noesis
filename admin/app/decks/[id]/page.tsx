'use client';

import { useEffect, useState } from 'react';
import { useParams } from 'next/navigation';
import Link from 'next/link';
import { supabase } from '../../../lib/supabase';

type DeckDetail = {
  id: string;
  title: string;
  status: 'draft' | 'published';
  lesson_id: string;
  lessons: { title: string } | null;
};

type CardRow = {
  id: string;
  front_md: string;
  back_md: string;
  sort_order: number;
};

const emptyForm = { front_md: '', back_md: '' };

export default function DeckEditor() {
  const params = useParams<{ id: string }>();
  const [deck, setDeck] = useState<DeckDetail | null>(null);
  const [cards, setCards] = useState<CardRow[] | null>(null);
  const [form, setForm] = useState(emptyForm);
  const [editingId, setEditingId] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [saving, setSaving] = useState(false);

  async function loadDeck() {
    const { data, error: deckError } = await supabase
      .from('flashcard_decks')
      .select('id, title, status, lesson_id, lessons(title)')
      .eq('id', params.id)
      .single();
    if (deckError) {
      setError(deckError.message);
      return;
    }
    setDeck(data as unknown as DeckDetail);
  }

  async function loadCards() {
    const { data, error: cardsError } = await supabase
      .from('flashcards')
      .select('id, front_md, back_md, sort_order')
      .eq('deck_id', params.id)
      .order('sort_order');
    if (cardsError) {
      setError(cardsError.message);
      return;
    }
    setCards(data as CardRow[]);
  }

  useEffect(() => {
    loadDeck();
    loadCards();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [params.id]);

  function startEdit(card: CardRow) {
    setEditingId(card.id);
    setForm({ front_md: card.front_md, back_md: card.back_md });
  }

  function resetForm() {
    setEditingId(null);
    setForm(emptyForm);
  }

  async function handleSubmit() {
    setSaving(true);
    setError(null);
    if (editingId) {
      const { error: updateError } = await supabase.from('flashcards').update(form).eq('id', editingId);
      setSaving(false);
      if (updateError) {
        setError(updateError.message);
        return;
      }
    } else {
      const sortOrder = cards?.length ?? 0;
      const { error: insertError } = await supabase
        .from('flashcards')
        .insert({ deck_id: params.id, ...form, sort_order: sortOrder });
      setSaving(false);
      if (insertError) {
        setError(insertError.message);
        return;
      }
    }
    resetForm();
    await loadCards();
  }

  async function handleDelete(cardId: string) {
    const { error: deleteError } = await supabase.from('flashcards').delete().eq('id', cardId);
    if (deleteError) {
      setError(deleteError.message);
      return;
    }
    if (editingId === cardId) resetForm();
    await loadCards();
  }

  async function togglePublish() {
    if (!deck) return;
    const nextStatus = deck.status === 'draft' ? 'published' : 'draft';
    const { error: toggleError } = await supabase.from('flashcard_decks').update({ status: nextStatus }).eq('id', deck.id);
    if (toggleError) {
      setError(toggleError.message);
      return;
    }
    await loadDeck();
  }

  if (error && !deck) return <p className="error">{error}</p>;
  if (!deck) return <p className="muted">Chargement…</p>;

  return (
    <div>
      <Link href={`/lessons/${deck.lesson_id}`} className="back-link">
        ← Retour à la leçon
      </Link>
      <h1>{deck.title}</h1>
      <p className="muted">
        {deck.lessons?.title} · <span className={`badge ${deck.status}`}>{deck.status === 'draft' ? 'Brouillon' : 'Publié'}</span>
      </p>
      <div className="editor-actions" style={{ marginBottom: 20 }}>
        <button className="secondary" onClick={togglePublish}>
          {deck.status === 'draft' ? 'Publier le deck' : 'Dépublier le deck'}
        </button>
      </div>

      {error ? <p className="error">{error}</p> : null}

      {cards === null ? (
        <p className="muted">Chargement…</p>
      ) : cards.length === 0 ? (
        <p className="muted">Aucune carte pour ce deck.</p>
      ) : (
        <table>
          <thead>
            <tr>
              <th>Recto</th>
              <th>Verso</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            {cards.map((card) => (
              <tr key={card.id} onClick={() => startEdit(card)}>
                <td>{card.front_md.slice(0, 50)}</td>
                <td>{card.back_md.slice(0, 50)}</td>
                <td>
                  <button
                    className="secondary"
                    onClick={(e) => {
                      e.stopPropagation();
                      handleDelete(card.id);
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
        <h3 style={{ margin: 0 }}>{editingId ? 'Modifier la carte' : 'Nouvelle carte'}</h3>
        <textarea
          value={form.front_md}
          onChange={(e) => setForm((f) => ({ ...f, front_md: e.target.value }))}
          placeholder="Recto (question / terme)"
          style={{ minHeight: 80 }}
        />
        <textarea
          value={form.back_md}
          onChange={(e) => setForm((f) => ({ ...f, back_md: e.target.value }))}
          placeholder="Verso (réponse / définition)"
          style={{ minHeight: 80 }}
        />
        <div className="editor-actions">
          <button disabled={saving || !form.front_md || !form.back_md} onClick={handleSubmit}>
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
