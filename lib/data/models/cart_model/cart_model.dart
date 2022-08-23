import 'package:ecommerce_concept/data/models/cart_model/basket_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CartModel {
  List<BasketModel>? basket;
  String? delivery;
  String? id;
  int? total;

  CartModel({
    this.basket,
    this.delivery,
    this.id,
    this.total,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
