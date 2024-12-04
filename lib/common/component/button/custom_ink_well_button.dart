import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/text_styles.dart';

class CustomInkWellButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const CustomInkWellButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? MyColor.main400 : MyColor.grayScale000,
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(
            color: isSelected ? MyColor.grayScale000 : MyColor.grayScale200,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: MyTextStyle.button14M.copyWith(
              color: isSelected ? MyColor.grayScale000 : MyColor.grayScale200,
            ),
          ),
        ),
      ),
    );
  }
}
