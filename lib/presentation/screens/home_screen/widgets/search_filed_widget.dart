import 'package:ecommerce_concept/app_colors.dart';
import 'package:ecommerce_concept/generated/l10n.dart';
import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              // isCollapsed: true,
              // isDense: false,
              filled: true,
              fillColor: AppColors.white,
              contentPadding: const EdgeInsets.all(8),
              prefixIcon: const Icon(
                Icons.search,
                color: AppColors.orange,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              hintText: S.of(context).search,
              hintStyle: const TextStyle(
                fontFamily: "Mark Pro",
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 11,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(10),
            // width: 34,
            // height: 34,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.orange,
            ),
            child: const Icon(
              Icons.qr_code,
              color: AppColors.white,
              // size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
