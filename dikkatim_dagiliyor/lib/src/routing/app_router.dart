import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/app_analysis/presentation/scan_screen.dart';
import '../../features/app_analysis/presentation/analysis_results_screen.dart';
import '../../features/app_analysis/presentation/rules_screen.dart';
import '../../features/app_analysis/presentation/rules_screen.dart';
import '../../features/app_analysis/presentation/usage_limits_screen.dart';
import '../../features/dashboard/presentation/home_screen.dart';

final goRouter = GoRouter(
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
);
