import { Fragment } from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { useAppTheme } from '../hooks/use-app-theme';
import { fonts, spacing } from '../constants/theme';

// Rendu Markdown volontairement minimal : ne gère que ce que le pipeline de
// génération produit (##, ###, **gras**, `code`, paragraphes) — pas de
// dépendance markdown-it/linkify-it (vulnérable et cassait le bundle Metro).

type Block =
  | { type: 'h2'; text: string }
  | { type: 'h3'; text: string }
  | { type: 'p'; text: string };

function parseBlocks(source: string): Block[] {
  const lines = source.split('\n');
  const blocks: Block[] = [];
  let paragraph: string[] = [];

  function flushParagraph() {
    const text = paragraph.join(' ').trim();
    if (text) blocks.push({ type: 'p', text });
    paragraph = [];
  }

  for (const rawLine of lines) {
    const line = rawLine.trim();
    if (line.startsWith('### ')) {
      flushParagraph();
      blocks.push({ type: 'h3', text: line.slice(4) });
    } else if (line.startsWith('## ')) {
      flushParagraph();
      blocks.push({ type: 'h2', text: line.slice(3) });
    } else if (line === '') {
      flushParagraph();
    } else {
      paragraph.push(line);
    }
  }
  flushParagraph();
  return blocks;
}

function InlineText({ text, style }: { text: string; style: object }) {
  const theme = useAppTheme();
  const parts = text.split(/(\*\*.+?\*\*|`.+?`)/g).filter(Boolean);

  return (
    <Text style={style}>
      {parts.map((part, i) => {
        if (part.startsWith('**') && part.endsWith('**')) {
          return (
            <Text key={i} style={{ fontFamily: fonts.bodySemiBold }}>
              {part.slice(2, -2)}
            </Text>
          );
        }
        if (part.startsWith('`') && part.endsWith('`')) {
          return (
            <Text
              key={i}
              style={{ fontFamily: fonts.code, backgroundColor: theme.card, color: theme.primary }}
            >
              {' '}
              {part.slice(1, -1)}{' '}
            </Text>
          );
        }
        return <Fragment key={i}>{part}</Fragment>;
      })}
    </Text>
  );
}

export function MarkdownLite({ children }: { children: string }) {
  const theme = useAppTheme();
  const blocks = parseBlocks(children);

  return (
    <View style={styles.wrapper}>
      {blocks.map((block, i) => {
        if (block.type === 'h2') {
          return (
            <Text key={i} style={[styles.h2, { color: theme.text, fontFamily: fonts.display }]}>
              {block.text}
            </Text>
          );
        }
        if (block.type === 'h3') {
          return (
            <Text key={i} style={[styles.h3, { color: theme.text, fontFamily: fonts.bodySemiBold }]}>
              {block.text}
            </Text>
          );
        }
        return (
          <InlineText
            key={i}
            text={block.text}
            style={[styles.p, { color: theme.text, fontFamily: fonts.body }]}
          />
        );
      })}
    </View>
  );
}

const styles = StyleSheet.create({
  wrapper: { gap: spacing.sm },
  h2: { fontSize: 21, marginTop: spacing.sm },
  h3: { fontSize: 17, marginTop: spacing.xs },
  p: { fontSize: 15.5, lineHeight: 23 },
});
