import 'package:ecommerce_concept/app_colors.dart';
import 'package:ecommerce_concept/data/datasources/api.dart';
import 'package:ecommerce_concept/generated/l10n.dart';
import 'package:ecommerce_concept/logic/bloc/categories_bloc.dart';
import 'package:ecommerce_concept/logic/bloc/product_details_bloc.dart';
import 'package:ecommerce_concept/logic/cubit/panel_cubit.dart';
import 'package:ecommerce_concept/presentation/screens/main_screen/main_screen.dart';
import 'package:ecommerce_concept/services/panel_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final panelService = PanelService();

// bool isPanelOpened = false;
void main() {
  runApp(
    MyApp(api: API()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.api}) : super(key: key);
  final API api;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesBloc>(
      create: (context) =>
          CategoriesBloc(api: api)..add(CategoriesLoadedEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        ),
        home: MultiBlocProvider(
          providers: [
            // BlocProvider<CategoriesBloc>(
            //   create: (context) =>
            //       CategoriesBloc(api: api)..add(CategoriesLoadedEvent()),
            // ),
            BlocProvider<ProductDetailsBloc>(
              create: (context) => ProductDetailsBloc(api: api)
                ..add(ProductDetailsLoadedEvent()),
            ),
            BlocProvider<PanelCubit>(
              create: (context) => PanelCubit(),
            ),
          ],
          child: const MainScreen(),
        ),
      ),
    );
  }
}
