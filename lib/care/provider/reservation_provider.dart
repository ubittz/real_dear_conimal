import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_dear_conimal/care/provider/care_provider.dart';
import 'package:real_dear_conimal/common/const/dummy.dart';
import 'package:real_dear_conimal/user/provider/user_provider.dart';

import '../../common/utils/data_utils.dart';
import '../../user/model/user_model.dart';
import '../model/enum/reservation_status.dart';
import '../model/enum/reservation_type.dart';
import '../model/reservation_model.dart';

final reservationDetailProvider =
    Provider.family<ReservationModel, String>((ref, id) {
  final reservation =
      ref.watch(reservationProvider).firstWhere((element) => element.id == id);
  return reservation;
});

final reservationProvider =
    StateNotifierProvider<ReservationStateNotifier, List<ReservationModel>>(
  (ref) => ReservationStateNotifier(ref: ref),
);

class ReservationStateNotifier extends StateNotifier<List<ReservationModel>> {
  Ref ref;

  ReservationStateNotifier({
    required this.ref,
  }) : super([]) {
    state = getItems();
  }

  void addReservation({
    required ReservationModel reservation,
  }) {
    state = [
      ...state,
      reservation,
    ];
  }

  List<ReservationModel> getItems() {
    final now = DateTime.now();

    return List.generate(
      12,
      (index) {
        final user = ref.watch(userProvider) as UserModel;

        final careIndex =
            DataUtils.getRandomInt(dividerNumber: careData.length);
        final care = ref.read(careDetailProvider(careIndex.toString()));

        final randomMonth =
            DataUtils.getRandomInt(dividerNumber: now.month - 1);
        final randomDay = DataUtils.getRandomInt(dividerNumber: 28);
        final randomHour = DataUtils.getRandomInt(dividerNumber: 8) + 12;

        return ReservationModel(
          id: index.toString(),
          careModel: care,
          reservationType: ReservationType.values[DataUtils.getRandomInt(
              dividerNumber: ReservationType.values.length)],
          reservationStatus: ReservationStatus.completion,
          user: user,
          createdAt: DateTime(2024, randomMonth, randomDay, randomHour, 0),
        );
      },
    );
  }
}
