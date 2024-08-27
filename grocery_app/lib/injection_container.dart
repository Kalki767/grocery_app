import 'package:get_it/get_it.dart';
import 'package:grocery_app/features/grocery/data/data_sources/grocery_remote_datasource.dart';
import 'package:grocery_app/features/grocery/data/repositories/grocery_repository_impl.dart';
import 'package:grocery_app/features/grocery/domain/repositories/grocery_repository.dart';
import 'package:grocery_app/features/grocery/domain/usecases/get_groceries_usecase.dart';
import 'package:grocery_app/features/grocery/domain/usecases/get_grocery_usecase.dart';
import 'package:grocery_app/features/grocery/presentation/bloc/grocery_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //Features

  //bloc
  sl.registerFactory(() => GroceryBloc(
        getGroceriesUsecase: sl(),
        getGroceryUsecase: sl(),
      ));

  //usecase
  sl.registerFactory(() => GetGroceriesUsecase(groceryRepository: sl()));
  sl.registerFactory(() => GetGroceryUsecase(groceryRepository: sl()));

  //repository
  sl.registerLazySingleton<GroceryRepository>(
      () => GroceryRepositoryImpl(groceryRemoteDatasource: sl()));

  //Datasource
  sl.registerLazySingleton<GroceryRemoteDatasource>(
      () => GroceryRemoteDatasourceImpl(client: sl()));

  sl.registerLazySingleton(() => http.Client());
}
