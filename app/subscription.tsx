import { LinearGradient } from 'expo-linear-gradient';
import { router } from 'expo-router';
import { useState } from 'react';
import { ScrollView, StyleSheet, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import Animated, { FadeIn } from 'react-native-reanimated';

import { BouncyPressable } from '@/components/bouncy-pressable';
import { ScreenBackground } from '@/components/screen-background';
import { ThemedText } from '@/components/themed-text';
import { Button } from '@/components/ui/button';
import { IconSymbol } from '@/components/ui/icon-symbol';
import { Skeleton } from '@/components/ui/skeleton';
import { toast } from '@/components/ui/toast';
import { GRADIENTS, PILL_RADIUS, RADIUS, SPACING, TYPOGRAPHY } from '@/constants/design';
import { useAccessStatus } from '@/hooks/queries/use-access-status';
import { cardBorder, useThemeColors } from '@/hooks/use-theme-colors';

type PlanId = 'monthly' | 'yearly';

const PLANS: Record<PlanId, { label: string; price: string; period: string; badge?: string }> = {
  monthly: { label: 'Mensuel', price: '1 500', period: 'FCFA / mois' },
  yearly: { label: 'Annuel', price: '12 000', period: 'FCFA / an', badge: 'Économise 33%' },
};

const FEATURES = [
  {
    icon: 'sparkles' as const,
    title: 'Évaluations d’exercices illimitées',
    description: 'Le compte gratuit est limité à 3 évaluations IA par jour.',
  },
  {
    icon: 'doc.text.fill' as const,
    title: 'Corrections de devoirs illimitées',
    description: 'Scanne autant de devoirs que tu veux, sans limite quotidienne.',
  },
  {
    icon: 'checkmark.circle.fill' as const,
    title: 'Préparations de contrôle illimitées',
    description: 'Génère autant de tests d’entraînement que nécessaire.',
  },
  {
    icon: 'flame.fill' as const,
    title: 'Accès prioritaire aux nouveautés',
    description: 'Les futures fonctionnalités arrivent d’abord chez les membres Premium.',
  },
];

// No payment processor is wired up yet — access_status can only be flipped
// to 'premium' by a service-role process (see lib/subscription.ts), which
// today means nothing, since there's no webhook to run it. This screen is
// deliberately honest about that (footer note + a "bientôt disponible"
// toast instead of pretending to charge anyone) while still being a
// complete, real screen — plans/pricing/features are the actual shape the
// eventual paid flow will have, not a wireframe.
export default function SubscriptionScreen() {
  const COLORS = useThemeColors();
  const accessStatusQuery = useAccessStatus();
  const isPremium = accessStatusQuery.data === 'premium';
  const [selectedPlan, setSelectedPlan] = useState<PlanId>('yearly');

  const handleSubscribe = () => {
    toast.show('Le paiement arrive bientôt — reviens vite !', { variant: 'default' });
  };

  const styles = StyleSheet.create({
    safeArea: {
      flex: 1,
    },
    header: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      paddingHorizontal: SPACING.screen,
      paddingTop: SPACING.tight,
      paddingBottom: SPACING.element,
    },
    backButton: {
      width: 36,
      height: 36,
      borderRadius: 18,
      backgroundColor: COLORS.surface,
      alignItems: 'center',
      justifyContent: 'center',
      ...cardBorder(COLORS),
    },
    backIcon: {
      transform: [{ scaleX: -1 }],
    },
    headerTitle: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
    },
    headerSpacer: {
      width: 36,
      height: 36,
    },
    scrollContent: {
      padding: SPACING.screen,
      paddingTop: 0,
      paddingBottom: 40,
    },
    hero: {
      borderRadius: RADIUS + 6,
      padding: SPACING.section,
      alignItems: 'center',
      marginBottom: SPACING.section,
      // Fallback so the hero is never invisible if the gradient fails to paint.
      backgroundColor: '#C9971F',
    },
    heroIconBadge: {
      width: 56,
      height: 56,
      borderRadius: 28,
      backgroundColor: 'rgba(255,255,255,0.25)',
      alignItems: 'center',
      justifyContent: 'center',
      marginBottom: SPACING.tight,
    },
    heroTitle: {
      ...TYPOGRAPHY.largeTitle,
      color: '#3A2A00',
      textAlign: 'center',
      marginBottom: 6,
    },
    heroSubtitle: {
      ...TYPOGRAPHY.body,
      color: '#5C4300',
      textAlign: 'center',
    },
    sectionTitle: {
      ...TYPOGRAPHY.label,
      color: COLORS.mutedText,
      textTransform: 'uppercase',
      marginBottom: SPACING.tight,
    },
    featureRow: {
      flexDirection: 'row',
      gap: SPACING.tight,
      marginBottom: SPACING.element,
    },
    featureIconBadge: {
      width: 36,
      height: 36,
      borderRadius: 18,
      backgroundColor: COLORS.accentSoft,
      alignItems: 'center',
      justifyContent: 'center',
    },
    featureText: {
      flex: 1,
    },
    featureTitle: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
    },
    featureDescription: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
      marginTop: 2,
    },
    plansRow: {
      flexDirection: 'row',
      gap: SPACING.tight,
      marginBottom: SPACING.section,
      marginTop: SPACING.element,
    },
    planCard: {
      flex: 1,
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      borderWidth: 2,
      borderColor: COLORS.border,
      padding: SPACING.element,
    },
    planCardSelected: {
      backgroundColor: COLORS.accentSoft,
      borderColor: COLORS.accent,
    },
    planBadge: {
      alignSelf: 'flex-start',
      backgroundColor: '#F2C879',
      borderRadius: PILL_RADIUS,
      paddingVertical: 2,
      paddingHorizontal: 8,
      marginBottom: SPACING.tight,
    },
    planBadgeText: {
      fontSize: 10,
      fontWeight: '800',
      color: '#4A3400',
      textTransform: 'uppercase',
    },
    planLabel: {
      ...TYPOGRAPHY.body,
      fontWeight: '700',
      color: COLORS.text,
      marginBottom: 4,
    },
    planPrice: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
    },
    planPeriod: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
    },
    planCheck: {
      position: 'absolute',
      top: SPACING.tight,
      right: SPACING.tight,
      width: 22,
      height: 22,
      borderRadius: 11,
      backgroundColor: COLORS.accent,
      alignItems: 'center',
      justifyContent: 'center',
    },
    footerNote: {
      ...TYPOGRAPHY.caption,
      color: COLORS.mutedText,
      textAlign: 'center',
      marginTop: SPACING.element,
    },
    premiumCard: {
      backgroundColor: COLORS.surface,
      borderRadius: RADIUS,
      padding: SPACING.section,
      alignItems: 'center',
      ...cardBorder(COLORS),
    },
    premiumTitle: {
      ...TYPOGRAPHY.title,
      color: COLORS.text,
      textAlign: 'center',
      marginTop: SPACING.tight,
      marginBottom: 6,
    },
    premiumSubtitle: {
      ...TYPOGRAPHY.body,
      color: COLORS.mutedText,
      textAlign: 'center',
    },
  });

  return (
    <ScreenBackground>
      <SafeAreaView style={styles.safeArea} edges={['top', 'bottom']}>
        <View style={styles.header}>
          <BouncyPressable style={styles.backButton} onPress={() => router.back()} hitSlop={8}>
            <IconSymbol name="chevron.right" size={18} color={COLORS.text} style={styles.backIcon} />
          </BouncyPressable>
          <ThemedText style={styles.headerTitle}>Noesis Premium</ThemedText>
          <View style={styles.headerSpacer} />
        </View>

        <ScrollView contentContainerStyle={styles.scrollContent}>
          <Animated.View entering={FadeIn.duration(350)}>
            <LinearGradient colors={GRADIENTS.gold} start={{ x: 0, y: 0 }} end={{ x: 1, y: 1 }} style={styles.hero}>
              <View style={styles.heroIconBadge}>
                <IconSymbol name="crown.fill" size={28} color="#3A2A00" />
              </View>
              <ThemedText style={styles.heroTitle}>Noesis Premium</ThemedText>
              <ThemedText style={styles.heroSubtitle}>
                Profite d’un accès illimité à l’IA, sans compter tes essais quotidiens.
              </ThemedText>
            </LinearGradient>

            {accessStatusQuery.isPending ? (
              <Skeleton height={140} radius={RADIUS} />
            ) : isPremium ? (
              <View style={styles.premiumCard}>
                <IconSymbol name="checkmark.circle.fill" size={32} color={COLORS.accent} />
                <ThemedText style={styles.premiumTitle}>Tu es déjà Premium</ThemedText>
                <ThemedText style={styles.premiumSubtitle}>
                  Merci de soutenir Noesis — profite de ton accès illimité !
                </ThemedText>
              </View>
            ) : (
              <>
                <ThemedText style={styles.sectionTitle}>Ce que tu débloques</ThemedText>
                {FEATURES.map((feature) => (
                  <View key={feature.title} style={styles.featureRow}>
                    <View style={styles.featureIconBadge}>
                      <IconSymbol name={feature.icon} size={18} color={COLORS.accent} />
                    </View>
                    <View style={styles.featureText}>
                      <ThemedText style={styles.featureTitle}>{feature.title}</ThemedText>
                      <ThemedText style={styles.featureDescription}>{feature.description}</ThemedText>
                    </View>
                  </View>
                ))}

                <ThemedText style={styles.sectionTitle}>Choisis ta formule</ThemedText>
                <View style={styles.plansRow}>
                  {(Object.keys(PLANS) as PlanId[]).map((planId) => {
                    const plan = PLANS[planId];
                    const selected = selectedPlan === planId;
                    return (
                      <BouncyPressable
                        key={planId}
                        style={[styles.planCard, selected && styles.planCardSelected]}
                        onPress={() => setSelectedPlan(planId)}>
                        {plan.badge ? (
                          <View style={styles.planBadge}>
                            <ThemedText style={styles.planBadgeText}>{plan.badge}</ThemedText>
                          </View>
                        ) : null}
                        <ThemedText style={styles.planLabel}>{plan.label}</ThemedText>
                        <ThemedText style={styles.planPrice}>{plan.price}</ThemedText>
                        <ThemedText style={styles.planPeriod}>{plan.period}</ThemedText>
                        {selected ? (
                          <View style={styles.planCheck}>
                            <IconSymbol name="checkmark" size={13} color={COLORS.accentText} />
                          </View>
                        ) : null}
                      </BouncyPressable>
                    );
                  })}
                </View>

                <Button label="S'abonner" onPress={handleSubscribe} />
                <ThemedText style={styles.footerNote}>
                  Le paiement dans l’app arrive bientôt. Résiliable à tout moment une fois disponible.
                </ThemedText>
              </>
            )}
          </Animated.View>
        </ScrollView>
      </SafeAreaView>
    </ScreenBackground>
  );
}
