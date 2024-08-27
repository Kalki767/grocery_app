import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/errors/failures.dart';
import 'package:grocery_app/features/grocery/domain/entities/grocery_entity.dart';
import 'package:grocery_app/features/grocery/domain/repositories/grocery_repository.dart';

class GetGroceryUsecase {
  final GroceryRepository _groceryRepository;

  GetGroceryUsecase({required GroceryRepository groceryRepository})
      : _groceryRepository = groceryRepository;

  Future<Either<Failure, GroceryEntity>> execute(String id) {
    return _groceryRepository.getGrocery(id);
  }
}
