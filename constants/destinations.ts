export type Destination = {
  id: string;
  name: string;
  distanceLabel: string;
  funFact: string;
  // Number of successful focus sessions (cumulative, all-time) needed to
  // reach this destination for the first time.
  threshold: number;
  baseColor: string;
  shadeColor: string;
  hasRing?: boolean;
};

// Ordered from closest to farthest — this order doubles as unlock order.
export const DESTINATIONS: Destination[] = [
  {
    id: 'lune',
    name: 'La Lune',
    distanceLabel: '384 400 km',
    funFact: "Le seul astre sur lequel des humains ont marché, pour la première fois en 1969.",
    threshold: 1,
    baseColor: '#E8E6E1',
    shadeColor: '#B7B4AC',
  },
  {
    id: 'mars',
    name: 'Mars',
    distanceLabel: '225 millions de km',
    funFact: "La planète rouge doit sa couleur à l'oxyde de fer qui recouvre son sol.",
    threshold: 3,
    baseColor: '#E8794A',
    shadeColor: '#B4502A',
  },
  {
    id: 'venus',
    name: 'Vénus',
    distanceLabel: '261 millions de km',
    funFact: "À cause de son épaisse atmosphère, Vénus est la planète la plus chaude du système solaire.",
    threshold: 5,
    baseColor: '#E8C989',
    shadeColor: '#C79A52',
  },
  {
    id: 'mercure',
    name: 'Mercure',
    distanceLabel: '150 millions de km',
    funFact: "La planète la plus proche du Soleil fait le tour complet en seulement 88 jours.",
    threshold: 8,
    baseColor: '#A79C93',
    shadeColor: '#7A6F66',
  },
  {
    id: 'asteroides',
    name: "Ceinture d'astéroïdes",
    distanceLabel: '450 millions de km',
    funFact: "Des millions de rochers gravitent ici, entre les orbites de Mars et de Jupiter.",
    threshold: 12,
    baseColor: '#8C8378',
    shadeColor: '#5E564C',
  },
  {
    id: 'jupiter',
    name: 'Jupiter',
    distanceLabel: '778 millions de km',
    funFact: "La plus grosse planète du système solaire pourrait contenir plus de 1300 Terres.",
    threshold: 17,
    baseColor: '#E0B98C',
    shadeColor: '#B4885A',
  },
  {
    id: 'europe',
    name: 'Europe',
    distanceLabel: '778 millions de km',
    funFact: "Cette lune de Jupiter cache un océan sous sa glace — un des meilleurs espoirs pour trouver la vie ailleurs.",
    threshold: 23,
    baseColor: '#D8CFC0',
    shadeColor: '#A79C8A',
  },
  {
    id: 'saturne',
    name: 'Saturne',
    distanceLabel: '1,4 milliard de km',
    funFact: 'Ses célèbres anneaux sont faits de milliards de morceaux de glace et de roche.',
    threshold: 30,
    baseColor: '#E8D4A0',
    shadeColor: '#C2A968',
    hasRing: true,
  },
  {
    id: 'titan',
    name: 'Titan',
    distanceLabel: '1,4 milliard de km',
    funFact: 'La plus grande lune de Saturne a des lacs — mais remplis de méthane liquide.',
    threshold: 38,
    baseColor: '#D9A55C',
    shadeColor: '#A97A38',
  },
  {
    id: 'uranus',
    name: 'Uranus',
    distanceLabel: '2,9 milliards de km',
    funFact: 'Uranus est inclinée à un point tel que cette planète tourne presque couchée sur le côté.',
    threshold: 47,
    baseColor: '#9FDDE0',
    shadeColor: '#5FAEB2',
  },
  {
    id: 'neptune',
    name: 'Neptune',
    distanceLabel: '4,5 milliards de km',
    funFact: 'Les vents les plus violents du système solaire soufflent sur Neptune.',
    threshold: 57,
    baseColor: '#5B7FE0',
    shadeColor: '#3A55A8',
  },
  {
    id: 'confins',
    name: 'Confins du système solaire',
    distanceLabel: 'plus de 6 milliards de km',
    funFact: 'Au-delà de Neptune commence une région glacée à peine explorée, où orbite Pluton.',
    threshold: 70,
    baseColor: '#7C6FE0',
    shadeColor: '#4F3FA8',
  },
];
