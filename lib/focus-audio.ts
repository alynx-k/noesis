import { AudioPlayer, createAudioPlayer, setAudioModeAsync } from 'expo-audio';

// Both real tracks now: "Atlas Audio Focus" (Pixabay) for music, "Rain
// Sound and Rainforest" (Freesound community, Pixabay) for nature.
const TRACKS = {
  music: require('../assets/sounds/focus-music.mp3'),
  nature: require('../assets/sounds/focus-nature.mp3'),
} as const;

export type FocusTrackId = keyof typeof TRACKS;

let activePlayer: AudioPlayer | null = null;
let activeTrack: FocusTrackId | null = null;
let audioModeConfigured = false;

function ensureAudioMode() {
  if (audioModeConfigured) {
    return;
  }
  audioModeConfigured = true;
  setAudioModeAsync({ playsInSilentMode: true }).catch((error) => {
    console.error('Failed to configure audio mode:', error);
  });
}

export function getActiveFocusTrack(): FocusTrackId | null {
  return activeTrack;
}

// Starting a track stops whatever was already playing — music and nature
// sounds are mutually exclusive, not layered.
export function playFocusTrack(track: FocusTrackId): void {
  ensureAudioMode();
  stopFocusTrack();
  try {
    const player = createAudioPlayer(TRACKS[track]);
    player.loop = true;
    player.volume = 0.5;
    player.play();
    activePlayer = player;
    activeTrack = track;
  } catch (error) {
    console.error('Failed to play focus track:', error);
  }
}

export function stopFocusTrack(): void {
  if (activePlayer) {
    activePlayer.pause();
    activePlayer.remove();
    activePlayer = null;
  }
  activeTrack = null;
}
