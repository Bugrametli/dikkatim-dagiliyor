
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:dikkatim_dagiliyor/features/app_analysis/presentation/scan_screen.dart';
import 'package:dikkatim_dagiliyor/features/app_analysis/presentation/analysis_results_screen.dart';
import 'package:dikkatim_dagiliyor/features/app_analysis/presentation/rules_screen.dart';
import 'package:dikkatim_dagiliyor/features/app_analysis/presentation/usage_limits_screen.dart';
import '../../features/dashboard/presentation/home_screen.dart';
import '../../features/onboarding/data/onboarding_repository.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final onboardingRepository = ref.watch(onboardingRepositoryProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isOnboardingCompleted = onboardingRepository.isOnboardingCompleted;
      final path = state.uri.path;

      // If onboarding is NOT completed
      if (!isOnboardingCompleted) {
        // Allow these specific onboarding routes
        if (path == '/' || 
            path == '/results' || 
            path == '/rules' || 
            path == '/limits') {
          return null;
        }
        // Redirect any other attempt (like /home) to start
        return '/';
      }

      // If onboarding IS completed
      if (path == '/') {
        return '/home';
      }

      return null;
    },

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
  );
});
