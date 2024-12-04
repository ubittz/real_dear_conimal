import 'package:flutter/services.dart';

import '../const/colors.dart';

class DefaultSystemUI {
  static const defaultSystemUI = SystemUiOverlayStyle(
    statusBarColor: MyColor.empty,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    systemStatusBarContrastEnforced: false,
    systemNavigationBarColor: MyColor.empty,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: MyColor.empty,
    systemNavigationBarContrastEnforced: false,
  );

  static const homeSystemUI = SystemUiOverlayStyle(
    statusBarColor: MyColor.grayScale050,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    systemStatusBarContrastEnforced: false,
    systemNavigationBarColor: MyColor.empty,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: MyColor.empty,
    systemNavigationBarContrastEnforced: false,
  );
}
