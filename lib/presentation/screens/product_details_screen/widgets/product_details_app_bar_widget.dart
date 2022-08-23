import 'package:ecommerce_concept/app_colors.dart';
import 'package:ecommerce_concept/generated/l10n.dart';
import 'package:ecommerce_concept/logic/cubit/panel_cubit.dart';
import 'package:ecommerce_concept/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';

class ProductDetailsAppBarWidget extends StatefulWidget {
  const ProductDetailsAppBarWidget({Key? key}) : super(key: key);

  @override
  State<ProductDetailsAppBarWidget> createState() =>
      _ProductDetailsAppBarWidgetState();
}

class _ProductDetailsAppBarWidgetState
    extends State<ProductDetailsAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _AppBarButton(
          icon: Icons.arrow_back_ios_new,
          backgroundColor: AppColors.darkBlue,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
            BlocProvider.of<PanelCubit>(context).closePanel();
          },
        ),
        Text(
          S.of(context).productDetails,
          style: const TextStyle(
            fontFamily: "Mark Pro",
            fontWeight: FontWeight.w500,
            color: AppColors.darkBlue,
            fontSize: 18,
          ),
        ),
        _AppBarButton(
          icon: LineIcons.shoppingBag,
          backgroundColor: AppColors.orange,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _AppBarButton extends StatelessWidget {
  const _AppBarButton({
    Key? key,
    required this.icon,
    required this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);
  final IconData? icon;
  final Color? backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: backgroundColor,
      ),
      child: IconButton(
        padding: const EdgeInsets.all(12),
        icon: Icon(
          icon,
          color: AppColors.white,
          size: 18,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
