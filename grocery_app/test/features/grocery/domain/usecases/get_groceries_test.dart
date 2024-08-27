import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_app/features/grocery/domain/entities/grocery_entity.dart';
import 'package:grocery_app/features/grocery/domain/usecases/get_groceries_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetGroceriesUsecase getGroceriesUsecase;
  late MockGroceryRepository mockGroceryRepository;

  setUp(() {
    mockGroceryRepository = MockGroceryRepository();
    getGroceriesUsecase =
        GetGroceriesUsecase(groceryRepository: mockGroceryRepository);
  });

  const String id = '66be460f71fccd1506882d24';

  const GroceryEntity groceryEntity = GroceryEntity(
      id: id,
      title: 'Chicken Burger',
      imageUrl:
          'https://res.cloudinary.com/g5-mobile-track/image/upload/v1723747446/assessment/xhvgqvpt7pghwae',
      rating: 4.9,
      price: 10,
      discount: 6,
      description: 'description');

  const List<GroceryEntity> groceryEntityList = [groceryEntity];
  test(
      'should test if the getgroceries usecase is sending the data properly to the repository',
      () async {
    //arrange
    when(mockGroceryRepository.getGroceries())
        .thenAnswer((_) async => const Right(groceryEntityList));

    //act
    final result = await getGroceriesUsecase.execute();

    //assert
    expect(result, equals(const Right(groceryEntityList)));
  });
}
