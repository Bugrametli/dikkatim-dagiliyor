import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/app_analysis/presentation/scan_screen.dart';
import '../../features/app_analysis/presentation/analysis_results_screen.dart';

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
  ],
);
