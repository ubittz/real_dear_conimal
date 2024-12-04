import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/text_styles.dart';

class SuffixButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const SuffixButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          title,
          style: MyTextStyle.button14M.copyWith(
            color: MyColor.main700,
          ),
        ),
      ),
    );
  }
}
