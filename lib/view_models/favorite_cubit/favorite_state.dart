part of 'favorite_cubit.dart';

sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteLoaded extends FavoriteState {
  final List<ProductItemModel> favorites;

  FavoriteLoaded({
    required this.favorites,
  });
}

final class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError({
    required this.message,
  });
}

/*final class SetFavoriteLoading extends FavoriteState {
  final String favoritedId;

  SetFavoriteLoading(this.favoritedId);
}

final class SetFavoriteSuccess extends FavoriteState {
  final String favoritedId;
  final bool isFavorite;

  SetFavoriteSuccess({required this.favoritedId, required this.isFavorite});
}

final class SetFavoriteError extends FavoriteState {
  final String message;

  SetFavoriteError({
    required this.message,
  });
}*/
