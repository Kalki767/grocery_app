import 'package:grocery_app/features/grocery/domain/entities/options_entity.dart';

class GroceryEntity {
  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final num price;
  final num discount;
  final String description;
  final List<OptionsEntity>? options;

  GroceryEntity(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.rating,
      required this.price,
      required this.discount,
      required this.description,
      this.options});
}
