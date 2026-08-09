import { StyleProp, TextStyle } from 'react-native';

import { ThemedText } from '@/components/themed-text';

function escapeRegExp(value: string): string {
  return value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

type HighlightedTextProps = {
  text: string;
  highlights: string[];
  style?: StyleProp<TextStyle>;
  highlightStyle?: StyleProp<TextStyle>;
};

// Bolds/colors every occurrence of the given terms within text — shared
// between the flashcard fiche renderer and the course content renderer so
// both read as "underlined/colored like an actual course" the same way.
export function HighlightedText({ text, highlights, style, highlightStyle }: HighlightedTextProps) {
  const terms = highlights.filter((term) => term.trim().length > 0);
  if (terms.length === 0) {
    return <ThemedText style={style}>{text}</ThemedText>;
  }

  const sortedTerms = [...terms].sort((a, b) => b.length - a.length);
  const pattern = new RegExp(`(${sortedTerms.map(escapeRegExp).join('|')})`, 'gi');
  const parts = text.split(pattern);
  const lowerTerms = sortedTerms.map((term) => term.toLowerCase());

  return (
    <ThemedText style={style}>
      {parts.map((part, index) =>
        lowerTerms.includes(part.toLowerCase()) ? (
          <ThemedText key={index} style={highlightStyle}>
            {part}
          </ThemedText>
        ) : (
          part
        ),
      )}
    </ThemedText>
  );
}
