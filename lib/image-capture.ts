import { ImageManipulator, SaveFormat } from 'expo-image-manipulator';
import * as ImagePicker from 'expo-image-picker';

// Caps the long edge so a full-resolution phone camera photo (often
// 3000-4000px+) doesn't balloon a multi-photo submission's base64 payload
// into tens of MB — this is comfortably more resolution than an AI vision
// model needs to read a photographed page of handwriting or print, and the
// edge functions receiving these only ever validated image COUNT, never
// byte size, so nothing else was bounding this.
const MAX_DIMENSION = 1600;
const JPEG_QUALITY = 0.7;

// Converts a picked/captured image into a size-capped JPEG data URL, ready
// to send to an edge function. Shared by every screen that stages multiple
// photos before one submission (correct-homework.tsx, flashcards.tsx) so
// the size guard lives in exactly one place.
export async function assetToDataUrl(asset: ImagePicker.ImagePickerAsset): Promise<string | null> {
  try {
    const longEdge = Math.max(asset.width, asset.height);
    const context = ImageManipulator.manipulate(asset.uri);
    if (longEdge > MAX_DIMENSION) {
      const scale = MAX_DIMENSION / longEdge;
      context.resize({ width: Math.round(asset.width * scale), height: Math.round(asset.height * scale) });
    }
    const rendered = await context.renderAsync();
    const result = await rendered.saveAsync({ compress: JPEG_QUALITY, format: SaveFormat.JPEG, base64: true });
    if (!result.base64) {
      return null;
    }
    return `data:image/jpeg;base64,${result.base64}`;
  } catch (error) {
    console.error('Failed to process captured photo:', error);
    return null;
  }
}
