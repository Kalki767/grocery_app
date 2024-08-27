import 'dart:convert';

import 'package:grocery_app/core/constants/urls.dart';
import 'package:grocery_app/core/errors/exceptions.dart';
import 'package:grocery_app/features/grocery/data/models/grocery_model.dart';
import 'package:grocery_app/features/grocery/domain/entities/grocery_entity.dart';
import 'package:http/http.dart' as http;

abstract class GroceryRemoteDatasource {
  Future<List<GroceryEntity>> getGroceries();
  Future<GroceryEntity> getGrocery(String id);
}

class GroceryRemoteDatasourceImpl extends GroceryRemoteDatasource {
  final http.Client _client;

  GroceryRemoteDatasourceImpl({required http.Client client}) : _client = client;
  @override
  Future<List<GroceryEntity>> getGroceries() async {
    List<GroceryEntity> groceryEntity = [];
    final response = await _client.get(Uri.parse(Urls.baseurl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      for (var el in data['data']) {
        final GroceryModel val = GroceryModel.fromJson(el);
        groceryEntity.add(GroceryModel.toEntity(val));
      }

      return groceryEntity;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<GroceryEntity> getGrocery(String id) async {
    final response = await _client.get(Uri.parse(Urls.getgroceryById(id)));
    

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final val = GroceryModel.fromJson(data['data']);
      final result = GroceryModel.toEntity(val);
      return result;
    } else {
      throw ServerException();
    }
  }
}
