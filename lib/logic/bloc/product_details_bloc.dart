import 'package:bloc/bloc.dart';
import 'package:ecommerce_concept/data/datasources/api.dart';
import 'package:ecommerce_concept/data/models/product_details_model/product_details_model.dart';
import 'package:meta/meta.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final API api;
  ProductDetailsBloc({required this.api})
      : super(ProductDetailsLoadingState()) {
    on<ProductDetailsLoadedEvent>(_onProductDetailsLoadedEvent);
  }

  _onProductDetailsLoadedEvent(
    ProductDetailsLoadedEvent event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(ProductDetailsLoadingState());
    try {
      final productDetailsModel = await api.getProductDetails();
      emit(ProductDetailsLoadedState(productDetailsModel: productDetailsModel));
    } catch (error) {
      emit(ProductDetailsFailureState(error: error));
    }
  }
}
