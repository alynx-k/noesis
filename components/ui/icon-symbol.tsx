// Fallback for using MaterialIcons on Android and web.

import MaterialIcons from '@expo/vector-icons/MaterialIcons';
import { SymbolWeight, SymbolViewProps } from 'expo-symbols';
import { ComponentProps } from 'react';
import { OpaqueColorValue, type StyleProp, type TextStyle } from 'react-native';

type IconMapping = Record<SymbolViewProps['name'], ComponentProps<typeof MaterialIcons>['name']>;
export type IconSymbolName = keyof typeof MAPPING;

/**
 * Add your SF Symbols to Material Icons mappings here.
 * - see Material Icons in the [Icons Directory](https://icons.expo.fyi).
 * - see SF Symbols in the [SF Symbols](https://developer.apple.com/sf-symbols/) app.
 */
const MAPPING = {
  'house.fill': 'home',
  'paperplane.fill': 'send',
  'chevron.left.forwardslash.chevron.right': 'code',
  'chevron.right': 'chevron-right',
  'chevron.left': 'chevron-left',
  'hourglass': 'hourglass-empty',
  'lock.fill': 'lock',
  'checkmark.circle.fill': 'check-circle',
  'checkmark': 'check',
  'person.2.fill': 'group',
  'person.fill': 'person',
  'sparkles': 'auto-awesome',
  'gearshape.fill': 'settings',
  'flame.fill': 'local-fire-department',
  'trophy.fill': 'emoji-events',
  'rectangle.portrait.and.arrow.right': 'logout',
  'leaf.fill': 'eco',
  'doc.text.fill': 'description',
  'globe': 'public',
  'function': 'calculate',
  'text.bubble.fill': 'translate',
  'book.fill': 'menu-book',
  'heart.fill': 'favorite',
  'atom': 'science',
  'flag.fill': 'flag',
  'character.book.closed.fill': 'language',
  'brain.head.profile': 'psychology',
  'desktopcomputer': 'computer',
  'hand.thumbsup.fill': 'thumb-up',
  'hand.thumbsdown.fill': 'thumb-down',
  'arrow.clockwise': 'refresh',
  'doc.on.doc': 'content-copy',
  'speaker.wave.2.fill': 'volume-up',
  'stop.fill': 'stop',
  'line.3.horizontal': 'menu',
  'plus': 'add',
  'trash.fill': 'delete',
  'pencil': 'edit',
  'ellipsis': 'more-horiz',
  'xmark': 'close',
  'lightbulb.fill': 'lightbulb',
  'crown.fill': 'workspace-premium',
  'flask.fill': 'science',
  'clock.arrow.circlepath': 'history',
  'camera.fill': 'photo-camera',
  'paperclip': 'attach-file',
  'mic.fill': 'mic',
  'chevron.down': 'expand-more',
} as IconMapping;

/**
 * An icon component that uses native SF Symbols on iOS, and Material Icons on Android and web.
 * This ensures a consistent look across platforms, and optimal resource usage.
 * Icon `name`s are based on SF Symbols and require manual mapping to Material Icons.
 */
export function IconSymbol({
  name,
  size = 24,
  color,
  style,
}: {
  name: IconSymbolName;
  size?: number;
  color: string | OpaqueColorValue;
  style?: StyleProp<TextStyle>;
  weight?: SymbolWeight;
}) {
  return <MaterialIcons color={color} size={size} name={MAPPING[name]} style={style} />;
}
