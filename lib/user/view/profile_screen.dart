import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:real_dear_conimal/care/view/reservation_list_screen.dart';
import 'package:real_dear_conimal/common/component/button/default_button.dart';
import 'package:real_dear_conimal/user/view/edit_profile_screen.dart';

import '../../common/component/divider/divider_container.dart';
import '../../common/component/modal/show/show_cupertino_alert.dart';
import '../../common/const/colors.dart';
import '../../common/const/image_path.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../order/view/order_list_screen.dart';
import '../model/user_model.dart';
import '../provider/user_provider.dart';
import 'login_screen.dart';

class ProfileScreen extends ConsumerWidget {
  static String get routeName => "profile";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider) as UserModel;

    return DefaultLayout(
      backgroundColor: MyColor.grayScale000,
      appbar: DefaultAppBar(
        title: '',
        leadingWidth: 140.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
          child: Text(
            '마이페이지',
            style: MyTextStyle.title24EB,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _renderProfileTitle(user: user),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SolidButton(
                onPressed: () {
                  context.goNamed(EditProfileScreen.routeName);
                },
                child: const Text('내 정보 수정하기'),
              ),
            ),
            const DividerContainer(
              topHeight: 40.0,
              bottomHeight: 20.0,
            ),
            _renderTitleAndArrowButton(
              title: '주문 내역',
              onTap: () {
                context.pushNamed(OrderListScreen.routeName);
              },
            ),
            _renderTitleAndArrowButton(
              title: '예약 내역',
              onTap: () {
                context.pushNamed(ReservationListScreen.routeName);
              },
            ),
            _renderTitleAndArrowButton(
              title: '로그아웃',
              isEmptyArrow: true,
              onTap: () {
                showCustomCupertinoAlert(
                  context: context,
                  titleWidget: const Text('로그아웃 하시겠습니까?'),
                  completeText: '확인',
                  completeFunction: () {
                    context.goNamed(LoginScreen.routeName);
                  },
                  cancelText: '취소',
                  cancelFunction: () {
                    context.pop();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderProfileTitle({
    required UserModel user,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(ImagePath.user, height: 72.0, width: 72.0),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: MyTextStyle.title20EB,
              ),
              const SizedBox(height: 4.0),
              Text(
                user.email,
                style: MyTextStyle.body14R.copyWith(
                  color: MyColor.grayScale200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _renderTitleAndArrowButton({
    required String title,
    required VoidCallback onTap,
    bool isEmptyArrow = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 16.0,
        ),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: MyTextStyle.body14R,
              ),
              const SizedBox(width: 1.0),
              PhosphorIcon(PhosphorIcons.caretRight()),
            ],
          ),
        ),
      ),
    );
  }
}
