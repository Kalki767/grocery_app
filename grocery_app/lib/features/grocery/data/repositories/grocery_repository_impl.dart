import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/errors/exceptions.dart';
import 'package:grocery_app/core/errors/failures.dart';
import 'package:grocery_app/features/grocery/data/data_sources/grocery_remote_datasource.dart';
import 'package:grocery_app/features/grocery/domain/entities/grocery_entity.dart';
import 'package:grocery_app/features/grocery/domain/repositories/grocery_repository.dart';

class GroceryRepositoryImpl implements GroceryRepository {
  final GroceryRemoteDatasource _groceryRemoteDatasource;

  GroceryRepositoryImpl(
      {required GroceryRemoteDatasource groceryRemoteDatasource})
      : _groceryRemoteDatasource = groceryRemoteDatasource;
  @override
  Future<Either<Failure, List<GroceryEntity>>> getGroceries() async {
    try {
      final result = await _groceryRemoteDatasource.getGroceries();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(message: 'a server error occured'));
    } on SocketException {
      return const Left(
          ConnectionFailure(message: 'a connection error occured'));
    }
  }

  @override
  Future<Either<Failure, GroceryEntity>> getGrocery(String id) async {
    try {
      final result = await _groceryRemoteDatasource.getGrocery(id);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(message: 'a server error occured'));
    } on SocketException {
      return const Left(
          ConnectionFailure(message: 'a connection error occured'));
    }
  }
}
