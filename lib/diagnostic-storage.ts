import AsyncStorage from '@react-native-async-storage/async-storage';

const DIAGNOSTIC_COMPLETED_KEY = 'noesis.diagnosticCompleted';

export async function hasCompletedDiagnostic(): Promise<boolean> {
  const value = await AsyncStorage.getItem(DIAGNOSTIC_COMPLETED_KEY);
  return value === 'true';
}

export async function markDiagnosticCompleted(): Promise<void> {
  await AsyncStorage.setItem(DIAGNOSTIC_COMPLETED_KEY, 'true');
}
