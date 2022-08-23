import 'package:ecommerce_concept/presentation/screens/product_details_screen/widgets/product_details_app_bar_widget.dart';
import 'package:ecommerce_concept/presentation/screens/product_details_screen/widgets/product_images_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ProductDetailsAppBarWidget(),
                SizedBox(
                  height: 25,
                ),
                ProductImagesWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
