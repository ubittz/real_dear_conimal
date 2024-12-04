import 'package:real_dear_conimal/care/model/care_model.dart';
import 'package:real_dear_conimal/care/model/enum/reservation_status.dart';
import 'package:real_dear_conimal/care/model/enum/reservation_type.dart';
import 'package:real_dear_conimal/user/model/user_model.dart';

class ReservationModel {
  final String id;
  final CareModel careModel;
  final ReservationType reservationType; // 예약 구분
  final ReservationStatus reservationStatus; // 예약 상태
  final UserModel user;
  final DateTime createdAt;

  ReservationModel({
    required this.id,
    required this.careModel,
    required this.reservationType,
    required this.reservationStatus,
    required this.user,
    required this.createdAt,
  });

  ReservationModel copyWith({
    String? id,
    CareModel? careModel,
    ReservationType? reservationType,
    ReservationStatus? reservationStatus,
    UserModel? user,
    DateTime? createdAt,
  }) {
    return ReservationModel(
      id: id ?? this.id,
      careModel: careModel ?? this.careModel,
      reservationType: reservationType ?? this.reservationType,
      reservationStatus: reservationStatus ?? this.reservationStatus,
      user: user ?? this.user,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

// '예약구분: 구분값입니다.'
// '예약상태: 병원 확인 중'
// '예약일시: 2024. 08. 24'
// '예약시간: 14:00'
// '예약자명: 김준수'
// '연락처: 010-0000-0000'

// "이름: 토리"
// "출생일: 2023. 07. 17"
// "종류(품종): 시누이바"
// "기타특징: 연어 알러지가 있음"
// "전달사항: 겁쟁이 입니다ㅠ"
