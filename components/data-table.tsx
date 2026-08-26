import { StyleSheet, View } from 'react-native';

import { ThemedText } from '@/components/themed-text';
import { RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';
import { formatMathNotation } from '@/lib/math-notation';

export type DataTableData = { headers: string[]; rows: string[][] };

export function DataTable({ table }: { table: DataTableData }) {
  const COLORS = useThemeColors();
  const styles = StyleSheet.create({
    table: {
      marginTop: SPACING.tight,
      borderRadius: RADIUS,
      overflow: 'hidden',
      ...cardBorder(COLORS),
    },
    row: {
      flexDirection: 'row',
      borderTopWidth: 1,
      borderTopColor: COLORS.border,
    },
    headerRow: {
      borderTopWidth: 0,
      backgroundColor: COLORS.accentSoft,
    },
    cell: {
      flex: 1,
      ...TYPOGRAPHY.caption,
      color: COLORS.text,
      padding: SPACING.tight,
    },
    headerCell: {
      fontWeight: '700',
      color: COLORS.accent,
    },
  });

  return (
    <View style={styles.table}>
      <View style={[styles.row, styles.headerRow]}>
        {table.headers.map((header, index) => (
          <ThemedText key={index} style={[styles.cell, styles.headerCell]}>
            {formatMathNotation(header)}
          </ThemedText>
        ))}
      </View>
      {table.rows.map((row, rowIndex) => (
        <View key={rowIndex} style={styles.row}>
          {row.map((cell, cellIndex) => (
            <ThemedText key={cellIndex} style={styles.cell}>
              {formatMathNotation(cell)}
            </ThemedText>
          ))}
        </View>
      ))}
    </View>
  );
}
