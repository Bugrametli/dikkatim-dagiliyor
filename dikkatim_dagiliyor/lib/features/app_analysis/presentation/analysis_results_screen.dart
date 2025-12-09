import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../application/scan_controller.dart';
import '../domain/app_entity.dart';

class AnalysisResultsScreen extends ConsumerWidget {
  const AnalysisResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scanState = ref.watch(scanControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Analysis Results'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: scanState.when(
        data: (apps) {
          if (apps.isEmpty) {
            return const Center(child: Text('No apps found.'));
          }
          return ListView.builder(
            itemCount: apps.length,
            itemBuilder: (context, index) {
              final app = apps[index];
              return _AppListTile(app: app);
            },
          );
        },
        error: (err, _) => Center(child: Text('Error: $err')),
        loading: () => const Center(child: CircularProgressIndicator()),
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

  String _getDangerText(int level) {
    switch (level) {
      case 3:
        return 'Dangerous';
      case 2:
        return 'Warning';
      case 1:
        return 'Safe';
      default:
        return 'Unknown';
    }
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
        subtitle: Text(app.category ?? 'Unknown Category'),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _getDangerColor(app.dangerLevel).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _getDangerColor(app.dangerLevel)),
          ),
          child: Text(
            _getDangerText(app.dangerLevel),
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
