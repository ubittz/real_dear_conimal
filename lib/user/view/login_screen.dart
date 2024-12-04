import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_dear_conimal/common/component/text_form_filed/custom_label_text_form_field.dart';
import 'package:real_dear_conimal/user/view/certification_screen.dart';

import '../../common/component/button/default_button.dart';
import '../../common/const/colors.dart';
import '../../common/const/image_path.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_layout.dart';
import '../../home/view/home_screen.dart';
import 'custom_sns_screen.dart';

class LoginScreen extends StatefulWidget {
  static String get routeName => "login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImagePath.appIcon,
                    width: MediaQuery.of(context).size.width * 2 / 7,
                  ),
                  Image.asset(
                    ImagePath.logo,
                    width: MediaQuery.of(context).size.width * 3 / 7,
                  ),
                ],
              ),
              const SizedBox(height: 60.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomLabelTextFormField(
                    title: '아이디',
                    hintText: "아이디를 입력해 주세요.",
                    onChanged: (String value) {},
                    onSaved: (String? newValue) {},
                    validator: (String? value) {},
                  ),
                  const SizedBox(height: 24.0),
                  CustomLabelTextFormField(
                    title: '비밀번호',
                    hintText: "비밀번호를 입력해 주세요.",
                    onChanged: (String value) {},
                    onSaved: (String? newValue) {},
                    validator: (String? value) {
                      return null;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(height: 24.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SolidButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await Future.delayed(const Duration(seconds: 1));
                        setState(() {
                          isLoading = false;
                        });
                        context.goNamed(HomeScreen.routeName);
                      },
                      child: const Text('로그인'),
                    ),
                  ),
                ],
              ),
              const _BottomButtons(),
              const SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: IconButton(
                        onPressed: () {
                          context.goNamed(
                            CustomSnsScreen.routeName,
                            pathParameters: {'title': 'naver'},
                          );
                        },
                        icon: Image.asset(
                          ImagePath.naverIcon,
                          // width: 56.0,
                        ),
                      ),
                    ),
                    Flexible(
                      child: IconButton(
                        onPressed: () {
                          context.goNamed(
                            CustomSnsScreen.routeName,
                            pathParameters: {'title': 'kakao'},
                          );
                        },
                        icon: Image.asset(
                          ImagePath.kakaoIcon,
                          // width: 40.0,
                        ),
                      ),
                    ),
                    Flexible(
                      child: IconButton(
                        onPressed: () {
                          context.goNamed(
                            CustomSnsScreen.routeName,
                            pathParameters: {'title': 'google'},
                          );
                        },
                        icon: Image.asset(
                          ImagePath.googleIcon,
                          // width: 56.0,
                        ),
                      ),
                    ),
                    Flexible(
                      child: IconButton(
                        onPressed: () {
                          context.goNamed(
                            CustomSnsScreen.routeName,
                            pathParameters: {'title': 'apple'},
                          );
                        },
                        icon: Image.asset(
                          ImagePath.appleIcon,
                          // width: 56.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomButtons extends StatelessWidget {
  const _BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        renderButton(
          title: 'ID/PW 찾기',
          onPressed: () {},
        ),
        renderDivider(),
        renderButton(
          title: '회원가입',
          onPressed: () {
            context.goNamed(CertificationScreen.routeName);
          },
        ),
      ],
    );
  }

  Widget renderDivider() {
    return Container(
      color: MyColor.grayScale400,
      height: 16.0,
      width: 1.0,
    );
  }

  Widget renderButton({
    required String title,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: MyTextStyle.button16M.copyWith(
          color: MyColor.grayScale400,
        ),
      ),
    );
  }
}
