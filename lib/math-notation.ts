// Course content is authored as plain text ("H2O", "CO2", "Ca2+", "3/2"),
// which read like typos rather than notation. This rewrites the common
// collège/lycée patterns (chemical formulas, ion charges, simple fractions)
// into real Unicode super/subscript characters so they render properly in
// plain <Text> — no custom inline-math widget needed.
const SUPERSCRIPT_DIGITS: Record<string, string> = {
  '0': '⁰', '1': '¹', '2': '²', '3': '³', '4': '⁴',
  '5': '⁵', '6': '⁶', '7': '⁷', '8': '⁸', '9': '⁹',
};
const SUBSCRIPT_DIGITS: Record<string, string> = {
  '0': '₀', '1': '₁', '2': '₂', '3': '₃', '4': '₄',
  '5': '₅', '6': '₆', '7': '₇', '8': '₈', '9': '₉',
};

function toSuperscript(digits: string): string {
  return digits.split('').map((d) => SUPERSCRIPT_DIGITS[d] ?? d).join('');
}
function toSubscript(digits: string): string {
  return digits.split('').map((d) => SUBSCRIPT_DIGITS[d] ?? d).join('');
}

// Common collège/lycée chemistry symbols only — deliberately not "any
// capital letter" to avoid mangling ordinary letter+number text (a course
// reference, a grade abbreviation) that just happens to be adjacent.
const ELEMENTS = [
  'Na', 'Cl', 'Ca', 'Mg', 'Fe', 'Cu', 'Zn', 'Al', 'Ag', 'Au', 'Pb', 'Br', 'He', 'Ne', 'Mn', 'Ni', 'Sn',
  'H', 'O', 'C', 'N', 'S', 'K', 'I', 'P',
].sort((a, b) => b.length - a.length);
const ELEMENT_PATTERN = ELEMENTS.join('|');

export function formatMathNotation(text: string): string {
  let result = text;

  // Ion charges: Ca2+ -> Ca²⁺, Cl- -> Cl⁻
  result = result.replace(new RegExp(`\\b(${ELEMENT_PATTERN})(\\d+)([+-])`, 'g'), (_match, element: string, digits: string, sign: string) => `${element}${toSuperscript(digits)}${sign === '+' ? '⁺' : '⁻'}`);
  result = result.replace(new RegExp(`\\b(${ELEMENT_PATTERN})([+-])(?=\\b)`, 'g'), (_match, element: string, sign: string) => `${element}${sign === '+' ? '⁺' : '⁻'}`);

  // Molecular formulas: H2O -> H₂O, CO2 -> CO₂
  result = result.replace(new RegExp(`\\b(${ELEMENT_PATTERN})(\\d+)`, 'g'), (_match, element: string, digits: string) => `${element}${toSubscript(digits)}`);

  // Simple inline fractions: 3/2 -> ³⁄₂
  result = result.replace(/\b(\d{1,3})\/(\d{1,3})\b/g, (_match, num: string, den: string) => `${toSuperscript(num)}⁄${toSubscript(den)}`);

  return result;
}
