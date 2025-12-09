import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/app_entity.dart';

final scanRepositoryProvider = Provider<ScanRepository>((ref) {
  return MockScanRepository();
});

abstract class ScanRepository {
  Future<List<AppEntity>> scanInstalledApps();
}

class MockScanRepository implements ScanRepository {
  @override
  Future<List<AppEntity>> scanInstalledApps() async {
    // Simulate network/scanning delay
    await Future.delayed(const Duration(seconds: 2));

    return [
      const AppEntity(
        id: 'com.instagram.android',
        name: 'Instagram',
        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/2048px-Instagram_logo_2016.svg.png',
        dangerLevel: 3,
        category: 'Social',
      ),
      const AppEntity(
        id: 'com.tiktok.android',
        name: 'TikTok',
        iconUrl: 'https://sf-tb-sg.ibytedtos.com/obj/eden-sg/uhtyvueh7nulogpoguhm/tiktok-icon2.png',
        dangerLevel: 3,
        category: 'Entertainment',
      ),
      const AppEntity(
        id: 'com.google.android.youtube',
        name: 'YouTube',
        iconUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/YouTube_full-color_icon_%282017%29.svg/1024px-YouTube_full-color_icon_%282017%29.svg.png',
        dangerLevel: 2,
        category: 'Video',
      ),
      const AppEntity(
        id: 'com.apple.calculator',
        name: 'Calculator',
        iconUrl: '',
        dangerLevel: 1,
        category: 'Utility',
      ),
    ];
  }
}
