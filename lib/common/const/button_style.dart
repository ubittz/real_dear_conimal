import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_styles.dart';

class MyButtonStyle {
  static ButtonStyle solid = ElevatedButton.styleFrom(
    foregroundColor: MyColor.grayScale000,
    backgroundColor: MyColor.main400,
    disabledForegroundColor: MyColor.grayScale700,
    disabledBackgroundColor: MyColor.grayScale300,
    elevation: 0,
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
    minimumSize: const Size(60, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    textStyle: MyTextStyle.button16M.copyWith(
      color: MyColor.grayScale000, //foreground color 가 우선순위 높음
      height: MyTextStyle.rollBackHeight(16),
    ),
  );

  static ButtonStyle ghost = ElevatedButton.styleFrom(
    foregroundColor: MyColor.main400,
    backgroundColor: MyColor.grayScale000,
    disabledForegroundColor: MyColor.grayScale700,
    disabledBackgroundColor: MyColor.grayScale100,
    elevation: 0,
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
    minimumSize: const Size(60, 60),
    shape: RoundedRectangleBorder(
      side: const BorderSide(
        width: 1.0,
        color: MyColor.main400,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    textStyle: MyTextStyle.button16M.copyWith(
      color: MyColor.main400,
      height: MyTextStyle.rollBackHeight(16),
    ),
  );

  static ButtonStyle outline = ElevatedButton.styleFrom(
    foregroundColor: MyColor.grayScale700,
    backgroundColor: MyColor.grayScale000,
    // disabledForegroundColor: MyColor.grayScale700,
    // disabledBackgroundColor: MyColor.grayScale100,
    elevation: 0,
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
    minimumSize: const Size(60, 60),
    shape: RoundedRectangleBorder(
      side: const BorderSide(
        width: 1.0,
        color: MyColor.grayScale100,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    textStyle: MyTextStyle.button14M.copyWith(
      height: MyTextStyle.rollBackHeight(14),
    ),
    alignment: AlignmentDirectional.center,
  );

  static ButtonStyle disable = ElevatedButton.styleFrom(
    foregroundColor: MyColor.grayScale400,
    backgroundColor: MyColor.grayScale100,
    disabledForegroundColor: MyColor.grayScale400,
    disabledBackgroundColor: MyColor.grayScale100,
    elevation: 0,
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
    minimumSize: const Size(60, 48),
    shape: RoundedRectangleBorder(
      side: const BorderSide(
        width: 1.0,
        color: MyColor.grayScale400,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    textStyle: MyTextStyle.button16M.copyWith(
      height: MyTextStyle.rollBackHeight(16),
    ),
    alignment: AlignmentDirectional.center,
  );
}
