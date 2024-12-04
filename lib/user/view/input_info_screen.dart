import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:real_dear_conimal/common/component/button/default_button.dart';
import 'package:real_dear_conimal/common/component/text_form_filed/custom_label_text_form_field_and_button.dart';
import 'package:real_dear_conimal/home/view/home_screen.dart';

import '../../common/component/modal/show/show_custom_toast.dart';
import '../../common/component/text_form_filed/custom_label_text_form_field.dart';
import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';

class InputInfoScreen extends ConsumerStatefulWidget {
  static String get routeName => 'input_info';

  const InputInfoScreen({super.key});

  @override
  ConsumerState<InputInfoScreen> createState() => _InputInfoScreenState();
}

class _InputInfoScreenState extends ConsumerState<InputInfoScreen> {
  String? username;
  String? password;
  String? passwordCheck;
  String? name;
  String? email;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '회원가입'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: SolidButton(
          onPressed: () {
            context.goNamed(HomeScreen.routeName);
          },
          child: Text(
            '다음',
            style: MyTextStyle.button16M.copyWith(
              color: MyColor.grayScale000,
            ),
          ),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '회원가입',
                style: MyTextStyle.title24EB,
              ),
              const SizedBox(height: 4.0),
              Text(
                '가입을 위해 회원님의 정보를 입력해 주세요.',
                style: MyTextStyle.body14R.copyWith(
                  color: MyColor.grayScale700,
                ),
              ),
              const SizedBox(height: 40.0),
              CustomLabelTextFormFieldAndButton(
                title: '아이디',
                hintText: '아이디를 입력해 주세요.',
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
                textInputType: TextInputType.text,
                buttonText: '중복확인',
                buttonOnPressed: () {
                  showCustomToast(context, msg: "사용 가능한 아이디입니다.");
                },
              ),
              const SizedBox(height: 20.0),
              CustomLabelTextFormField(
                title: '비밀번호',
                hintText: '비밀번호를 입력해 주세요.',
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
                obscureText: true,
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20.0),
              CustomLabelTextFormField(
                title: '비밀번호 확인',
                hintText: '비밀번호를 다시 한번 입력해 주세요.',
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
                obscureText: true,
                textInputType: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
