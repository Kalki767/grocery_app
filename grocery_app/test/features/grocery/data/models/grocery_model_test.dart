import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_app/features/grocery/data/models/grocery_model.dart';
import 'package:grocery_app/features/grocery/data/models/options_model.dart';
import 'package:grocery_app/features/grocery/domain/entities/grocery_entity.dart';
import 'package:grocery_app/features/grocery/domain/entities/options_entity.dart';

import '../../helpers/json_reader.dart';

void main() {
  const OptionsModel optionsModel = OptionsModel(
      id: '66be474571fccd1506882d26', name: 'Add Cheese', price: 0.5);

  GroceryModel groceryModel = GroceryModel(
      id: '66be460f71fccd1506882d24',
      title: 'Cheese Burger',
      imageUrl:
          'https://res.cloudinary.com/g5-mobile-track/image/upload/v1723747446/assessment/xhvgqvpt7pghwae',
      rating: 4.9,
      price: 10,
      discount: 6,
      description: 'description',
      options: [optionsModel]);

  test('should test if the grocerymodel is an instance of the grocery entity',
      () {
    expect(groceryModel, isA<GroceryEntity>());
  });

  test(
      'should test if the fromJson is converting json file into grocery model properly',
      () async {
    final Map<String, dynamic> jsonMap =
        json.decode(readJson('features/grocery/helpers/grocery.json'));

    final result = GroceryModel.fromJson(jsonMap);
    expect(result, equals(groceryModel));
  });

  test('should test if the tojson is mapping correctly', () async {
    final result = groceryModel.toJson();
    final expectedMap = {
      "id": "66be460f71fccd1506882d24",
      "title": "Cheese Burger",
      "imageUrl":
          "https://res.cloudinary.com/g5-mobile-track/image/upload/v1723747446/assessment/xhvgqvpt7pghwae",
      "rating": 4.9,
      "price": 10,
      "discount": 6,
      "description": "description",
      "options": [
        {"id": "66be474571fccd1506882d26", "name": "Add Cheese", "price": 0.5}
      ]
    };

    expect(result, equals(expectedMap));
  });
}
