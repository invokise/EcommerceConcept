import 'package:ecommerce_concept/generated/l10n.dart';
import 'package:ecommerce_concept/presentation/screens/home_screen/widgets/best_seller_body_widget.dart';
import 'package:ecommerce_concept/presentation/screens/home_screen/widgets/filter_options_panel_widget.dart';
import 'package:ecommerce_concept/presentation/screens/home_screen/widgets/home_app_bar_widget.dart';
import 'package:ecommerce_concept/presentation/screens/home_screen/widgets/hot_sales_body_widget.dart';
import 'package:ecommerce_concept/presentation/screens/home_screen/widgets/list_categories_widget.dart';
import 'package:ecommerce_concept/presentation/screens/home_screen/widgets/search_filed_widget.dart';
import 'package:ecommerce_concept/presentation/screens/home_screen/widgets/section_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    // return _BodyWidget();
    return SafeArea(
      child: Scaffold(
        body: SlidingUpPanel(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          // collapsed: true,
          // backdropTapClosesPanel: true,
          panelSnapping: false,
          // renderPanelSheet: false,
          maxHeight: MediaQuery.of(context).size.height * 0.63,
          minHeight: 0,
          controller: _panelController,
          body: const _BodyWidget(),
          panel: FilterOptionsPanelWidget(
            panelController: _panelController,
          ),
        ),
      ),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeAppBarWidget(
              panelController: context
                  .findAncestorStateOfType<_HomeScreenState>()
                  ?._panelController,
            ),
            const SizedBox(height: 18),
            SectionTitleWidget(
              sectionTitle: S.of(context).selectCategory,
              textButton: S.of(context).viewAll,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 24,
                bottom: 35,
              ),
              child: ListCategoriesWidget(),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 15,
                bottom: 24,
              ),
              child: SearchFieldWidget(),
            ),
            SectionTitleWidget(
              sectionTitle: S.of(context).hotSales,
              textButton: S.of(context).seeMore,
            ),
            const HotSalesBodyWidget(),
            const SizedBox(height: 20),
            SectionTitleWidget(
              sectionTitle: S.of(context).bestSeller,
              textButton: S.of(context).seeMore,
            ),
            const BestSellerBodyWidget(),
            // const SizedBox(
            //   height: 50,
            // ),
          ],
        ),
      ),
    );
  }
}
