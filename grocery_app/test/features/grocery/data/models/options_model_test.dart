import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_app/features/grocery/data/models/options_model.dart';
import 'package:grocery_app/features/grocery/domain/entities/options_entity.dart';

import '../../helpers/json_reader.dart';

void main() {
  const OptionsModel optionsModel = OptionsModel(
      id: '66be474571fccd1506882d26', name: 'Add Cheese', price: 0.5);

  test('should test if the optionsmodel is an instance of the options entity',
      () {
    expect(optionsModel, isA<OptionsEntity>());
  });
  test(
      'should test if the fromJson is converting json file into grocery model properly',
      () async {
    final Map<String, dynamic> jsonMap =
        json.decode(readJson('features/grocery/helpers/options.json'));

    final result = OptionsModel.fromJson(jsonMap);
    expect(result, equals(optionsModel));
  });
  test('should test if the tojson is mapping correctly', () async {
    final result = optionsModel.toJson();
    final expectedMap = {
      "id": "66be474571fccd1506882d26",
      "name": "Add Cheese",
      "price": 0.5
    };

    expect(result, equals(expectedMap));
  });
}
