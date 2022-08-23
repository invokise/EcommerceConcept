import 'package:ecommerce_concept/app_colors.dart';
import 'package:ecommerce_concept/logic/bloc/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerBodyWidget extends StatelessWidget {
  const BestSellerBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CategoriesLoadedState) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.categoriesModel.bestSeller?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.84,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.only(bottom: 15),
                  margin: const EdgeInsets.only(right: 8, bottom: 12),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              state.categoriesModel.bestSeller?[index]
                                      .picture ??
                                  "",
                              fit: BoxFit.contain,
                              errorBuilder: (_, __, ___) {
                                return const Icon(
                                  Icons.error_outline,
                                  color: AppColors.orange,
                                  size: 45,
                                );
                              },
                            ),
                            Positioned(
                              top: 11,
                              right: 16,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    state.categoriesModel.bestSeller?[index]
                                                .isFavorites ??
                                            false
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                    color: AppColors.orange,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "\$${state.categoriesModel.bestSeller?[index].priceWithoutDiscount}",
                                  style: const TextStyle(
                                    fontFamily: "Mark Pro",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: AppColors.darkBlue,
                                  ),
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  "\$${state.categoriesModel.bestSeller?[index].discountPrice}",
                                  style: const TextStyle(
                                    fontFamily: "Mark Pro",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: AppColors.greyForBucks,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              state.categoriesModel.bestSeller?[index].title ??
                                  "",
                              style: const TextStyle(
                                color: AppColors.darkBlue,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        if (state is CategoriesFailureState) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const Center(
            child: Text("Unknown Eroor"),
          );
        }
      },
    );
  }
}
