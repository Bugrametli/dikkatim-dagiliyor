import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/app_entity.dart';
import '../data/scan_repository.dart';

final scanControllerProvider = StateNotifierProvider<ScanController, AsyncValue<List<AppEntity>>>((ref) {
  return ScanController(ref);
});

class ScanController extends StateNotifier<AsyncValue<List<AppEntity>>> {
  ScanController(this.ref) : super(const AsyncValue.data([]));

  final Ref ref;

  Future<void> scanApps() async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(scanRepositoryProvider);
      final apps = await repository.scanInstalledApps();
      if (mounted) {
        state = AsyncValue.data(apps);
      }
    } catch (e, st) {
      if (mounted) {
        state = AsyncValue.error(e, st);
      }
    }
  }
}
