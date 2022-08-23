import 'package:json_annotation/json_annotation.dart';

part 'product_details_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProductDetailsModel {
  @JsonKey(name: "CPU")
  String? cpu;
  String? camera;
  List<String>? capacity;
  List<String>? color;
  String? id;
  List<String>? images;
  bool? isFavorites;
  int? price;
  double? rating;
  String? sd;
  String? ssd;
  String? title;

  ProductDetailsModel(
      {this.cpu,
      this.camera,
      this.capacity,
      this.color,
      this.id,
      this.images,
      this.isFavorites,
      this.price,
      this.rating,
      this.sd,
      this.ssd,
      this.title});
  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsModelToJson(this);
}
