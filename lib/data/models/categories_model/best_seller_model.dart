import 'package:json_annotation/json_annotation.dart';

part 'best_seller_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BestSellerModel {
  int? id;
  bool? isFavorites;
  String? title;
  int? priceWithoutDiscount;
  int? discountPrice;
  String? picture;

  BestSellerModel({
    this.id,
    this.isFavorites,
    this.title,
    this.priceWithoutDiscount,
    this.discountPrice,
    this.picture,
  });

  factory BestSellerModel.fromJson(Map<String, dynamic> json) =>
      _$BestSellerModelFromJson(json);

  Map<String, dynamic> toJson() => _$BestSellerModelToJson(this);
}
