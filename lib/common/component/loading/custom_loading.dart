import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../const/colors.dart';

class CustomLoadingScreen extends StatelessWidget {
  final double? size;
  final Color? color;
  final Color? secondRingColor;
  final Color? thirdRingColor;

  const CustomLoadingScreen({
    super.key,
    this.size,
    this.color,
    this.secondRingColor,
    this.thirdRingColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.empty,
      body: Center(
        child: LoadingAnimationWidget.discreteCircle(
          color: color ?? MyColor.grayScale700,
          secondRingColor: secondRingColor ?? MyColor.grayScale500,
          thirdRingColor: thirdRingColor ?? MyColor.grayScale300,
          size: size ?? 80.0,
        ),
      ),
    );
  }
}
