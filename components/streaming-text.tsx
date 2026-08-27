import { useEffect, useRef, useState } from 'react';
import { StyleSheet, View } from 'react-native';
import Animated, { FadeIn } from 'react-native-reanimated';

type StreamingTextProps = {
  text: string;
  style: object;
  onComplete?: () => void;
};

const WORD_TICK_MS = 32;

// Reveals a freshly-arrived reply the way Gemini streams tokens: paragraph
// blocks fade in top to bottom, and within the active paragraph words are
// appended one at a time, each fading in on its own — a continuous flow
// rather than the whole reply appearing as one block. The edge function
// itself returns one JSON payload rather than a token stream, so this
// replays the already-received text at reading pace instead of literal
// network-level streaming — visually equivalent, no backend change needed.
export function StreamingText({ text, style, onComplete }: StreamingTextProps) {
  const paragraphs = useRef(text.split(/\n+/).filter((paragraph) => paragraph.trim().length > 0)).current;
  const wordsByParagraph = useRef(paragraphs.map((paragraph) => paragraph.split(/\s+/).filter(Boolean))).current;
  const totalWords = useRef(wordsByParagraph.reduce((sum, words) => sum + words.length, 0)).current;
  const [revealedCount, setRevealedCount] = useState(0);
  const onCompleteRef = useRef(onComplete);
  onCompleteRef.current = onComplete;

  useEffect(() => {
    if (totalWords === 0) {
      onCompleteRef.current?.();
      return;
    }

    // Long replies stream 2 words/tick instead of 1 so the total reveal
    // stays under ~2.5s regardless of length.
    const step = totalWords > 70 ? 2 : 1;

    const interval = setInterval(() => {
      setRevealedCount((current) => {
        const next = Math.min(current + step, totalWords);
        if (next >= totalWords) {
          clearInterval(interval);
        }
        return next;
      });
    }, WORD_TICK_MS);

    return () => clearInterval(interval);
  }, [totalWords]);

  // Fires onComplete (which updates the parent's state) from an effect
  // rather than from inside the setRevealedCount updater above — updater
  // functions must stay pure, and calling a parent setState from inside one
  // is what produced "Cannot update a component while rendering a different
  // component" (React can invoke updaters outside the normal render cycle).
  useEffect(() => {
    if (totalWords > 0 && revealedCount >= totalWords) {
      onCompleteRef.current?.();
    }
  }, [revealedCount, totalWords]);

  const styles = StyleSheet.create({
    paragraph: {
      flexDirection: 'row',
      flexWrap: 'wrap',
    },
    paragraphSpacing: {
      marginBottom: 10,
    },
  });

  let consumed = 0;

  return (
    <View>
      {wordsByParagraph.map((words, paragraphIndex) => {
        const start = consumed;
        consumed += words.length;
        const visibleCount = Math.max(0, Math.min(words.length, revealedCount - start));
        if (visibleCount === 0) {
          return null;
        }
        return (
          <Animated.View
            key={paragraphIndex}
            entering={FadeIn.duration(350)}
            style={[styles.paragraph, paragraphIndex < wordsByParagraph.length - 1 && styles.paragraphSpacing]}>
            {words.slice(0, visibleCount).map((word, wordIndex) => (
              <Animated.Text key={wordIndex} entering={FadeIn.duration(220)} style={style}>
                {word + ' '}
              </Animated.Text>
            ))}
          </Animated.View>
        );
      })}
    </View>
  );
}
