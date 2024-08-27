import 'package:equatable/equatable.dart';
import 'package:grocery_app/features/grocery/domain/entities/grocery_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/grocery/domain/usecases/get_groceries_usecase.dart';
import 'package:grocery_app/features/grocery/domain/usecases/get_grocery_usecase.dart';
import 'package:rxdart/rxdart.dart';

part 'grocery_event.dart';
part 'grocery_state.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  final GetGroceriesUsecase _getGroceriesUsecase;
  final GetGroceryUsecase _getGroceryUsecase;

  GroceryBloc({
    required GetGroceriesUsecase getGroceriesUsecase,
    required GetGroceryUsecase getGroceryUsecase,
  })  : _getGroceriesUsecase = getGroceriesUsecase,
        _getGroceryUsecase = getGroceryUsecase,
        super(InitialState()) {
    on<GetGroceriesEvent>(
      (event, emit) async {
        emit(LoadingState());

        final result = await _getGroceriesUsecase.execute();

        result.fold((failure) {
          emit(const ErrorState(message: 'an error happens'));
        }, (groceryEntities) {
          emit(LoadedGroceriesState(groceryEntities: groceryEntities));
        });
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );

    on<GetGroceryEvent>(
      (event, emit) async {
        emit(LoadingState());

        final result = await _getGroceryUsecase.execute(event.id);

        result.fold((failure) {
          emit(const ErrorState(message: 'an error happens'));
        }, (_grocery) {
          emit(LoadedGroceryState(groceryEntity: _grocery));
        });
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
