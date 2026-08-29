## Problème

L'élève ivoirien de collège ou de lycée connaît le programme qu'il doit réviser et dispose de ressources pour le faire, mais lui manque la motivation et la régularité nécessaires pour réviser seul, en dehors des heures de cours. Sans échéance immédiate ni personne pour le pousser au quotidien, ses bonnes intentions de révision s'effritent après quelques jours, et le travail de fond se fait dans l'urgence, juste avant les évaluations et les examens (BEPC, BAC, contrôles).

## Solution

L'app transforme la révision en habitude quotidienne en la rendant compétitive et gratifiante : l'élève gagne de l'XP et construit une série de jours consécutifs en travaillant son programme (cours, exercices, flashcards, tuteur IA, sessions de concentration), s'affronte chaque semaine dans une ligue avec des élèves de sa classe, et peut inviter des camarades par parrainage. Le contenu pédagogique complet du programme ivoirien et un tuteur IA disponible à toute heure donnent à chaque session de révision une vraie valeur, mais ce qui fait revenir l'élève chaque jour, c'est la compétition sociale et la récompense — pas la contrainte.

## Utilisateur cible

Élève de la 6ème à la Terminale (toutes séries au lycée), scolarisé en zone urbaine en Côte d'Ivoire, équipé d'un smartphone Android d'entrée de gamme (majoritairement) ou iOS, avec un accès data régulier. Sa famille peut consentir à une dépense modeste et récurrente si la valeur perçue est là, avec un paiement par mobile money (Wave, MTN Money, Orange Money) plus naturel qu'une carte bancaire. Il connaît son programme scolaire mais peine à s'astreindre à une routine de révision autonome, surtout en dehors des périodes d'examen.

## User Stories

**Onboarding & compte**
1. En tant qu'élève, je veux créer un compte avec mon numéro de téléphone (code envoyé par SMS) ou mon email, afin de commencer à utiliser l'app sans friction.
2. En tant qu'élève, je veux indiquer ma classe (et ma série si je suis au lycée) lors de l'inscription, afin de recevoir un contenu et un classement adaptés à mon niveau.
3. En tant qu'élève, je veux définir mes objectifs de révision pendant l'onboarding, afin que l'app personnalise mes recommandations.

**Cours**
4. En tant qu'élève, je veux consulter la liste des matières de ma classe, afin de choisir ce que je veux réviser.
5. En tant qu'élève, je veux lire une leçon complète alignée sur le programme officiel de ma classe et ma série, afin de comprendre une notion.
6. En tant qu'élève, je veux suivre ma progression dans chaque matière/chapitre, afin de savoir ce qu'il me reste à voir.
7. En tant qu'élève Premium, je veux faire des exercices corrigés liés à une leçon, afin de vérifier que j'ai compris.
8. En tant qu'élève gratuit, je veux voir que les exercices corrigés sont réservés à Premium, afin de comprendre ce que l'abonnement m'apporte.

**Tuteur IA**
9. En tant qu'élève Premium, je veux poser une question à un tuteur IA par chat, afin d'obtenir une explication immédiate sur un point que je ne comprends pas.
10. En tant qu'élève Premium, je veux prendre en photo mon devoir manuscrit pour le faire corriger, afin de savoir si mes réponses sont justes avant de le rendre.
11. En tant qu'élève Premium, je veux prendre en photo un énoncé de devoir pour que le tuteur IA m'aide à le préparer, afin d'être guidé sans avoir la réponse toute faite.
12. En tant qu'élève gratuit, je veux disposer d'un nombre limité d'essais du tuteur IA, afin de juger de sa valeur avant de m'abonner.
13. En tant qu'élève, je veux retrouver l'historique de mes conversations avec le tuteur IA, afin de reprendre une discussion précédente.

**Flashcards**
14. En tant qu'élève, je veux réviser des decks de flashcards pré-faits par chapitre, afin de mémoriser les points clés d'une leçon.
15. En tant qu'élève, je veux que l'app me propose automatiquement les flashcards à revoir aujourd'hui selon la répétition espacée, afin de mémoriser sur le long terme sans avoir à planifier moi-même.
16. En tant qu'élève Premium, je veux créer mon propre deck de flashcards personnalisées, afin de réviser mes propres notes.

**Focus session**
17. En tant qu'élève, je veux lancer une session de concentration chronométrée, afin de réviser sans être interrompu.
18. En tant qu'élève Android, je veux que l'app active automatiquement le mode Ne Pas Déranger pendant ma session, afin de ne recevoir aucune notification.
19. En tant qu'élève iOS, je veux être guidé pour activer un Focus Filter dédié à l'app, afin de bloquer mes notifications pendant mes sessions.
20. En tant qu'élève, je veux voir un résumé de ma session (durée, XP gagné) à la fin, afin de mesurer mon effort.

**XP, séries, gamification**
21. En tant qu'élève, je veux gagner de l'XP à chaque activité pédagogique réelle (leçon, exercice, flashcard, session de concentration), afin que mon effort compte dans le classement.
22. En tant qu'élève, je veux voir ma série de jours consécutifs actifs, afin de rester motivé à revenir chaque jour.
23. En tant qu'élève, je veux utiliser un gel de série en nombre limité quand je rate un jour, afin de ne pas perdre ma série pour un empêchement ponctuel.

**Ligues**
24. En tant qu'élève, je veux voir le classement hebdomadaire de ma ligue face à des élèves de ma classe (et ma série au lycée), afin de me situer par rapport à mes pairs.
25. En tant qu'élève, je veux être promu ou relégué entre les 8 paliers de ligue selon mon classement de la semaine, afin que la compétition reste stimulante à mon niveau.
26. En tant qu'élève dont le groupe de ligue est trop petit cette semaine, je veux être automatiquement rattaché à un groupe plus large, afin d'avoir un classement significatif.

**Premium & parrainage**
27. En tant qu'élève, je veux souscrire à Premium via achat intégré (store) ou via Wave/MTN Money/Orange Money, afin de payer avec le moyen qui m'est le plus accessible.
28. En tant qu'élève, je veux partager mon code de parrainage, afin que mon filleul et moi recevions chacun des jours de Premium gratuits.
29. En tant qu'élève, je veux voir clairement ce que Premium débloque avant de m'abonner, afin de décider en connaissance de cause.

**Thème**
30. En tant qu'élève, je veux basculer entre mode sombre et mode clair, afin d'utiliser l'app confortablement selon la luminosité ambiante.

**Contenu (administrateur)**
31. En tant qu'administrateur, je veux consulter une file de contenu généré par IA en attente de validation, afin de le relire avant publication.
32. En tant qu'administrateur, je veux corriger et publier une leçon/un exercice généré, afin que seul du contenu validé soit visible par les élèves.

**États vides / erreurs**
33. En tant qu'élève sans connexion, je veux voir un message clair m'indiquant qu'une connexion est nécessaire, afin de comprendre pourquoi le contenu ne charge pas.
34. En tant qu'élève, je veux voir un état vide explicite si ma classe/série n'a pas encore de ligue active, afin de comprendre pourquoi le classement est vide plutôt que de croire à un bug.
35. En tant qu'élève dont la photo de devoir est illisible, je veux un message clair me demandant de reprendre la photo, afin de comprendre que le problème vient de l'image et non d'un bug.
36. En tant qu'élève dont le paiement mobile money échoue, je veux un message d'erreur clair et pouvoir réessayer, afin de ne pas être bloqué sans comprendre pourquoi.

## Critères de succès

- Rétention/régularité : au moins 30% des élèves actifs ont une série de révision ≥ 7 jours consécutifs après 30 jours d'usage.
- Conversion Premium : au moins 5% des utilisateurs actifs sont abonnés Premium sous 30 jours.

## Hors périmètre

- Compte ou tableau de bord parent
- Mode hors-ligne (toute fonctionnalité nécessite une connexion en v1)
- Contenu pédagogique en dehors du collège/lycée (primaire, enseignement supérieur)
- Programmes scolaires d'autres pays que la Côte d'Ivoire
- Version web ou desktop de l'app élève (l'app élève reste mobile uniquement ; seul l'outil de relecture de contenu est une interface web)
- Phasage du lancement (traité dans le plan d'implémentation, pas dans ce PRD)

## Décisions d'implémentation

- Inscription par numéro de téléphone (code par SMS) ou email, au choix de l'élève
- L'onboarding demande la classe (et la série si lycée) avant tout accès au contenu
- Leçons et répétition espacée des decks pré-faits : accessibles gratuitement à tout élève
- Exercices corrigés et création de decks de flashcards personnalisés : réservés à Premium, avec message d'incitation à l'endroit où la fonctionnalité est bloquée
- Tuteur IA (chat, correction et préparation de devoir par photo) : réservé à Premium ; un élève gratuit dispose d'un nombre limité d'essais avant d'être invité à s'abonner
- Focus session : sur Android, active automatiquement le mode Ne Pas Déranger pendant la durée choisie ; sur iOS, guide l'élève pour activer un Focus Filter dédié dans les réglages du téléphone
- XP attribué à chaque leçon terminée, exercice corrigé, session de flashcards et session de concentration complétée
- Série quotidienne affichée en évidence, avec un nombre limité de gels de série utilisables par mois
- Classement hebdomadaire par classe (et série au lycée) sur 8 paliers de ligue, avec promotion/relégation en fin de semaine ; fusion automatique avec un groupe voisin si le nombre d'élèves actifs est trop faible
- Paiement Premium disponible via achat intégré (App Store/Google Play) et via Wave, MTN Mobile Money, Orange Money, sur iOS comme sur Android
- Parrainage par code personnel à partager ; parrain et filleul reçoivent chacun un nombre défini de jours de Premium offerts
- Mode sombre et mode clair disponibles, bascule accessible depuis les réglages
- Aucun accès au contenu sans connexion internet ; message explicite plutôt qu'un écran vide silencieux

## Notes complémentaires

- **Risque de conformité stores** : proposer un paiement externe (Wave/MTN/Orange Money) en parallèle de l'achat intégré pour du contenu numérique consommé dans l'app est risqué vis-à-vis des règles Apple en particulier ; à valider avant soumission App Store.
- **Risque qualité contenu** : le contenu généré par IA doit être relu avant publication — un contenu erroné publié par erreur est un risque réputationnel direct dans un contexte BEPC/BAC.
- **Dépendance externe** : disponibilité et fiabilité des API Wave, MTN Mobile Money et Orange Money, et de l'API Gemini pour le tuteur IA.
- **Limite structurelle iOS** : Apple ne permet pas à une app tierce de bloquer les notifications directement ; la promesse "bloque vraiment les notifications" n'est pleinement tenue que sur Android.
- **Hypothèse** : une version précédente de cette app (archivée, non réutilisée comme code) avait déjà démontré la faisabilité technique de la plupart de ces fonctionnalités, ce qui réduit le risque d'inconnu technique même si ce PRD n'en dépend pas.
