import 'package:ecommerce_concept/app_colors.dart';
import 'package:flutter/material.dart';

class SectionTitleWidget extends StatelessWidget {
  const SectionTitleWidget({
    Key? key,
    required this.sectionTitle,
    required this.textButton,
  }) : super(key: key);
  final String sectionTitle;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionTitle,
          style: const TextStyle(
            fontFamily: "Mark Pro",
            fontWeight: FontWeight.w800,
            fontSize: 25,
          ),
        ),
        TextButton(
          child: Text(
            textButton,
            style: const TextStyle(
              fontFamily: "Mark Pro",
              fontWeight: FontWeight.w400,
              color: AppColors.orange,
              fontSize: 15,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
