import 'package:ecommerce/models/category_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_tab_state.dart';

class CategoryTabCubit extends Cubit<CategoryTabState> {
  CategoryTabCubit() : super(CategoryInitial());

  void getCategoryData() {
    emit(CategoryLoading());

    Future.delayed(const Duration(seconds: 1), () {
      final Categories = dummyCategories;
      emit(
        CategoryLoaded(Categories: Categories),
      );
    });
  }
}
