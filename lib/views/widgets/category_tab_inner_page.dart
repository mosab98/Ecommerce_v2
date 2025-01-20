import 'package:ecommerce/view_models/category_tab_cubit/category_tab_cubit.dart';
import 'package:ecommerce/views/widgets/Category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryTabInnerPage extends StatelessWidget {
  const CategoryTabInnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryTabCubit = BlocProvider.of<CategoryTabCubit>(context);
    return BlocBuilder<CategoryTabCubit, CategoryTabState>(
      bloc: categoryTabCubit,
      buildWhen: (previous, current) =>
          current is CategoryLoaded ||
          current is CategoryLoading ||
          current is CategoryError,
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(
            child: SizedBox(
              height: 30,
              width: 30,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state is CategoryLoaded) {
          final categorys = state.Categories;

          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  itemCount: categorys.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    int id = int.parse(categorys[index].id);
                    if (id.isOdd) {
                      return InkWell(
                        onTap: () {},
                        child: CategoryItem(
                            category: categorys[index], leftRigth: 0),
                      );
                    } else {
                      return InkWell(
                        onTap: () {},
                        child: CategoryItem(
                            category: categorys[index], leftRigth: 1),
                      );
                    }
                  },
                )
              ],
            ),
          );
        } else if (state is CategoryError) {
          return const Center(
            child: Text('Error'),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
