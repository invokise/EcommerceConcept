import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_concept/logic/bloc/product_details_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProductImagesWidget extends StatelessWidget {
  const ProductImagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductDetailsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProductDetailsLoadedState) {
          return CarouselSlider.builder(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.41,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            itemCount: state.productDetailsModel.images?.length,
            itemBuilder: (context, index, realIndex) {
              // return Container(
              //   // padding: const EdgeInsets.all(10),
              //   decoration: BoxDecoration(
              //     // image: DecorationImage(
              //     //   image: Image.network(
              //     //     state.productDetailsModel.images?[index] ?? "",
              //     //     fit: BoxFit.contain,
              //     //   ).image,
              //     // ),
              //     borderRadius: const BorderRadius.all(
              //       Radius.circular(20.0),
              //     ),
              //     boxShadow: [
              //       BoxShadow(
              //         // offset: const Offset(0, -1),
              //         color: Colors.grey.withOpacity(0.2),
              //         spreadRadius: 5,
              //         blurRadius: 10,
              //       ),
              //     ],
              //   ),
              //   child: ClipRRect(
              return ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
                child: Image.network(
                  state.productDetailsModel.images?[index] ?? "",
                  fit: BoxFit.contain,
                ),
              );
            },
          );
        }
        if (state is ProductDetailsFailureState) {
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
