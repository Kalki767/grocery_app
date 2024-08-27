part of 'grocery_bloc.dart';

class GroceryEvent {}

class GetGroceriesEvent extends GroceryEvent {}

class GetGroceryEvent extends GroceryEvent {
  final String id;

  GetGroceryEvent({required this.id});
}

class FilterGroceryEvent extends GroceryEvent {
  final String text;

  FilterGroceryEvent({required this.text});
}
