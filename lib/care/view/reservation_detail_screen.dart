import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_dear_conimal/care/provider/reservation_provider.dart';
import 'package:real_dear_conimal/common/component/divider/divider_container.dart';
import 'package:real_dear_conimal/common/utils/data_utils.dart';
import 'package:real_dear_conimal/user/model/user_model.dart';
import 'package:real_dear_conimal/user/provider/user_provider.dart';

import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';

class ReservationDetailScreen extends ConsumerStatefulWidget {
  static String get routeName => 'reservation_detail';

  final String id;

  const ReservationDetailScreen({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<ReservationDetailScreen> createState() =>
      _ReservationDetailScreenState();
}

class _ReservationDetailScreenState
    extends ConsumerState<ReservationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final reservation = ref.watch(reservationDetailProvider(widget.id));
    final user = ref.watch(userProvider) as UserModel;
    final pet = user.myPet;

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '예약 상세'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            reservation.careModel.mainImageUrl,
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              reservation.careModel.name,
                              style: MyTextStyle.body20R,
                            ),
                            Text(
                              reservation.careModel.manufacturer,
                              style: MyTextStyle.body14R,
                            ),
                            const SizedBox(height: 8.0),
                            Text('상담 후 결제', style: MyTextStyle.subtitle18EB),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const DividerContainer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '예약 정보',
                      style: MyTextStyle.body20R,
                    ),
                    const SizedBox(height: 8.0),
                    _renderTitleAndDescription(
                      title: '예약명',
                      description: reservation.careModel.name,
                    ),
                    _renderTitleAndDescription(
                      title: "예약구분",
                      description: reservation.reservationType.label,
                    ),
                    _renderTitleAndDescription(
                      title: "예약상태",
                      description: reservation.reservationStatus.label,
                    ),
                    _renderTitleAndDescription(
                      title: "예약일시",
                      description: DataUtils.convertDateTimeToDateTimeString(
                        datetime: reservation.createdAt,
                      ),
                    ),
                    _renderTitleAndDescription(
                      title: "예약자명",
                      description: user.name,
                    ),
                    _renderTitleAndDescription(
                      title: "연락처",
                      description: user.phone,
                    ),
                  ],
                ),
              ),
              const DividerContainer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '마이펫 정보',
                      style: MyTextStyle.body20R,
                    ),
                    const SizedBox(height: 8.0),
                    _renderTitleAndDescription(
                      title: '이름',
                      description: pet.name,
                    ),
                    _renderTitleAndDescription(
                      title: "출생일",
                      description: DataUtils.convertDateTimeToDateString(
                        datetime: pet.birth,
                      ),
                    ),
                    _renderTitleAndDescription(
                      title: "종류(품종)",
                      description: pet.kind,
                    ),
                    _renderTitleAndDescription(
                        title: "기타특징", description: pet.etc),
                    _renderTitleAndDescription(
                      title: "전달사항",
                      description: pet.message,
                    ),
                  ],
                ),
              ),
              const DividerContainer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '최종 결제 금액',
                      style: MyTextStyle.body20R,
                    ),
                    const SizedBox(height: 8.0),
                    _renderTitleAndDescription(
                      title: '최종 결제 금액',
                      description: "27,000원",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderTitleAndDescription({
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100.0,
            child: Text(
              title,
              style: MyTextStyle.body16R,
            ),
          ),
          Expanded(
            child: Text(
              description,
              style: MyTextStyle.body16R,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
