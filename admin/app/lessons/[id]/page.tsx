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
    </div>
  );
}
