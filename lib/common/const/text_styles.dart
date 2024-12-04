import 'package:flutter/material.dart';

import 'colors.dart';

class MyTextStyle {
  static const _letterSpacingPercentage = -4; // 자간 백분률 -4%
  static const _basicColor = MyColor.grayScale900;

  // 자간을 백분율에 따라 계산하는 함수
  static double _calculateLetterSpacing(double fontSize) {
    return fontSize * (_letterSpacingPercentage / 100);
  }

  // 텍스트 높이 계산하는 함수
  static double _calculateHeight(double fontSize) {
    return (fontSize + 6.0) / fontSize;
  }

  // 텍스트 높이 원상 복구 함수
  static double rollBackHeight(double fontSize) {
    return fontSize / (fontSize + 6.0);
  }

  // Thin: w100
  // ExtraLight: w200
  // Light: w300
  // Regular: w400
  // Medium: w500
  // SemiBold: w600
  // Bold: w700
  // ExtraBold: w800
  // Heavy: w900

  /// Headline: Title1 24 EB, family: SUIT, size: 24, weight: Extra Bold
  static TextStyle title24EB = TextStyle(
    fontSize: _title24EBFontSize,
    fontWeight: FontWeight.w800,
    letterSpacing: _calculateLetterSpacing(_title24EBFontSize),
    height: _calculateHeight(_title24EBFontSize),
    color: _basicColor,
  );
  static const _title24EBFontSize = 24.0;

  /// Headline: Title2 20 EB, family: SUIT, size: 20, weight: Extra Bold
  static TextStyle title20EB = TextStyle(
    fontSize: _title20EBFontSize,
    fontWeight: FontWeight.w800,
    letterSpacing: _calculateLetterSpacing(_title20EBFontSize),
    height: _calculateHeight(_title20EBFontSize),
    color: _basicColor,
  );
  static const _title20EBFontSize = 20.0;

  /// Subtitle: Subtitle1 18 EB, family: SUIT, size: 18, weight: Extra Bold
  static TextStyle subtitle18EB = TextStyle(
    fontSize: _subtitle18EBFontSize,
    fontWeight: FontWeight.w800,
    letterSpacing: _calculateLetterSpacing(_subtitle18EBFontSize),
    height: _calculateHeight(_subtitle18EBFontSize),
    color: _basicColor,
  );
  static const _subtitle18EBFontSize = 18.0;

  /// Subtitle: Subtitle2 16 SB, family: SUIT, size: 16, weight: Bold
  static TextStyle subtitle16B = TextStyle(
    fontSize: _subtitle16SBFontSize,
    fontWeight: FontWeight.w700,
    letterSpacing: _calculateLetterSpacing(_subtitle16SBFontSize),
    height: _calculateHeight(_subtitle16SBFontSize),
    color: _basicColor,
  );
  static const _subtitle16SBFontSize = 16.0;

  /// Subtitle: Subtitle2 14 SB, family: SUIT, size: 14, weight: Bold
  static TextStyle subtitle14B = TextStyle(
    fontSize: _subtitle14SBFontSize,
    fontWeight: FontWeight.w700,
    letterSpacing: _calculateLetterSpacing(_subtitle14SBFontSize),
    height: _calculateHeight(_subtitle14SBFontSize),
    color: _basicColor,
  );
  static const _subtitle14SBFontSize = 14.0;

  /// Body: Body1 20 R, family: SUIT, size: 20, weight: Regular
  static TextStyle body20R = TextStyle(
    fontSize: _body20RFontSize,
    fontWeight: FontWeight.w400,
    letterSpacing: _calculateLetterSpacing(_body20RFontSize),
    height: _calculateHeight(_body20RFontSize),
    color: _basicColor,
  );
  static const _body20RFontSize = 20.0;

  /// Body: Body2 16 R, family: SUIT, size: 16, weight: Regular
  static TextStyle body16R = TextStyle(
    fontSize: _body16RFontSize,
    fontWeight: FontWeight.w400,
    letterSpacing: _calculateLetterSpacing(_body16RFontSize),
    height: _calculateHeight(_body16RFontSize),
    color: _basicColor,
  );
  static const _body16RFontSize = 16.0;

  /// Body: Body3 14 R, family: SUIT, size: 14, weight: Regular
  static TextStyle body14R = TextStyle(
    fontSize: _body14RFontSize,
    fontWeight: FontWeight.w400,
    letterSpacing: _calculateLetterSpacing(_body14RFontSize),
    height: _calculateHeight(_body14RFontSize),
    color: _basicColor,
  );
  static const _body14RFontSize = 14.0;

  /// Caption: Caption 12 R, family: SUIT, size: 12, weight: Regular
  static TextStyle caption12R = TextStyle(
    fontSize: _caption12RFontSize,
    fontWeight: FontWeight.w400,
    letterSpacing: _calculateLetterSpacing(_caption12RFontSize),
    height: _calculateHeight(_caption12RFontSize),
    color: _basicColor,
  );
  static const _caption12RFontSize = 12.0;

  /// Button1: Button1 16 M, family: SUIT, size: 16, weight: Medium
  static TextStyle button16M = TextStyle(
    fontSize: _button16MFontSize,
    fontWeight: FontWeight.w500,
    letterSpacing: _calculateLetterSpacing(_button16MFontSize),
    height: _calculateHeight(_button16MFontSize),
    color: _basicColor,
  );
  static const _button16MFontSize = 16.0;

  /// Button2: Button2 14 M, family: SUIT, size: 14, weight: Medium
  static TextStyle button14M = TextStyle(
    fontSize: _button14MFontSize,
    fontWeight: FontWeight.w500,
    letterSpacing: _calculateLetterSpacing(_button14MFontSize),
    height: _calculateHeight(_button14MFontSize),
    color: _basicColor,
  );
  static const _button14MFontSize = 14.0;

  /// Button3: Button2 12 M, family: SUIT, size: 12, weight: Medium
  static TextStyle button12M = TextStyle(
    fontSize: _button12MFontSize,
    fontWeight: FontWeight.w500,
    letterSpacing: _calculateLetterSpacing(_button12MFontSize),
    height: _calculateHeight(_button12MFontSize),
    color: _basicColor,
  );
  static const _button12MFontSize = 12.0;
}
