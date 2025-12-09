import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../application/scan_controller.dart';
import '../domain/app_entity.dart';

class RulesScreen extends ConsumerWidget {
  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scanState = ref.watch(scanControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kurallar'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: scanState.when(
        data: (apps) {
          final dangerousApps = apps.where((app) => app.dangerLevel == 3).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Silinecek Uygulamalar',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Bu uygulamalar dikkatinizi aşıra derecede dağıttığı ve bağımlılık yaptığı için kullanımına izin verilmeyecektir.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: dangerousApps.isEmpty
                    ? const Center(child: Text('Silinecek uygulama bulunamadı.'))
                    : ListView.builder(
                        itemCount: dangerousApps.length,
                        itemBuilder: (context, index) {
                          final app = dangerousApps[index];
                          return _AppListTile(app: app);
                        },
                      ),
              ),
            ],
          );
        },
        error: (err, _) => Center(child: Text('Hata: $err')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              context.push('/limits');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Uygulamaları Sildim',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class _AppListTile extends StatelessWidget {
  final AppEntity app;

  const _AppListTile({required this.app});

  Color _getDangerColor(int level) {
    switch (level) {
      case 3:
        return Colors.red;
      case 2:
        return Colors.orange;
      case 1:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  String _formatDuration(Duration duration) {
    if (duration.inHours > 0) {
      if (duration.inMinutes % 60 == 0) {
        return '${duration.inHours} sa';
      }
      return '${duration.inHours} sa ${duration.inMinutes % 60} dk';
    }
    return '${duration.inMinutes} dk';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              backgroundImage: app.iconUrl.isNotEmpty ? NetworkImage(app.iconUrl) : null,
              child: app.iconUrl.isEmpty ? const Icon(Icons.apps) : null,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.block, color: Colors.red, size: 14),
              ),
            ),
          ],
        ),
        title: Text(app.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(app.category ?? 'Bilinmeyen Kategori'),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _getDangerColor(app.dangerLevel).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _getDangerColor(app.dangerLevel)),
          ),
          child: Text(
            _formatDuration(app.usageLimit),
            style: TextStyle(
              color: _getDangerColor(app.dangerLevel),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
