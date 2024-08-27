import 'package:equatable/equatable.dart';

class OptionsEntity extends Equatable {
  final String id;
  final String name;
  final num price;

  const OptionsEntity(
      {required this.id, required this.name, required this.price});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, price];
}
