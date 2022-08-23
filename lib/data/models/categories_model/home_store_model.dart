import 'package:json_annotation/json_annotation.dart';

part 'home_store_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HomeStoreModel {
  int? id;
  bool? isNew;
  String? title;
  String? subtitle;
  String? picture;
  bool? isBuy;

  HomeStoreModel({
    this.id,
    this.isNew,
    this.title,
    this.subtitle,
    this.picture,
    this.isBuy,
  });

  factory HomeStoreModel.fromJson(Map<String, dynamic> json) =>
      _$HomeStoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeStoreModelToJson(this);
}
