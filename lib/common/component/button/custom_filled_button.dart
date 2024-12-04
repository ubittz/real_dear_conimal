import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/text_styles.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomFilledButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: MyColor.main400,
          borderRadius: BorderRadius.circular(50.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: MyTextStyle.button14M.copyWith(
            color: MyColor.grayScale000,
          ),
        ),
      ),
    );
  }
}
