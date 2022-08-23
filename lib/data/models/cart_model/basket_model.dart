import 'package:json_annotation/json_annotation.dart';

part 'basket_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BasketModel {
  int? id;
  String? images;
  int? price;
  String? title;

  BasketModel({
    this.id,
    this.images,
    this.price,
    this.title,
  });

  factory BasketModel.fromJson(Map<String, dynamic> json) =>
      _$BasketModelFromJson(json);

  Map<String, dynamic> toJson() => _$BasketModelToJson(this);
}
