enum ReservationStatus {
  request('예약요청'),
  confirmed('예약확정'),
  completion('완료');

  const ReservationStatus(this.label);

  final String label;
}
