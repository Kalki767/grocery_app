import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/errors/failures.dart';
import 'package:grocery_app/features/grocery/domain/entities/grocery_entity.dart';

abstract class GroceryRepository {
  Future<Either<Failure, List<GroceryEntity>>> getGroceries();
  Future<Either<Failure, GroceryEntity>> getGrocery(String id);
}
