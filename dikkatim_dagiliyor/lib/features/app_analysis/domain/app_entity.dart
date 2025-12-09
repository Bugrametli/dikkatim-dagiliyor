class AppEntity {
  final String id;
  final String name;
  final String iconUrl;
  final int dangerLevel;
  final String? category;

  const AppEntity({
    required this.id,
    required this.name,
    required this.iconUrl,
    this.dangerLevel = 0,
    this.category,
  });
}
