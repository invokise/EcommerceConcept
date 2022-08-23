import 'package:ecommerce_concept/app_colors.dart';
import 'package:flutter/material.dart';

class ListCategoriesWidget extends StatefulWidget {
  const ListCategoriesWidget({Key? key}) : super(key: key);

  @override
  State<ListCategoriesWidget> createState() => _ListCategoriesWidgetState();
}

class _ListCategoriesWidgetState extends State<ListCategoriesWidget> {
  int? _selectedCategoryIndex;
  List<_CategoriesModel> categories = [
    _CategoriesModel(
      titleCategory: "Phone",
      iconCategory: Icons.mobile_friendly_outlined,
    ),
    _CategoriesModel(
      titleCategory: "Computer",
      iconCategory: Icons.computer,
    ),
    _CategoriesModel(
      titleCategory: "Health",
      iconCategory: Icons.favorite_outline,
    ),
    _CategoriesModel(
      titleCategory: "Books",
      iconCategory: Icons.book_outlined,
    ),
    _CategoriesModel(
      titleCategory: "Toys",
      iconCategory: Icons.toys_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() => _selectedCategoryIndex = index);
            },
            child: Column(
              children: [
                SizedBox(
                  height: 71,
                  width: 71,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (_selectedCategoryIndex == index)
                          ? AppColors.orange
                          : AppColors.white,
                    ),
                    child: Icon(
                      categories[index].iconCategory,
                      color: (_selectedCategoryIndex == index)
                          ? AppColors.white
                          : AppColors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  categories[index].titleCategory,
                  style: const TextStyle(
                    fontFamily: 'Mark Pro',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 23,
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}

class _CategoriesModel {
  final String titleCategory;
  final IconData? iconCategory;

  _CategoriesModel({
    required this.titleCategory,
    required this.iconCategory,
  });
}
