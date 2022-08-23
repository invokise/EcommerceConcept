import 'package:ecommerce_concept/app_colors.dart';
import 'package:ecommerce_concept/generated/l10n.dart';
import 'package:ecommerce_concept/logic/cubit/panel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class FilterOptionsPanelWidget extends StatelessWidget {
  const FilterOptionsPanelWidget({
    Key? key,
    required this.panelController,
  }) : super(key: key);
  final PanelController? panelController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        left: 22,
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const _CloseButtonWidget(),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  S.of(context).filterOptions,
                  style: const TextStyle(
                    fontFamily: "Mark Pro",
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkBlue,
                    fontSize: 18,
                  ),
                ),
              ),
              const _DoneButtonWidget(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 31, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _OptionsTitleWidget(
                  title: S.of(context).brand,
                ),
                const _OptionsDropdownButtonFormFieldWidget(
                  menuItems: [
                    'Samsung',
                  ],
                ),
                _OptionsTitleWidget(title: S.of(context).price),
                const _OptionsDropdownButtonFormFieldWidget(
                  menuItems: [
                    '\$300 - \$500',
                  ],
                ),
                _OptionsTitleWidget(
                  title: S.of(context).size,
                ),
                const _OptionsDropdownButtonFormFieldWidget(
                  menuItems: [
                    '4.5 to 5.5 inches',
                  ],
                ),
              ],
            ),
            // child: Column(
            //   children: const [
            //     // _OptionsWidget(
            //     //   optionTitle: S.of(context).brand,
            //     //   menuItems: const [
            //     //     'Samsung',
            //     //   ],
            //     // ),
            //     // const SizedBox(
            //     //   height: 20,
            //     // ),
            //     // _OptionsWidget(
            //     //   optionTitle: S.of(context).price,
            //     //   menuItems: const [
            //     //     '\$300 - \$500',
            //     //   ],
            //     // ),
            //     // const SizedBox(
            //     //   height: 20,
            //     // ),
            //     // _OptionsWidget(
            //     //   optionTitle: S.of(context).size,
            //     //   menuItems: const [
            //     //     '4.5 to 5.5 inches',
            //     //   ],
            //     // ),
            //   ],
          )
        ],
      ),
    );
  }
}

class _CloseButtonWidget extends StatefulWidget {
  const _CloseButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_CloseButtonWidget> createState() => _CloseButtonWidgetState();
}

class _CloseButtonWidgetState extends State<_CloseButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: AppColors.darkBlue,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: const Icon(
          Icons.close,
          color: AppColors.white,
        ),
        onPressed: () async {
          await context
              .findAncestorWidgetOfExactType<FilterOptionsPanelWidget>()
              ?.panelController
              ?.close();
          setState(() {
            BlocProvider.of<PanelCubit>(context).closePanel();

            // var isPanelOpened = context.watch<bool>();
            // isPanelOpened = !isPanelOpened;
            // print(isPanelOpened);
          });
        },
      ),
    );
  }
}

class _DoneButtonWidget extends StatelessWidget {
  const _DoneButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.orange,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: const Size(0, 0),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 7,
          ),
          child: Text(
            S.of(context).done,
            style: const TextStyle(
              fontFamily: 'Mark Pro',
              fontWeight: FontWeight.w500,
              color: AppColors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class _OptionsTitleWidget extends StatelessWidget {
  const _OptionsTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Mark Pro',
          fontWeight: FontWeight.w500,
          color: AppColors.darkBlue,
          fontSize: 18,
        ),
      ),
    );
  }
}

class _OptionsDropdownButtonFormFieldWidget extends StatefulWidget {
  const _OptionsDropdownButtonFormFieldWidget({
    Key? key,
    required this.menuItems,
  }) : super(key: key);

  final List<String> menuItems;

  @override
  State<_OptionsDropdownButtonFormFieldWidget> createState() =>
      _OptionsDropdownButtonFormFieldWidgetState();
}

class _OptionsDropdownButtonFormFieldWidgetState
    extends State<_OptionsDropdownButtonFormFieldWidget> {
  String? dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DropdownButtonFormField(
        value: dropDownValue,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(
            top: 7,
            bottom: 7,
            left: 14,
            right: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
        isExpanded: true,
        icon: const Icon(Icons.expand_more),
        iconEnabledColor: AppColors.grey,
        iconSize: 30,
        items: widget.menuItems
            .map(
              (menuItem) => DropdownMenuItem<String>(
                child: Text(
                  menuItem,
                  style: const TextStyle(
                    fontFamily: 'Mark Pro',
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkBlue,
                    fontSize: 18,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (String? value) {
          setState(() {
            dropDownValue = value;
          });
        },
      ),
    );
  }
}
