import * as Clipboard from 'expo-clipboard';
import * as Speech from 'expo-speech';
import { useEffect, useRef, useState } from 'react';
import { StyleSheet, View } from 'react-native';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { SPACING } from '@/constants/design';
import { useThemeColors } from '@/hooks/use-theme-colors';

type Rating = 'up' | 'down' | null;

type MessageActionsProps = {
  text: string;
  onRegenerate: () => void;
};

// Gemini-style action row under a completed bot reply: rate, regenerate,
// copy, and read aloud. Thumbs are visual-only (no feedback table exists to
// persist a rating — out of scope here); copy and listen are the two
// actions with real device-level effects.
export function MessageActions({ text, onRegenerate }: MessageActionsProps) {
  const COLORS = useThemeColors();
  const [rating, setRating] = useState<Rating>(null);
  const [copied, setCopied] = useState(false);
  const [speaking, setSpeaking] = useState(false);
  const copiedTimeout = useRef<ReturnType<typeof setTimeout> | null>(null);

  useEffect(() => {
    return () => {
      if (copiedTimeout.current) {
        clearTimeout(copiedTimeout.current);
      }
      Speech.stop();
    };
  }, []);

  const handleCopy = async () => {
    await Clipboard.setStringAsync(text);
    setCopied(true);
    if (copiedTimeout.current) {
      clearTimeout(copiedTimeout.current);
    }
    copiedTimeout.current = setTimeout(() => setCopied(false), 1500);
  };

  const handleListen = () => {
    if (speaking) {
      Speech.stop();
      setSpeaking(false);
      return;
    }
    setSpeaking(true);
    Speech.speak(text, {
      language: 'fr-FR',
      onDone: () => setSpeaking(false),
      onStopped: () => setSpeaking(false),
      onError: () => setSpeaking(false),
    });
  };

  const styles = StyleSheet.create({
    row: {
      flexDirection: 'row',
      alignItems: 'center',
      gap: SPACING.tight,
      marginTop: SPACING.tight,
      marginBottom: SPACING.element,
    },
    iconButton: {
      width: 32,
      height: 32,
      borderRadius: 16,
      alignItems: 'center',
      justifyContent: 'center',
    },
  });

  const iconColor = (active: boolean) => (active ? COLORS.accent : COLORS.mutedText);

  return (
    <View style={styles.row}>
      <BouncyPressable style={styles.iconButton} hitSlop={4} onPress={() => setRating((r) => (r === 'up' ? null : 'up'))}>
        <IconSymbol name="hand.thumbsup.fill" size={16} color={iconColor(rating === 'up')} />
      </BouncyPressable>
      <BouncyPressable
        style={styles.iconButton}
        hitSlop={4}
        onPress={() => setRating((r) => (r === 'down' ? null : 'down'))}>
        <IconSymbol name="hand.thumbsdown.fill" size={16} color={iconColor(rating === 'down')} />
      </BouncyPressable>
      <BouncyPressable style={styles.iconButton} hitSlop={4} onPress={onRegenerate}>
        <IconSymbol name="arrow.clockwise" size={16} color={COLORS.mutedText} />
      </BouncyPressable>
      <BouncyPressable style={styles.iconButton} hitSlop={4} onPress={handleCopy}>
        <IconSymbol name={copied ? 'checkmark' : 'doc.on.doc'} size={16} color={iconColor(copied)} />
      </BouncyPressable>
      <BouncyPressable style={styles.iconButton} hitSlop={4} onPress={handleListen}>
        <IconSymbol name={speaking ? 'stop.fill' : 'speaker.wave.2.fill'} size={16} color={iconColor(speaking)} />
      </BouncyPressable>
    </View>
  );
}
