import AsyncStorage from '@react-native-async-storage/async-storage';

const PLACEMENT_HANDLED_KEY = 'noesis.placementHandled';

export async function hasHandledPlacement(): Promise<boolean> {
  const value = await AsyncStorage.getItem(PLACEMENT_HANDLED_KEY);
  return value === 'true';
}

export async function markPlacementHandled(): Promise<void> {
  await AsyncStorage.setItem(PLACEMENT_HANDLED_KEY, 'true');
}
