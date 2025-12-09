import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../application/scan_controller.dart';
import '../../onboarding/data/onboarding_repository.dart';

class ScanScreen extends ConsumerWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen for state changes to navigate when data is ready
    ref.listen(scanControllerProvider, (previous, next) async {
      if (!context.mounted) return;
      if (next.hasValue && !next.isLoading && next.value!.isNotEmpty) {
        if (context.mounted) {
          context.go('/results');
        }
      } else if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Hata: ${next.error}')),
        );
      }
    });

    final scanState = ref.watch(scanControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Dikkatim Dağılıyor')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.security, size: 80, color: Colors.deepPurple),
            const SizedBox(height: 24),
            const Text(
              'Zararlı Uygulamaları Tara',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                'Yüklü uygulamaları analiz ederek çocuğunuzu koruyun.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 48),
            if (scanState.isLoading)
              const CircularProgressIndicator()
            else
              ElevatedButton.icon(
                onPressed: () {
                  ref.read(scanControllerProvider.notifier).scanApps();
                },
                icon: const Icon(Icons.search),
                label: const Text('Taramayı Başlat'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
