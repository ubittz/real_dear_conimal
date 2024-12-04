import 'package:flutter/material.dart';

import '../../const/button_style.dart';

class SolidButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const SolidButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: onPressed == null ? MyButtonStyle.disable : MyButtonStyle.solid,
      child: child,
    );
  }
}

class GhostButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const GhostButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: onPressed == null ? MyButtonStyle.disable : MyButtonStyle.ghost,
      child: child,
    );
  }
}

class OutlineButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const OutlineButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: onPressed == null ? MyButtonStyle.disable : MyButtonStyle.outline,
      child: child,
    );
  }
}
