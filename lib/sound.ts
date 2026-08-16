import { createAudioPlayer, setAudioModeAsync } from 'expo-audio';

// Short, original chime sounds (synthesized, not sampled from anywhere) —
// see assets/sounds/. Each one plays once and releases itself; nothing
// keeps a player alive between calls, so this is safe to call from any
// screen without extra setup.
const CORRECT_SOUND = require('../assets/sounds/correct.wav');
const LESSON_COMPLETE_SOUND = require('../assets/sounds/lesson-complete.wav');
const ACHIEVEMENT_SOUND = require('../assets/sounds/achievement.wav');
const LAUNCH_SOUND = require('../assets/sounds/launch.wav');

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
  try {
    const player = createAudioPlayer(source);
    player.volume = volume;

    const subscription = player.addListener('playbackStatusUpdate', (status) => {
      if (status.didJustFinish) {
        subscription.remove();
        player.remove();
      }
    });

    player.play();
  } catch (error) {
    // createAudioPlayer/play() can fail silently otherwise — a bad asset
    // reference (e.g. a bundler cache that hasn't picked up a newly added
    // sound file yet) would previously just produce no sound with nothing
    // in the console to explain why.
    console.error('Failed to play sound:', error);
  }
}

// A correct exercise answer — light, doesn't need to grab attention.
export function playCorrectSound(): void {
  playOnce(CORRECT_SOUND, 0.5);
}

// Finishing a lesson's exercises — a fuller, more celebratory chime.
export function playLessonCompleteSound(): void {
  playOnce(LESSON_COMPLETE_SOUND, 0.6);
}

// Finishing a whole flashcard deck — the biggest, most "you did it" chime of
// the three, paired with a longer on-screen celebration than the other two.
export function playAchievementSound(): void {
  playOnce(ACHIEVEMENT_SOUND, 0.7);
}

// The rocket taking off, when a focus session starts (focus-session.tsx) —
// a whoosh, not a chime, so it's kept distinct from the other three.
export function playLaunchSound(): void {
  playOnce(LAUNCH_SOUND, 0.6);
}
