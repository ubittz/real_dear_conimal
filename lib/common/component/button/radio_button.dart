import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../const/colors.dart';
import '../../const/text_styles.dart';

class RadioButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;
  final double verticalPadding;

  const RadioButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.isSelected,
    this.verticalPadding = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: MyColor.empty,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: PhosphorIcon(
                  isSelected
                      ? PhosphorIcons.radioButton(PhosphorIconsStyle.fill)
                      : PhosphorIcons.circle(),
                  color: isSelected ? MyColor.main400 : MyColor.grayScale200,
                ),
              ),
              const SizedBox(width: 4.0),
              Text(
                title,
                style: MyTextStyle.body14R.copyWith(
                  color: MyColor.grayScale900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
