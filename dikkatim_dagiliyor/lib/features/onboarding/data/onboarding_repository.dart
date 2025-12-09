import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingRepositoryProvider = Provider<OnboardingRepository>((ref) {
  throw UnimplementedError('Initialize this provider in main.dart');
});

class OnboardingRepository {
  OnboardingRepository(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static const _onboardingCompleteKey = 'onboarding_complete';

  bool get isOnboardingCompleted =>
      _sharedPreferences.getBool(_onboardingCompleteKey) ?? false;

  Future<void> setOnboardingCompleted() async {
    await _sharedPreferences.setBool(_onboardingCompleteKey, true);
  }
}
