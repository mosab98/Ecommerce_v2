import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      bloc: favoriteCubit,
      buildWhen: (previous, current) =>
          current is FavoriteLoaded ||
          current is FavoriteLoading ||
          current is FavoriteError,
      builder: (context, state) {
        if (state is FavoriteLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is FavoriteLoaded) {
          final productFavorite = state.favorites;
          return GridView.builder(
            itemCount: productFavorite.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 20,
              mainAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 130,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.grey2,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CachedNetworkImage(
                            imageUrl: productFavorite[index].imgUrl,
                            fit: BoxFit.contain,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      /* Positioned(
                        top: 8.0,
                        right: 8.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white54,
                          ),
                          child: InkWell(
                            onTap: () => favoriteCubit
                                .toggleFavorite(productFavorite[index]),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: BlocBuilder<FavoriteCubit, FavoriteState>(
                                bloc: favoriteCubit,
                                buildWhen: (previous, current) =>
                                    (current is SetFavoriteLoading &&
                                        current.favoritedId ==
                                            productFavorite[index].id) ||
                                    (current is SetFavoriteSuccess &&
                                        current.favoritedId ==
                                            productFavorite[index].id) ||
                                    current is SetFavoriteError,
                                builder: (context, state) {
                                  if (state is SetFavoriteLoading) {
                                    return const CircularProgressIndicator
                                        .adaptive();
                                  } else if (state is SetFavoriteSuccess) {
                                    return Icon(
                                      state.isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      size: 20,
                                      color: Theme.of(context).primaryColor,
                                    );
                                  }
                                  return Icon(
                                    Icons.favorite_border,
                                    size: 20,
                                    color: Theme.of(context).primaryColor,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),*/
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    productFavorite[index].name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    productFavorite[index].category,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  Text(
                    '\$${productFavorite[index].price}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              );
            },
          );
        } else if (state is FavoriteError) {
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
