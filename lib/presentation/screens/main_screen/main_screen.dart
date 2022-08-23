import 'package:ecommerce_concept/app_colors.dart';
import 'package:ecommerce_concept/generated/l10n.dart';
import 'package:ecommerce_concept/logic/cubit/panel_cubit.dart';
import 'package:ecommerce_concept/presentation/screens/home_screen/home_screen.dart';
import 'package:ecommerce_concept/presentation/screens/product_details_screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool isPanelOpened = false;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ProductDetailsScreen(),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BlocBuilder<PanelCubit, PanelState>(
        builder: (context, state) {
          return state.isPanelOpened
              ? const SizedBox()
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: AppColors.darkBlue,
                  ),
                  child: GNav(
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      if (mounted) {
                        setState(() {});
                      }

                      _selectedIndex = index;
                      if (_selectedIndex == 1) {
                        BlocProvider.of<PanelCubit>(context).openPanel();
                      }
                    },
                    // tabBackgroundColor: Colors.grey.shade800,
                    activeColor: Colors.white,
                    color: Colors.white,
                    gap: 7,

                    tabs: [
                      GButton(
                        icon: LineIcons.home,
                        text: S.of(context).home,
                      ),
                      GButton(
                        icon: LineIcons.shoppingBag,
                        text: S.of(context).shop,
                      ),
                      GButton(
                        icon: LineIcons.heart,
                        text: S.of(context).favorite,
                      ),
                      GButton(
                        icon: LineIcons.user,
                        text: S.of(context).profile,
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}

// class IsPanelOpenedInheritedWidget extends InheritedWidget {
//   const IsPanelOpenedInheritedWidget(
//       {Key? key, required Widget child, required this.isPanelOpened})
//       : super(key: key, child: child);
//   final bool isPanelOpened;

//   static IsPanelOpenedInheritedWidget? of(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<IsPanelOpenedInheritedWidget>();
//   }

//   @override
//   bool updateShouldNotify(IsPanelOpenedInheritedWidget oldWidget) {
//     return isPanelOpened != oldWidget.isPanelOpened;
//   }
// }
