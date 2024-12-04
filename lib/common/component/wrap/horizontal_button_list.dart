import 'package:flutter/material.dart';
import 'package:real_dear_conimal/common/component/button/custom_ink_well_button.dart';

class HorizontalButtonList extends StatelessWidget {
  final List<CustomInkWellButton> buttons;

  const HorizontalButtonList({
    super.key,
    required this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.0,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final button = buttons[index];

          return button;
        },
        separatorBuilder: (_, index) {
          return const SizedBox(width: 8.0);
        },
        itemCount: buttons.length,
      ),
    );
  }
}
