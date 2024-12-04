import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../const/colors.dart';
import '../../const/text_styles.dart';

class CustomLabelTextFormFieldAndButton extends StatelessWidget {
  final String title;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final String buttonText;
  final VoidCallback? buttonOnPressed;

  final TextEditingController? controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final TextAlign textAlign;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final String? suffixText;
  final int? maxLength;
  final int? maxLines;
  final bool realOnly;
  final bool enabled;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;
  final TextStyle? style;

  const CustomLabelTextFormFieldAndButton({
    super.key,
    required this.title,
    required this.onChanged,
    required this.onSaved,
    required this.validator,
    required this.buttonText,
    required this.buttonOnPressed,
    this.controller,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.obscureText = false,
    this.textAlign = TextAlign.start,
    this.hintText,
    this.hintStyle,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.suffixText,
    this.maxLength,
    this.maxLines = 1,
    this.realOnly = false,
    this.enabled = true,
    this.onEditingComplete,
    this.focusNode,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: MyTextStyle.body14R.copyWith(color: MyColor.grayScale800),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                onChanged: onChanged,
                onSaved: onSaved,
                validator: validator,
                controller: controller,
                onEditingComplete: onEditingComplete,
                focusNode: focusNode,
                obscureText: obscureText,
                // font에 글자 없으면 사용 못함
                obscuringCharacter: '*',
                textAlign: textAlign,
                decoration: InputDecoration(
                  // filled: true,
                  // fillColor: MyColor.grayScale050,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColor.grayScale200,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColor.grayScale200,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColor.grayScale200,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColor.grayScale200,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  enabled: enabled,
                  hintText: hintText,
                  hintStyle: (hintStyle == null)
                      ? MyTextStyle.body14R
                          .copyWith(color: MyColor.grayScale200)
                      : hintStyle,
                  suffixIcon: suffixIcon,
                  suffixIconConstraints: suffixIconConstraints,
                  suffixText: suffixText,
                ),
                cursorColor: MyColor.main400,
                cursorHeight: 22.0,
                style: style ??
                    MyTextStyle.body14R.copyWith(
                      color:
                          enabled ? MyColor.grayScale900 : MyColor.grayScale300,
                    ),
                maxLength: maxLength,
                maxLines: maxLines,
                textInputAction: textInputAction,
                keyboardType: textInputType,
                inputFormatters: textInputType == TextInputType.number
                    ? [FilteringTextInputFormatter.digitsOnly]
                    : [],
                readOnly: realOnly,
                enabled: enabled,
              ),
            ),
            const SizedBox(width: 12.0),
            InkWell(
              onTap: buttonOnPressed,
              child: Container(
                decoration: BoxDecoration(
                  color: MyColor.main400,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    buttonText,
                    style: MyTextStyle.button16M.copyWith(
                      color: MyColor.grayScale000,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
