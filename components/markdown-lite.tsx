import { Fragment } from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { useAppTheme } from '../hooks/use-app-theme';
import { fonts, spacing } from '../constants/theme';

// Rendu Markdown volontairement minimal : ne gère que ce que le pipeline de
// génération produit (##, ###, **gras**, `code`, paragraphes, listes à puces
// et numérotées) — pas de dépendance markdown-it/linkify-it (vulnérable et
// cassait le bundle Metro).

type Block =
  | { type: 'h2'; text: string }
  | { type: 'h3'; text: string }
  | { type: 'p'; text: string }
  | { type: 'ul'; items: string[] }
  | { type: 'ol'; items: string[] };

const BULLET_RE = /^[-*]\s+(.*)$/;
const NUMBERED_RE = /^\d+[.)]\s+(.*)$/;

function parseBlocks(source: string): Block[] {
  const lines = source.split('\n');
  const blocks: Block[] = [];
  let paragraph: string[] = [];
  let listItems: string[] = [];
  let listType: 'ul' | 'ol' | null = null;

  function flushParagraph() {
    const text = paragraph.join(' ').trim();
    if (text) blocks.push({ type: 'p', text });
    paragraph = [];
  }

  function flushList() {
    if (listType && listItems.length > 0) blocks.push({ type: listType, items: listItems });
    listItems = [];
    listType = null;
  }

  for (const rawLine of lines) {
    const line = rawLine.trim();
    const bulletMatch = line.match(BULLET_RE);
    const numberedMatch = line.match(NUMBERED_RE);

    if (line.startsWith('### ')) {
      flushParagraph();
      flushList();
      blocks.push({ type: 'h3', text: line.slice(4) });
    } else if (line.startsWith('## ')) {
      flushParagraph();
      flushList();
      blocks.push({ type: 'h2', text: line.slice(3) });
    } else if (bulletMatch) {
      flushParagraph();
      if (listType !== 'ul') flushList();
      listType = 'ul';
      listItems.push(bulletMatch[1]);
    } else if (numberedMatch) {
      flushParagraph();
      if (listType !== 'ol') flushList();
      listType = 'ol';
      listItems.push(numberedMatch[1]);
    } else if (line === '') {
      flushParagraph();
      flushList();
    } else {
      flushList();
      paragraph.push(line);
    }
  }
  flushParagraph();
  flushList();
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
        if (block.type === 'ul' || block.type === 'ol') {
          return (
            <View key={i} style={styles.list}>
              {block.items.map((item, j) => (
                <View key={j} style={styles.listRow}>
                  <Text style={[styles.listMarker, { color: theme.textMuted, fontFamily: fonts.body }]}>
                    {block.type === 'ul' ? '•' : `${j + 1}.`}
                  </Text>
                  <InlineText
                    text={item}
                    style={[styles.p, styles.listItemText, { color: theme.text, fontFamily: fonts.body }]}
                  />
                </View>
              ))}
            </View>
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
  list: { gap: spacing.xs },
  listRow: { flexDirection: 'row', gap: spacing.xs },
  listMarker: { fontSize: 15.5, lineHeight: 23 },
  listItemText: { flex: 1 },
});
