import 'package:grocery_app/features/grocery/data/models/options_model.dart';
import 'package:grocery_app/features/grocery/domain/entities/grocery_entity.dart';

class GroceryModel extends GroceryEntity {
  GroceryModel({
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.rating,
    required super.price,
    required super.discount,
    required super.description,
    required super.options,
  });

  factory GroceryModel.fromJson(Map<String, dynamic> json) {
    return GroceryModel(
        id: json['id'],
        title: json['title'],
        imageUrl: json['imageUrl'],
        rating: (json['rating'] as num).toDouble(),
        price: json['price'],
        discount: json['discount'],
        description: json['description'],
        options: (json['options'] as List<dynamic>)
            .map((option) => OptionsModel.fromJson(option))
            .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'rating': rating,
      'price': price,
      'discount': discount,
      'description': description,
      'options':
          options.map((option) => (option as OptionsModel).toJson()).toList(),
    };
  }

  static GroceryEntity toEntity(GroceryModel model) {
    return GroceryEntity(
      id: model.id,
      title: model.title,
      imageUrl: model.imageUrl,
      rating: model.rating,
      price: model.price,
      discount: model.discount,
      description: model.description,
      options: model.options,
    );
  }

  static List<GroceryEntity> toEntities(List<GroceryModel> models) {
    return models.map((model) => toEntity(model)).toList();
  }

  static GroceryModel toModel(GroceryEntity grocery) {
    return GroceryModel(
      id: grocery.id,
      title: grocery.title,
      imageUrl: grocery.imageUrl,
      rating: grocery.rating,
      price: grocery.price,
      discount: grocery.discount,
      description: grocery.description,
      options: grocery.options,
    );
  }

  //from json list
  static List<GroceryModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => GroceryModel.fromJson(json)).toList();
  }
}
