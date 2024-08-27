import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_app/features/grocery/data/models/grocery_model.dart';
import 'package:grocery_app/features/grocery/data/models/options_model.dart';
import 'package:grocery_app/features/grocery/data/repositories/grocery_repository_impl.dart';
import 'package:grocery_app/features/grocery/domain/entities/grocery_entity.dart';
import 'package:grocery_app/features/grocery/domain/entities/options_entity.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGroceryRemoteDatasource mockGroceryRemoteDatasource;
  late GroceryRepositoryImpl groceryRepositoryImpl;

  setUp(() {
    mockGroceryRemoteDatasource = MockGroceryRemoteDatasource();
    groceryRepositoryImpl = GroceryRepositoryImpl(
        groceryRemoteDatasource: mockGroceryRemoteDatasource);
  });

  group('get groceries', () {
    const OptionsEntity optionsEntity = OptionsEntity(
        id: '66be474571fccd1506882d26', name: 'Add Cheese', price: 0.5);

    const GroceryEntity groceryEntity1 = GroceryEntity(
        id: '66be460f71fccd1506882d24',
        title: 'Cheese Burger',
        imageUrl:
            'https://res.cloudinary.com/g5-mobile-track/image/upload/v1723747446/assessment/xhvgqvpt7pghwae',
        rating: 4.9,
        price: 10,
        discount: 6,
        description: 'description',
        options: [optionsEntity]);

    final List<GroceryEntity> groceryEntities = [groceryEntity1];
    test('should test when the remote data source succesfully return a value',
        () async {
      //arrange
      when(mockGroceryRemoteDatasource.getGroceries())
          .thenAnswer((_) async => groceryEntities);

      //act
      final call = await groceryRepositoryImpl.getGroceries();
      final result = call.getOrElse(() => []);

      //assert
      expect(
        Right(ilist(result)),
        equals(
          Right(ilist([groceryEntity1])),
        ),
      );
    });
  });
}
