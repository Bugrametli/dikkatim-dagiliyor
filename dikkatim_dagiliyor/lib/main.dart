import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dikkatim_dagiliyor/features/onboarding/data/onboarding_repository.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  if (kDebugMode) {
    await sharedPreferences.remove('onboarding_complete');
  }

  runApp(App(sharedPreferences: sharedPreferences));
}
