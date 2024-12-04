import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../const/colors.dart';
import '../../const/text_styles.dart';

class CustomSingleDropDown extends StatelessWidget {
  final List<String> dropdownList;
  final String? defaultValue;
  final String hintText;
  final ValueChanged<String> onChanged;
  final double dropdownHeight;

  const CustomSingleDropDown({
    super.key,
    required this.dropdownList,
    this.defaultValue,
    required this.hintText,
    required this.onChanged,
    required this.dropdownHeight,
  });

  @override
  Widget build(BuildContext context) {
    return MultiSelectDropDown<int>(
      // controller: _controller,
      // type
      selectionType: SelectionType.single,
      options: dropdownList.mapIndexed((index, element) {
        return ValueItem<int>(
          value: index,
          label: element,
        );
      }).toList(),
      // 선택된 데이터
      selectedOptions: defaultValue == null
          ? []
          : [
              ValueItem(label: defaultValue!, value: 0),
            ],
      // disabledOptions: [
      //   ValueItem(label: '선택', value: 0),
      // ],

      // container style
      hint: hintText,
      hintStyle: MyTextStyle.body14R.copyWith(
        color: MyColor.grayScale300,
      ),
      // form style
      borderRadius: 8.0,
      borderColor: MyColor.grayScale200,
      borderWidth: 1.0,

      fieldBackgroundColor: MyColor.grayScale000,
      clearIcon: null,
      suffixIcon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: MyColor.grayScale800,
      ),
      // padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      focusedBorderColor: MyColor.main400,
      focusedBorderWidth: 1.0,

      // 동작
      // 선택 했을 때 동작
      onOptionSelected: (List<ValueItem> selectedOptions) {
        onChanged(selectedOptions.first.label);
      },
      onOptionRemoved: (index, option) {},

      // dropdown style
      chipConfig: const ChipConfig(wrapType: WrapType.wrap),
      // 일반 상태
      optionTextStyle: MyTextStyle.body14R,
      optionsBackgroundColor: MyColor.grayScale000,
      // 선택된 상태
      singleSelectItemStyle: MyTextStyle.body14R.copyWith(
        color: MyColor.grayScale900,
      ),
      selectedOptionBackgroundColor: MyColor.grayScale000,
      selectedOptionTextColor: MyColor.main400,
      selectedOptionIcon: PhosphorIcon(
        PhosphorIcons.checkCircle(PhosphorIconsStyle.fill),
      ),
      dropdownHeight: dropdownHeight,
      dropdownBorderRadius: 8.0,
      dropdownBackgroundColor: MyColor.grayScale000,
    );
  }
}
