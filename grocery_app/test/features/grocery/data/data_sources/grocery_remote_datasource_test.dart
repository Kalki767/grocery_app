import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_app/core/constants/urls.dart';
import 'package:grocery_app/core/errors/exceptions.dart';
import 'package:grocery_app/features/grocery/data/data_sources/grocery_remote_datasource.dart';
import 'package:grocery_app/features/grocery/domain/entities/grocery_entity.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GroceryRemoteDatasourceImpl groceryRemoteDatasourceImpl;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    groceryRemoteDatasourceImpl =
        GroceryRemoteDatasourceImpl(client: mockHttpClient);
  });

  const String id = '66be460f71fccd1506882d24';

  group('get grocery data', () {
    test('should return 200 as status ok', () async {
      //arrange

      when(mockHttpClient.get(Uri.parse(Urls.getgroceryById(id)))).thenAnswer(
          (_) async => http.Response(
              readJson('features/grocery/helpers/grocery.json'), 200));

      //act

      final result = await groceryRemoteDatasourceImpl.getGrocery(id);

      //assert
      expect(result, isA<GroceryEntity>());
    });

    test('should return 404 as status wrong', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse(Urls.getgroceryById(id))))
          .thenAnswer((_) async => http.Response('Not found', 404));

      //act
      final result = groceryRemoteDatasourceImpl.getGrocery(id);

      //assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });
}
