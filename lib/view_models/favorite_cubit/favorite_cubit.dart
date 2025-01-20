import 'package:ecommerce/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  void getFavoriteData() {
    emit(FavoriteLoading());

    Future.delayed(const Duration(milliseconds: 5), () {
      try {
        final favorites = dummyFavorites;
        emit(FavoriteLoaded(favorites: favorites));
      } catch (e) {
        emit(FavoriteError(message: e.toString()));
      }
    });
  }

  /*void toggleFavorite(ProductItemModel productItem) {
    emit(SetFavoriteLoading(productItem.id));
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        if (dummyFavorites.contains(productItem)) {
          dummyFavorites.remove(productItem);
          emit(SetFavoriteSuccess(
              favoritedId: productItem.id, isFavorite: false));
        } else {
          dummyFavorites.add(productItem);
          emit(SetFavoriteSuccess(
              favoritedId: productItem.id, isFavorite: true));
        }
      },
    );
  }*/
}
