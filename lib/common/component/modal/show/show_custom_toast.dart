import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../const/colors.dart';
import '../../../const/text_styles.dart';

void showCustomToast(
  context, {
  required String msg,
  Duration? toastDuration,
  Color backgroundColor = MyColor.grayScale000,
  Color foregroundColor = MyColor.grayScale900,
}) {
  final fToast = FToast();
  fToast.init(context);
  Widget toast = Container(
    height: double.infinity,
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
    color: MyColor.barrier.withOpacity(0.1),
    child: Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Text(
            msg,
            style: MyTextStyle.subtitle16B.copyWith(
              color: foregroundColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );

  fToast.showToast(
    child: toast,
    toastDuration: toastDuration ?? const Duration(seconds: 3),
    positionedToastBuilder: (context, child) {
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          child,
        ],
      );
    },
  );
}
