import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../const/text_styles.dart';
import 'default_system_ui.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {
  static const defaultAppBarHeight = 72.0;
  final String title;
  final TextStyle? titleTextStyle;
  final Widget? titleWidget;
  final List<Widget>? action;
  final Widget? leading;
  final double? leadingWidth;
  final double? elevation;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? titleSpacing;

  const DefaultAppBar({
    super.key,
    required this.title,
    this.titleTextStyle,
    this.titleWidget,
    this.leading,
    this.leadingWidth,
    this.action,
    this.elevation,
    this.centerTitle = true,
    this.backgroundColor,
    this.foregroundColor,
    this.titleSpacing,
  });

  @override
  State<DefaultAppBar> createState() => _DefaultAppBarState();

  @override
  Size get preferredSize =>
      const Size(double.infinity, DefaultAppBar.defaultAppBarHeight);
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: (widget.titleWidget == null)
          ? Text(widget.title)
          : widget.titleWidget,
      titleSpacing: widget.titleSpacing ?? 24.0,
      titleTextStyle: widget.titleTextStyle ??
          MyTextStyle.subtitle16B.copyWith(
            color: widget.foregroundColor,
          ),
      toolbarHeight: DefaultAppBar.defaultAppBarHeight,
      leading: widget.leading,
      leadingWidth: widget.leadingWidth ?? 72.0,
      centerTitle: widget.centerTitle,
      actions: widget.action,
      elevation: widget.elevation ?? 0.0,
      scrolledUnderElevation: 0.0,
      backgroundColor: widget.backgroundColor ?? MyColor.grayScale000,
      foregroundColor: widget.foregroundColor ?? MyColor.grayScale900,
      systemOverlayStyle: DefaultSystemUI.defaultSystemUI,
    );
  }
}
