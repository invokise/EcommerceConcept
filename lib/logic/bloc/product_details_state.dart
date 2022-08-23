part of 'product_details_bloc.dart';

@immutable
abstract class ProductDetailsState {}

class ProductDetailsLoadingState extends ProductDetailsState {}

class ProductDetailsLoadedState extends ProductDetailsState {
  final ProductDetailsModel productDetailsModel;

  ProductDetailsLoadedState({
    required this.productDetailsModel,
  });
}

class ProductDetailsFailureState extends ProductDetailsState {
  final dynamic error;

  ProductDetailsFailureState({
    required this.error,
  });
}
