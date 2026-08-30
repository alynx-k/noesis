import { HomeworkPhotoScreen } from '../components/homework-photo-screen';

export default function PrepareHomework() {
  return (
    <HomeworkPhotoScreen
      mode="prepare"
      title="Préparer un devoir"
      instructions="Prends en photo l'énoncé d'un devoir pas encore fait. Le tuteur IA te guide étape par étape, sans te donner la réponse toute faite."
    />
  );
}
