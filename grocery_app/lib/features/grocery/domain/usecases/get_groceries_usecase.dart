import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/errors/failures.dart';
import 'package:grocery_app/features/grocery/domain/entities/grocery_entity.dart';
import 'package:grocery_app/features/grocery/domain/repositories/grocery_repository.dart';

class GetGroceriesUsecase {
  final GroceryRepository _groceryRepository;

  GetGroceriesUsecase({required GroceryRepository groceryRepository})
      : _groceryRepository = groceryRepository;

  Future<Either<Failure, List<GroceryEntity>>> execute() {
    return _groceryRepository.getGroceries();
  }
}
