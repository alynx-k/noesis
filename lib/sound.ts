import { createAudioPlayer, setAudioModeAsync } from 'expo-audio';

// Short, original chime sounds (synthesized, not sampled from anywhere) —
// see assets/sounds/. Each one plays once and releases itself; nothing
// keeps a player alive between calls, so this is safe to call from any
// screen without extra setup.
const CORRECT_SOUND = require('../assets/sounds/correct.wav');
const LESSON_COMPLETE_SOUND = require('../assets/sounds/lesson-complete.wav');

// Without this, iOS mutes app audio whenever the hardware silent switch is
// on — these are short feedback chimes, not music, so they should still
// play. Configured once, lazily, on first sound (no need to touch the root
// layout for this).
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

function playOnce(source: number, volume: number) {
  ensureAudioMode();
  const player = createAudioPlayer(source);
  player.volume = volume;

  const subscription = player.addListener('playbackStatusUpdate', (status) => {
    if (status.didJustFinish) {
      subscription.remove();
      player.remove();
    }
  });

  player.play();
}

// A correct exercise answer — light, doesn't need to grab attention.
export function playCorrectSound(): void {
  playOnce(CORRECT_SOUND, 0.5);
}

// Finishing a lesson's exercises — a fuller, more celebratory chime.
export function playLessonCompleteSound(): void {
  playOnce(LESSON_COMPLETE_SOUND, 0.6);
}
