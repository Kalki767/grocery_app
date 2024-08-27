part of 'grocery_bloc.dart';

sealed class GroceryState extends Equatable {
  const GroceryState();
}

final class InitialState extends GroceryState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class LoadingState extends GroceryState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class LoadedGroceriesState extends GroceryState {
  final List<GroceryEntity> groceryEntities;

  LoadedGroceriesState({required this.groceryEntities});

  @override
  // TODO: implement props
  List<Object?> get props => [groceryEntities];
}

final class LoadedGroceryState extends GroceryState {
  final GroceryEntity groceryEntity;

  LoadedGroceryState({required this.groceryEntity});

  @override
  // TODO: implement props
  List<Object?> get props => [groceryEntity];
}

final class ErrorState extends GroceryState {
  final String message;

  const ErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
