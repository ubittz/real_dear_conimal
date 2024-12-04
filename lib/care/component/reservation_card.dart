import 'package:flutter/material.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../model/reservation_model.dart';

class ReservationCard extends StatelessWidget {
  final ReservationModel reservation;

  const ReservationCard({
    super.key,
    required this.reservation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Divider(color: MyColor.grayScale100),
        const SizedBox(height: 10.0),
        _renderTitleAndDescription(
          title: '예약명',
          description: reservation.careModel.name,
        ),
        _renderTitleAndDescription(
          title: '예약 구분',
          description: reservation.reservationType.label,
        ),
        _renderTitleAndDescription(
          title: '예약 상태',
          description: reservation.reservationStatus.label,
        ),
        const SizedBox(height: 10.0),
      ],
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
