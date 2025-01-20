part of 'category_tab_cubit.dart';

sealed class CategoryTabState {}

final class CategoryInitial extends CategoryTabState {}

final class CategoryLoading extends CategoryTabState {}

final class CategoryLoaded extends CategoryTabState {
  final List<CategoryItemModel> Categories;

  CategoryLoaded({
    required this.Categories,
  });
}

final class CategoryError extends CategoryTabState {
  final String message;

  CategoryError({
    required this.message,
  });
}
