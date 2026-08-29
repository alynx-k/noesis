'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { supabase } from '../lib/supabase';

type LessonRow = {
  id: string;
  title: string;
  grade: string;
  serie: string | null;
  status: 'draft' | 'published';
  generated_by: string;
  created_at: string;
  subjects: { name: string } | null;
};

export default function Dashboard() {
  const router = useRouter();
  const [lessons, setLessons] = useState<LessonRow[] | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [filter, setFilter] = useState<'draft' | 'published' | 'all'>('draft');

  useEffect(() => {
    let cancelled = false;
    setLessons(null);
    setError(null);

    let query = supabase
      .from('lessons')
      .select('id, title, grade, serie, status, generated_by, created_at, subjects(name)')
      .order('created_at', { ascending: false });

    if (filter !== 'all') query = query.eq('status', filter);

    query.then(({ data, error: queryError }) => {
      if (cancelled) return;
      if (queryError) setError(queryError.message);
      else setLessons(data as unknown as LessonRow[]);
    });

    return () => {
      cancelled = true;
    };
  }, [filter]);

  return (
    <div>
      <h1>Contenu de cours</h1>
      <div style={{ display: 'flex', gap: 8, margin: '12px 0 20px' }}>
        {(['draft', 'published', 'all'] as const).map((f) => (
          <button
            key={f}
            className={filter === f ? '' : 'secondary'}
            onClick={() => setFilter(f)}
          >
            {f === 'draft' ? 'Brouillons' : f === 'published' ? 'Publiées' : 'Toutes'}
          </button>
        ))}
      </div>

      {error ? <p className="error">{error}</p> : null}
      {!lessons && !error ? <p className="muted">Chargement…</p> : null}
      {lessons && lessons.length === 0 ? <p className="muted">Rien à afficher pour ce filtre.</p> : null}

      {lessons && lessons.length > 0 ? (
        <table>
          <thead>
            <tr>
              <th>Titre</th>
              <th>Matière</th>
              <th>Classe</th>
              <th>Statut</th>
              <th>Origine</th>
            </tr>
          </thead>
          <tbody>
            {lessons.map((lesson) => (
              <tr key={lesson.id} onClick={() => router.push(`/lessons/${lesson.id}`)}>
                <td>{lesson.title}</td>
                <td>{lesson.subjects?.name ?? '—'}</td>
                <td>
                  {lesson.grade}
                  {lesson.serie ? ` (${lesson.serie})` : ''}
                </td>
                <td>
                  <span className={`badge ${lesson.status}`}>
                    {lesson.status === 'draft' ? 'Brouillon' : 'Publiée'}
                  </span>
                </td>
                <td>{lesson.generated_by === 'gemini' ? 'IA' : 'Manuel'}</td>
              </tr>
            ))}
          </tbody>
        </table>
      ) : null}
    </div>
  );
}
