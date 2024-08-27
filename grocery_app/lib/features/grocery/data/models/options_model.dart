import 'package:grocery_app/features/grocery/domain/entities/options_entity.dart';

class OptionsModel extends OptionsEntity {
  final String id;
  final String name;
  final num price;

  const OptionsModel(
      {required this.id, required this.name, required this.price})
      : super(id: id, name: name, price: price);

  factory OptionsModel.fromJson(Map<String, dynamic> json) =>
      OptionsModel(id: json['id'], name: json['name'], price: json['price']);

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'price': price};

  OptionsEntity toEntity() {
    return OptionsEntity(id: id, name: name, price: price);
  }
}
