import 'package:ecommerce_concept/data/models/categories_model/best_seller_model.dart';
import 'package:ecommerce_concept/data/models/categories_model/home_store_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CategoriesModel {
  List<HomeStoreModel>? homeStore;
  List<BestSellerModel>? bestSeller;

  CategoriesModel({
    this.homeStore,
    this.bestSeller,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
}
