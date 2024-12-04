import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/dummy.dart';
import '../model/user_model.dart';

final userProvider = StateNotifierProvider<UserStateNotifier, UserModelBase>(
  (ref) => UserStateNotifier(),
);

class UserStateNotifier extends StateNotifier<UserModelBase> {
  UserStateNotifier() : super(UserModelLoading()) {
    initItems();
  }

  void updateInfo({
    required String name,
    required String password,
    required String email,
  }) {
    state = (state as UserModel).copyWith(
      name: name,
      password: password,
      email: email,
    );
  }

  void updateAddressName({
    required String name,
  }) {
    state = (state as UserModel).copyWith(
      address: (state as UserModel).address.copyWith(
            name: name,
          ),
    );
  }

  void updateAddressPhone({
    required String phone,
  }) {
    state = (state as UserModel).copyWith(
      address: (state as UserModel).address.copyWith(
            phone: phone,
          ),
    );
  }

  void initItems() {
    state = defaultUserModel;
  }
}
