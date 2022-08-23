part of 'categories_bloc.dart';

@immutable
abstract class CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesLoadedState extends CategoriesState {
  final CategoriesModel categoriesModel;

  CategoriesLoadedState({
    required this.categoriesModel,
  });
}

class CategoriesFailureState extends CategoriesState {
  final dynamic error;

  CategoriesFailureState({
    required this.error,
  });
}
