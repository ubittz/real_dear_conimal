class MyPetModel {
  final String id;
  final String mainImageUrl;
  final String name; // 이름
  final DateTime birth; // 출생일
  final String kind; // 종류(품종)
  final String furColor; // 모색
  final String location; // 거주지역
  final String etc; // 기타특징
  final String message; // 전달사항

  MyPetModel({
    required this.id,
    required this.mainImageUrl,
    required this.name,
    required this.birth,
    required this.kind,
    required this.furColor,
    required this.location,
    required this.etc,
    required this.message,
  });

  MyPetModel copyWith({
    String? id,
    String? mainImageUrl,
    String? name,
    DateTime? birth,
    String? kind,
    String? furColor,
    String? location,
    String? etc,
    String? message,
  }) {
    return MyPetModel(
      id: id ?? this.id,
      mainImageUrl: mainImageUrl ?? this.mainImageUrl,
      name: name ?? this.name,
      birth: birth ?? this.birth,
      kind: kind ?? this.kind,
      furColor: furColor ?? this.furColor,
      location: location ?? this.location,
      etc: etc ?? this.etc,
      message: message ?? this.message,
    );
  }
}

// "이름: 토리"
// "출생일: 2023. 07. 17"
// "종류(품종): 시누이바"
// "기타특징: 연어 알러지가 있음"
// "전달사항: 겁쟁이 입니다ㅠ"
