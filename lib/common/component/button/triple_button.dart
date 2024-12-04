import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/text_styles.dart';

class TripleButton extends StatelessWidget {
  final String title1;
  final String title2;
  final String title3;
  final VoidCallback onTap1;
  final VoidCallback onTap2;
  final VoidCallback onTap3;

  const TripleButton({
    super.key,
    required this.title1,
    required this.onTap1,
    required this.title2,
    required this.onTap2,
    required this.title3,
    required this.onTap3,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        color: MyColor.grayScale000,
        height: 44.0,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: onTap1,
                child: Text(
                  title1,
                  style: MyTextStyle.body14R.copyWith(
                    color: MyColor.grayScale600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              height: 16.0,
              width: 1.0,
              color: MyColor.grayScale100,
            ),
            Expanded(
              child: InkWell(
                onTap: onTap2,
                child: Text(
                  title2,
                  style: MyTextStyle.body14R.copyWith(
                    color: MyColor.grayScale600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              height: 16.0,
              width: 1.0,
              color: MyColor.grayScale100,
            ),
            Expanded(
              child: InkWell(
                onTap: onTap3,
                child: Text(
                  title3,
                  style: MyTextStyle.body14R.copyWith(
                    color: MyColor.grayScale600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
