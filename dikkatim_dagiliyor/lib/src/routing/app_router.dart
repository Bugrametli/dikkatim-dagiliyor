import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:dikkatim_dagiliyor/features/app_analysis/presentation/scan_screen.dart';
import 'package:dikkatim_dagiliyor/features/app_analysis/presentation/analysis_results_screen.dart';
import 'package:dikkatim_dagiliyor/features/app_analysis/presentation/rules_screen.dart';
import 'package:dikkatim_dagiliyor/features/app_analysis/presentation/usage_limits_screen.dart';
import '../../features/dashboard/presentation/home_screen.dart';
import '../../features/onboarding/presentation/onboarding_controller.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const ScanScreen(),
      ),
      GoRoute(
        path: '/results',
        builder: (context, state) => const AnalysisResultsScreen(),
      ),
      GoRoute(
        path: '/rules',
        builder: (context, state) => const RulesScreen(),
      ),
      GoRoute(
        path: '/limits',
        builder: (context, state) => const UsageLimitsScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
    redirect: (context, state) {
      if (kDebugMode) {
        return null;
      }

      final onboardingState = ref.read(onboardingControllerProvider);
      final isOnboardingCompleted = onboardingState.asData?.value ?? false;
      
      final isGoingToOnboarding = state.uri.path == '/' ||
          state.uri.path == '/results' ||
          state.uri.path == '/rules' ||
          state.uri.path == '/limits';

      if (isOnboardingCompleted && isGoingToOnboarding) {
        return '/home';
      }

      return null;
    },
  );
});
