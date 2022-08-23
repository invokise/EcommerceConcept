import 'package:bloc/bloc.dart';
import 'package:ecommerce_concept/data/datasources/api.dart';
import 'package:ecommerce_concept/data/models/categories_model/categories_model.dart';
import 'package:meta/meta.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final API api;

  CategoriesBloc({required this.api}) : super(CategoriesLoadingState()) {
    on<CategoriesLoadedEvent>(_onCategoriesLoadedEvent);
  }

  _onCategoriesLoadedEvent(
    CategoriesLoadedEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(CategoriesLoadingState());
    try {
      final categoriesModel = await api.getCategories();
      emit(CategoriesLoadedState(categoriesModel: categoriesModel));
    } catch (error) {
      emit(CategoriesFailureState(error: error));
    }
  }
}
