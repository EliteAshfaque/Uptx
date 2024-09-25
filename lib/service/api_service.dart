import '../model/item_model.dart';

class ApiService {
  static Future<List<Item>> getItems(int page, int limit) async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay

    // Simulating the API response with unique titles for Bitcoin
    return List.generate(limit, (index) {
      int itemId = (page - 1) * limit + index + 1;
      return Item(
        id: itemId,
        title: 'Bitcoin ', // Unique title for each item
        imageUrl: 'https://i.giphy.com/media/v1.Y2lkPTc5MGI3NjExYWNucWJtbnE0dmlsMzF5czNsN3g5N2R0aXA5NmdmNTBjemJkaXBjbSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/U7y1PUFXsAUyZKcOOF/giphy.gif',
        totalDuration: Duration(minutes: 1 + itemId % 5), // Randomize duration
      );
    });
  }
}
