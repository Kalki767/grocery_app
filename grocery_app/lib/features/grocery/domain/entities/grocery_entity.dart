import 'package:grocery_app/features/grocery/domain/entities/options_entity.dart';
import 'package:equatable/equatable.dart';

class GroceryEntity extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final double rating;
  final num price;
  final num discount;
  final String description;
  final List<OptionsEntity>? options;

  const GroceryEntity(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.rating,
      required this.price,
      required this.discount,
      required this.description,
      this.options});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, title, imageUrl, rating, price, discount, description, options];
}
