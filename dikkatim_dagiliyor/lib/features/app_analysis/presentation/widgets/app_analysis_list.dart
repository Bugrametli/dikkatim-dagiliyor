import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/scan_controller.dart';
import '../../domain/app_entity.dart';

class AppAnalysisList extends ConsumerStatefulWidget {
  const AppAnalysisList({super.key});

  @override
  ConsumerState<AppAnalysisList> createState() => _AppAnalysisListState();
}

class _AppAnalysisListState extends ConsumerState<AppAnalysisList> {
  int _selectedSegment = 0; // 0: Tehlikeli, 1: Riskli, 2: Güvenli

  @override
  Widget build(BuildContext context) {
    final scanState = ref.watch(scanControllerProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                AnimatedAlign(
                  duration: const Duration(milliseconds: 200),
                  alignment: _selectedSegment == 0
                      ? Alignment.centerLeft
                      : _selectedSegment == 1
                          ? Alignment.center
                          : Alignment.centerRight,
                  child: Container(
                    width: (MediaQuery.of(context).size.width - 32) / 3 - 8, // Split into 3 equal parts
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withValues(alpha: 0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedSegment = 0),
                        behavior: HitTestBehavior.opaque,
                        child: Center(
                          child: Text(
                            'Tehlikeli',
                            style: TextStyle(
                              fontWeight: _selectedSegment == 0 ? FontWeight.bold : FontWeight.normal,
                              color: _selectedSegment == 0 ? Colors.black : Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedSegment = 1),
                        behavior: HitTestBehavior.opaque,
                        child: Center(
                          child: Text(
                            'Riskli',
                            style: TextStyle(
                              fontWeight: _selectedSegment == 1 ? FontWeight.bold : FontWeight.normal,
                              color: _selectedSegment == 1 ? Colors.black : Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedSegment = 2),
                        behavior: HitTestBehavior.opaque,
                        child: Center(
                          child: Text(
                            'Güvenli',
                            style: TextStyle(
                              fontWeight: _selectedSegment == 2 ? FontWeight.bold : FontWeight.normal,
                              color: _selectedSegment == 2 ? Colors.black : Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: scanState.when(
            data: (apps) {
              final filteredApps = apps.where((app) {
                if (_selectedSegment == 0) {
                  // Tehlikeli: Dangerous (3)
                  return app.dangerLevel == 3;
                } else if (_selectedSegment == 1) {
                  // Riskli: Warning (2)
                  return app.dangerLevel == 2;
                } else {
                  // Güvenli: Safe (1) or unknown (0)
                  return app.dangerLevel <= 1;
                }
              }).toList();

              if (filteredApps.isEmpty) {
                String message;
                switch (_selectedSegment) {
                  case 0:
                    message = 'Tehlikeli uygulama bulunamadı.';
                    break;
                  case 1:
                    message = 'Riskli uygulama bulunamadı.';
                    break;
                  default:
                    message = 'Güvenli uygulama bulunamadı.';
                }
                return Center(child: Text(message));
              }
              return ListView.builder(
                itemCount: filteredApps.length,
                itemBuilder: (context, index) {
                  final app = filteredApps[index];
                  return AppListTile(app: app);
                },
              );
            },
            error: (err, _) => Center(child: Text('Hata: $err')),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }
}

class AppListTile extends StatelessWidget {
  final AppEntity app;

  const AppListTile({super.key, required this.app});

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
      ),
    );
  }
}
