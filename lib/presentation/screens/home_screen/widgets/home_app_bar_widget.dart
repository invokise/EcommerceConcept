import 'package:ecommerce_concept/app_colors.dart';
import 'package:ecommerce_concept/logic/cubit/panel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeAppBarWidget extends StatefulWidget {
  const HomeAppBarWidget({
    Key? key,
    required this.panelController,
  }) : super(key: key);
  final PanelController? panelController;

  @override
  State<HomeAppBarWidget> createState() => _HomeAppBarWidgetState();
}

class _HomeAppBarWidgetState extends State<HomeAppBarWidget> {
  String? dropDownValue = "Zihutanego,Gro";

  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(
      value: "Zihutanego,Gro",
      child: Text(
        "Zihutanego,Gro",
        maxLines: 1,
        style: TextStyle(
          fontFamily: "Mark Pro",
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Flexible(
                  child: Icon(
                    Icons.location_on_outlined,
                    color: AppColors.orange,
                  ),
                ),
                const SizedBox(
                  width: 11,
                ),
                Flexible(
                  child: DropdownButtonFormField(
                      value: dropDownValue,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      isExpanded: true,
                      icon: const Icon(
                        Icons.expand_more,
                      ),
                      iconEnabledColor: AppColors.grey,
                      items: menuItems,
                      onChanged: (String? value) {
                        dropDownValue = value;
                        setState(() {});
                      }),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () async {
            BlocProvider.of<PanelCubit>(context).closePanel();
            await widget.panelController?.open();

            // setState(() {
            //   // var isPanelOpened = context.watch<bool>();
            //   // isPanelOpened = !isPanelOpened;
            //   // print(isPanelOpened);
            //   // panelService.reverse();
            // });
          },
          icon: const Icon(
            LineIcons.filter,
            color: AppColors.darkBlue,
          ),
        ),
      ],
    );
  }
}
