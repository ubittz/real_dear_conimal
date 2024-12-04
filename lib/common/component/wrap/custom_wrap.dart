import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/text_styles.dart';

class CustomWrap extends StatefulWidget {
  final List<CustomWrapButtonModel> buttons;
  final String selectedButtonLabel;

  const CustomWrap({
    super.key,
    required this.buttons,
    required this.selectedButtonLabel,
  });

  @override
  State<CustomWrap> createState() => _HorizontalButtonListState();
}

class _HorizontalButtonListState extends State<CustomWrap> {
  CustomWrapButtonModel? selectedButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 12.0,
        children: List.generate(
          widget.buttons.length,
          (int index) => _ContainerInkWell(
            title: widget.buttons[index].title,
            isSelected: selectedButton == null
                ? widget.buttons[index].title == widget.selectedButtonLabel
                : selectedButton!.title == widget.buttons[index].title,
            onTap: () {
              widget.buttons[index].onTap();
              selectedButton = widget.buttons[index];
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}

class CustomWrapButtonModel {
  final String title;
  final VoidCallback onTap;

  const CustomWrapButtonModel({
    required this.title,
    required this.onTap,
  });
}

class _ContainerInkWell extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _ContainerInkWell({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? MyColor.main400 : MyColor.empty,
          border: Border.all(
            width: 1.0,
            color: isSelected ? MyColor.empty : MyColor.grayScale100,
          ),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
          child: Text(
            title,
            style: MyTextStyle.button14M.copyWith(
              color: isSelected ? MyColor.grayScale000 : null,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
