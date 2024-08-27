import 'package:grocery_app/features/grocery/domain/entities/grocery_entity.dart';

class Urls {
  static String baseurl =
      'https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries';
  static String getgroceryById(String id) =>
      'https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries/$id';
  static List<GroceryEntity> groceries = [];
}
