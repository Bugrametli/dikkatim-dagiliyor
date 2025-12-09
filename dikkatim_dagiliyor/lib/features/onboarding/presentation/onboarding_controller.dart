import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_controller.g.dart';

@riverpod
class OnboardingController extends _$OnboardingController {
  static const _onboardingCompletedKey = 'onboarding_completed';

  @override
  Future<bool> build() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboardingCompletedKey) ?? false;
  }

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingCompletedKey, true);
    state = const AsyncValue.data(true);
  }
  
  // Method to check if onboarding should be shown based on debug mode
  bool shouldShowOnboarding() {
    // If in debug mode, always show onboarding (conceptually).
    // However, the router needs to know the *stored* state vs the *debug override*.
    // For simplicity, the router will handle the debug check.
    // This controller primarily manages persistent state.
    // We could expose a getter here, but checking kDebugMode in router is cleaner.
    return state.value ?? false;
  }
}
