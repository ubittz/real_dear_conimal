import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:real_dear_conimal/care/model/reservation_model.dart';
import 'package:real_dear_conimal/common/component/divider/divider_container.dart';
import 'package:real_dear_conimal/common/utils/data_utils.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../component/reservation_card.dart';
import '../model/enum/reservation_status.dart';
import '../provider/reservation_provider.dart';
import 'reservation_detail_screen.dart';

class ReservationListScreen extends ConsumerWidget {
  static String get routeName => 'reservation_list';

  const ReservationListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ReservationModel> reservations = ref.watch(reservationProvider);
    final readyReservation = reservations
        .where((e) => e.reservationStatus == ReservationStatus.request)
        .toList();
    final doingReservation = reservations
        .where((e) => e.reservationStatus == ReservationStatus.confirmed)
        .toList();
    final doneReservation = reservations
        .where((e) => e.reservationStatus == ReservationStatus.completion)
        .toList();

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '예약 내역'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: MyColor.grayScale050,
                ),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  renderReservationAmount(
                      count: reservations.length, title: '전체'),
                  renderReservationAmount(
                      count: readyReservation.length,
                      title: ReservationStatus.request.label),
                  renderReservationAmount(
                      count: doingReservation.length,
                      title: ReservationStatus.confirmed.label),
                  renderReservationAmount(
                      count: doneReservation.length,
                      title: ReservationStatus.completion.label),
                ],
              ),
            ),
          ),
          Expanded(
            child: CustomGroupedListView(
              reservations: reservations,
            ),
          ),
        ],
      ),
    );
  }

  Widget renderReservationAmount({
    required int count,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            count.toString(),
            style: MyTextStyle.title20EB,
          ),
          Text(
            title,
            style: MyTextStyle.body16R,
          ),
        ],
      ),
    );
  }
}

class CustomGroupedListView extends ConsumerWidget {
  final List<ReservationModel> reservations;

  const CustomGroupedListView({
    super.key,
    required this.reservations,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GroupedListView<ReservationModel, String>(
      physics: const BouncingScrollPhysics(),
      elements: reservations,
      groupBy: (element) => "예약번호: ${element.createdAt}",
      groupHeaderBuilder: (ReservationModel reservation) {
        return InkWell(
          onTap: () {
            context.pushNamed(
              ReservationDetailScreen.routeName,
              pathParameters: {'id': reservation.id},
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const DividerContainer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 16.0),
                child: Text(
                  '예약날짜: ${DataUtils.convertDateTimeToDateTimeString(
                    datetime: reservation.createdAt,
                  )}',
                  style: MyTextStyle.body20R,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        );
      },
      itemBuilder: (context, ReservationModel element) {
        return InkWell(
          onTap: () {
            context.pushNamed(
              ReservationDetailScreen.routeName,
              pathParameters: {'id': element.id},
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                ReservationCard(reservation: element),
              ],
            ),
          ),
        );
      },
      itemComparator: (item1, item2) => item1.createdAt.compareTo(
        item2.createdAt,
      ),
      order: GroupedListOrder.DESC,
    );
  }
}
