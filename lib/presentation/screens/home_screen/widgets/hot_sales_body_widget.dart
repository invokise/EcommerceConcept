import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_concept/app_colors.dart';
import 'package:ecommerce_concept/generated/l10n.dart';
import 'package:ecommerce_concept/logic/bloc/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotSalesBodyWidget extends StatefulWidget {
  const HotSalesBodyWidget({Key? key}) : super(key: key);

  @override
  State<HotSalesBodyWidget> createState() => _HotSalesBodyWidgetState();
}

class _HotSalesBodyWidgetState extends State<HotSalesBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CategoriesLoadedState) {
          return CarouselSlider.builder(
            options: CarouselOptions(
              viewportFraction: 1,
            ),
            itemCount: state.categoriesModel.homeStore?.length,
            itemBuilder: (context, index, realIndex) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      child: Image.network(
                        state.categoriesModel.homeStore?[index].picture ?? "",
                        fit: BoxFit.cover,
                      ),
                      // SizedBox(
                      //   height: 180,
                      //   width: MediaQuery.of(context).size.width,
                      //   child: Image.network(
                      //     state.categoriesModel.homeStore?[index].picture ?? "",
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    top: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        state.categoriesModel.homeStore?[index].isNew ?? false
                            ? Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 8),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.orange,
                                ),
                                child: Center(
                                  child: Text(
                                    S.of(context).recent,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(
                                height: 27,
                              ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          state.categoriesModel.homeStore?[index].title ?? "",
                          style: const TextStyle(
                            fontFamily: "Mark Pro",
                            fontWeight: FontWeight.w800,
                            color: AppColors.white,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          state.categoriesModel.homeStore?[index].subtitle ??
                              "",
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(
                          height: 26,
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.white,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0)),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 27, vertical: 5),
                            child: Text(
                              S.of(context).buyNow,
                              style: const TextStyle(
                                color: AppColors.darkBlue,
                              ),
                            ),
                          ),
                        ),

                        // SizedBox(
                        //   height: 23,
                        //   width: 98,
                        //   child: ElevatedButton(
                        //     style: ButtonStyle(
                        //       backgroundColor: MaterialStateProperty.all(
                        //         AppColors.white,
                        //       ),
                        //     ),
                        //     onPressed: () {},
                        //     child: Text(
                        //       S.of(context).buyNow,
                        //       style: const TextStyle(
                        //         color: AppColors.darkBlue,
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        // InkWell(
                        //   onTap: () {},
                        //   child: Container(
                        //     decoration: const BoxDecoration(
                        //       borderRadius: BorderRadius.all(
                        //         Radius.circular(5),
                        //       ),
                        //       color: AppColors.white,
                        //     ),
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 27, vertical: 5),
                        //     child: Text(
                        //       S.of(context).buyNow,
                        //       style: const TextStyle(
                        //         color: AppColors.darkBlue,
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        // TextButton(
                        //   style: TextButton.styleFrom(
                        //     backgroundColor: Colors.transparent,
                        //     padding: EdgeInsets.zero,
                        //   ),
                        //   onPressed: () {},
                        //   child: Container(
                        //     decoration: const BoxDecoration(
                        //       borderRadius: BorderRadius.all(
                        //         Radius.circular(5),
                        //       ),
                        //       color: AppColors.white,
                        //     ),
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 27, vertical: 5),
                        //     child: Text(
                        //       S.of(context).buyNow,
                        //       style: const TextStyle(
                        //         color: AppColors.darkBlue,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
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
            child: Text("Unknown Error"),
          );
        }
      },
    );
  }
}
