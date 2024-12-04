import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedHospitalProvider =
    StateProvider<HospitalType>((ref) => HospitalType.a);

enum HospitalType {
  a("안구질병전문병원"),
  b("24시_운영"),
  c("응급 진료 가능"),
  d("리뷰가 많은 병원"),
  e("수술 가능 병원");

  const HospitalType(this.label);

  final String label;
}
