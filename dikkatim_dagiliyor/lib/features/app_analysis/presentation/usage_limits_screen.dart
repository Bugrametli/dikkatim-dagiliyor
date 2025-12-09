import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../application/scan_controller.dart';
import '../domain/app_entity.dart';
import '../../onboarding/presentation/onboarding_controller.dart';

class UsageLimitsScreen extends ConsumerWidget {
  const UsageLimitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scanState = ref.watch(scanControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Zaman Sınırları'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: scanState.when(
        data: (apps) {
          // Filter out dangerous apps (show only Riskli and Güvenli)
          final allowedApps = apps.where((app) => app.dangerLevel < 3).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Kalan Uygulamalar',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Bu uygulamalar için belirlenen günlük kullanım süreleri aşağıdadır.',
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
                child: allowedApps.isEmpty
                    ? const Center(child: Text('Uygulama bulunamadı.'))
                    : ListView.builder(
                        itemCount: allowedApps.length,
                        itemBuilder: (context, index) {
                          final app = allowedApps[index];
                          return _UsageLimitListTile(app: app);
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
            onPressed: () async {
              // Mark onboarding as complete
              await ref.read(onboardingControllerProvider.notifier).completeOnboarding();

              if (!context.mounted) return;

              // Apply rules and navigate to home
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Kurallar başarıyla uygulandı.')),
              );
              // Small delay to let the user see the message
              Future.delayed(const Duration(seconds: 1), () {
                if (context.mounted) context.go('/home');
              });
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Kuralları Uygula',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class _UsageLimitListTile extends StatelessWidget {
  final AppEntity app;

  const _UsageLimitListTile({required this.app});

  Color _getDangerColor(int level) {
    switch (level) {
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
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          backgroundImage: app.iconUrl.isNotEmpty ? NetworkImage(app.iconUrl) : null,
          child: app.iconUrl.isEmpty ? const Icon(Icons.apps) : null,
        ),
        title: Text(app.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(app.category ?? 'Bilinmeyen Kategori'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'Günlük Limit',
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
            const SizedBox(height: 2),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _getDangerColor(app.dangerLevel).withValues(alpha: 0.1),
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
          ],
        ),
      ),
    );
  }
}
