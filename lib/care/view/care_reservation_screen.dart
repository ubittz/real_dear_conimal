import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:real_dear_conimal/care/model/enum/reservation_status.dart';
import 'package:real_dear_conimal/care/model/enum/reservation_type.dart';
import 'package:real_dear_conimal/care/model/reservation_model.dart';
import 'package:real_dear_conimal/care/provider/care_provider.dart';
import 'package:real_dear_conimal/care/provider/reservation_provider.dart';
import 'package:real_dear_conimal/common/component/button/default_button.dart';
import 'package:real_dear_conimal/common/component/drop_down/custom_drop_down_single.dart';
import 'package:real_dear_conimal/common/const/text_styles.dart';
import 'package:real_dear_conimal/common/view/completion_screen.dart';
import 'package:real_dear_conimal/user/model/user_model.dart';
import 'package:real_dear_conimal/user/provider/user_provider.dart';

import '../../common/component/modal/show/show_component_modal_bottom_sheet.dart';
import '../../common/component/text_form_filed/custom_label_text_form_field.dart';
import '../../common/const/colors.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../common/utils/data_utils.dart';
import '../component/calendar_modal_bottom_sheet.dart';
import '../provider/selected_calendar_provider.dart';

class CareCreateReservationScreen extends ConsumerStatefulWidget {
  static String get routeName => 'care_create_reservation';

  final String id;

  const CareCreateReservationScreen({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<CareCreateReservationScreen> createState() =>
      _CareReservationScreenState();
}

class _CareReservationScreenState
    extends ConsumerState<CareCreateReservationScreen> {
  final calendarTextEditingController = TextEditingController();

  ReservationType reservationType = ReservationType.values.first;

  @override
  void dispose() {
    calendarTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final care = ref.watch(careDetailProvider(widget.id));

    ref.listen<DateTime>(selectedDateProvider, (pre, next) {
      if (pre == next) return;
      calendarTextEditingController.text =
          DataUtils.convertDateTimeToDateTimeString(datetime: next);
    });

    return DefaultLayout(
      appbar: const DefaultAppBar(title: ''),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '예약하기',
                style: MyTextStyle.title24EB,
              ),
              const SizedBox(height: 8.0),
              Text(
                '예약을 위한 정보를 입력해주세요.',
                style: MyTextStyle.body14R,
              ),
              const SizedBox(height: 20.0),
              Text(
                '예약구분',
                style: MyTextStyle.body14R.copyWith(
                  color: MyColor.grayScale800,
                ),
              ),
              const SizedBox(height: 8.0),
              CustomSingleDropDown(
                dropdownList: [
                  "일반진료",
                  "건강검진",
                  "치과",
                  "행동교정 상담",
                ],
                hintText: '선택해 주세요.',
                onChanged: (value) {
                  reservationType = ReservationType.values
                      .where((e) => e.label == value)
                      .first;
                },
                dropdownHeight: 200.0,
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  ref.read(selectedDateProvider.notifier).state =
                      DateTime.now();

                  showCustomModalBottomSheet(
                    context: context,
                    bottomSheetWidget: const CalendarModalBottomSheet(),
                  );
                },
                child: AbsorbPointer(
                  child: CustomLabelTextFormField(
                    // TODO: 여기는 건들지마셈
                    controller: calendarTextEditingController,
                    title: '예약 일정',
                    hintText: '예약 일정을 선택해 주세요.',
                    hintStyle: MyTextStyle.body14R.copyWith(
                      color: MyColor.grayScale300,
                    ),
                    onChanged: (String value) {
                      print(value);
                    },
                    onSaved: (String? newValue) {},
                    validator: (String? value) {
                      return null;
                    },
                    enabled: true,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: PhosphorIcon(PhosphorIcons.calendar()),
                    ),
                    suffixIconConstraints: const BoxConstraints(
                      minWidth: 20.0,
                      minHeight: 20.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                '마이펫',
                style: MyTextStyle.body14R.copyWith(
                  color: MyColor.grayScale800,
                ),
              ),
              const SizedBox(height: 8.0),
              CustomSingleDropDown(
                dropdownList: [
                  "코코",
                  "보리",
                  "루루",
                  "뭉치",
                  "해피",
                  "초코",
                  "몽이",
                  "벤지",
                  "토리",
                  "바비",
                ],
                hintText: '방문할 마이펫을 선택해주세요.',
                onChanged: (value) {},
                dropdownHeight: 200.0,
              ),
              const SizedBox(height: 20.0),
              CustomLabelTextFormField(
                title: '전달 사항',
                hintText: '추가 전달사항을 적어주세요.',
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
                maxLines: 3,
              ),
              const SizedBox(height: 60.0),
              SolidButton(
                onPressed: () {
                  final newReservation = ReservationModel(
                    id: DataUtils.getUuid(),
                    careModel: care,
                    reservationType: reservationType,
                    reservationStatus: ReservationStatus.request,
                    user: ref.read(userProvider) as UserModel,
                    createdAt: DateTime.now(),
                  );

                  ref
                      .read(reservationProvider.notifier)
                      .addReservation(reservation: newReservation);

                  context.goNamed(CompletionScreen.routeName, pathParameters: {
                    'title': '예약이\n정상적으로\n완료되었습니다.',
                  });
                },
                child: const Text('예약하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
