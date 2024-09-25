// models/item_model.dart
class Item {
  final int id;
  final String title;
  final String imageUrl;
  final Duration totalDuration;

  Item({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.totalDuration,
  });
}
