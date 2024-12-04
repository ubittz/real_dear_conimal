import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:real_dear_conimal/common/component/button/custom_ink_well_button.dart';

import '../../common/component/button/default_button.dart';
import '../../common/component/calendar/main_calendar.dart';
import '../../common/component/modal/modal_bottom_sheet_widget.dart';
import '../../common/component/wrap/horizontal_button_list.dart';
import '../../common/const/text_styles.dart';
import '../provider/selected_calendar_provider.dart';

class CalendarModalBottomSheet extends ConsumerWidget {
  const CalendarModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dt = ref.watch(selectedDateProvider);

    return ModalBottomSheetWidget(
      height: 644.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: MainCalendar(
                onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
              ref.read(selectedDateProvider.notifier).state = selectedDay;
              final dt = ref.read(selectedDateProvider);

              final newDt = DateTime(selectedDay.year, selectedDay.month,
                  selectedDay.day, dt.hour, dt.minute);

              ref.read(selectedDateProvider.notifier).state = newDt;
            }),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '시간 선택',
              style: MyTextStyle.button14M,
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 12.0),
          HorizontalButtonList(buttons: [
            ...List.generate(10, (index) {
              return CustomInkWellButton(
                title: '${(index + 9)}:00',
                onTap: () {
                  ref.read(selectedDateProvider.notifier).state =
                      DateTime(dt.year, dt.month, dt.day, index + 9, 0);
                },
                isSelected:
                    dt == DateTime(dt.year, dt.month, dt.day, index + 9, 0),
              );
            }),
          ]),
          const SizedBox(height: 32.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: GhostButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text('닫기'),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: SolidButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text('확인'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24.0),
        ],
      ),
    );
  }
}
