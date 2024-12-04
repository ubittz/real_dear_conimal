enum ReservationType {
  general("일반진료"),
  check("건강검진"),
  dental("치과"),
  counseling("행동교정 상담");

  const ReservationType(this.label);

  final String label;
}
