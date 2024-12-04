import 'package:flutter/material.dart';
import 'package:real_dear_conimal/common/const/colors.dart';
import 'package:real_dear_conimal/common/const/text_styles.dart';

class StressRowText extends StatelessWidget {
  final String title1;
  final String title2;
  final String title3;
  final Widget? suffixWidget;

  const StressRowText({
    super.key,
    required this.title1,
    required this.title2,
    required this.title3,
    this.suffixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return suffixWidget is Widget
        ? IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      title1,
                      style: MyTextStyle.title24EB,
                    ),
                    Text(
                      title2,
                      style: MyTextStyle.title24EB.copyWith(
                        color: MyColor.main400,
                      ),
                    ),
                    Text(
                      title3,
                      style: MyTextStyle.title24EB,
                    ),
                  ],
                ),
                suffixWidget!,
              ],
            ),
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title1,
                style: MyTextStyle.title24EB,
              ),
              Text(
                title2,
                style: MyTextStyle.title24EB.copyWith(
                  color: MyColor.main400,
                ),
              ),
              Text(
                title3,
                style: MyTextStyle.title24EB,
              ),
            ],
          );
  }
}
