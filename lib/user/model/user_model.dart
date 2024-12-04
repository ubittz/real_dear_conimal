import 'package:real_dear_conimal/my_pet/model/my_pet_model.dart';

import 'address_model.dart';

abstract class UserModelBase {}

class UserModelLoading extends UserModelBase {}

class UserModelError extends UserModelBase {
  final String message;

  UserModelError({
    required this.message,
  });
}

class UserModel extends UserModelBase {
  final int id; // primary key
  final String username;
  final String password;
  final String name;
  final String email;

  // additional
  final String nickname;
  final String phone;
  final String profileImage;
  final AddressModel address;
  final MyPetModel myPet;

  UserModel({
    required this.id,
    required this.username,
    required this.password,
    required this.name,
    required this.email,
    required this.nickname,
    required this.phone,
    required this.profileImage,
    required this.address,
    required this.myPet,
  });

  UserModel copyWith({
    int? id,
    String? username,
    String? password,
    String? name,
    String? email,
    String? nickname,
    String? phone,
    String? profileImage,
    AddressModel? address,
    MyPetModel? myPet,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      name: name ?? this.name,
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      phone: phone ?? this.phone,
      profileImage: profileImage ?? this.profileImage,
      address: address ?? this.address,
      myPet: myPet ?? this.myPet,
    );
  }
}
