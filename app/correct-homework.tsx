import { HomeworkPhotoScreen } from '../components/homework-photo-screen';

export default function CorrectHomework() {
  return (
    <HomeworkPhotoScreen
      mode="correct"
      title="Corriger un devoir"
      instructions="Prends en photo un devoir que tu as déjà rempli. Le tuteur IA vérifie chaque réponse et t'explique tes erreurs."
    />
  );
}
