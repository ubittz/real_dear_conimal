import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_dear_conimal/common/component/text_form_filed/custom_label_text_form_field_and_button.dart';
import 'package:real_dear_conimal/user/view/input_info_screen.dart';

import '../../common/component/modal/show/show_custom_toast.dart';
import '../../common/component/text_form_filed/custom_label_text_form_field.dart';
import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';

class CertificationScreen extends StatefulWidget {
  static String get routeName => 'certification';

  const CertificationScreen({super.key});

  @override
  State<CertificationScreen> createState() => _CertificationScreenState();
}

class _CertificationScreenState extends State<CertificationScreen> {
  bool isPushCertification = false;
  bool isDoneCertification = false;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '회원가입'),
      bottomNavigationBar: InkWell(
        onTap: () {
          context.goNamed(InputInfoScreen.routeName);
        },
        child: Container(
          height: 64.0,
          decoration: const BoxDecoration(color: MyColor.main400),
          child: Center(
              child: Text(
            '완료',
            style: MyTextStyle.button14M.copyWith(
              color: MyColor.grayScale000,
            ),
          )),
        ),
      ),
      child: SingleChildScrollView(
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
                '정보를 입력해주세요.',
                style: MyTextStyle.body14R.copyWith(
                  color: MyColor.grayScale700,
                ),
              ),
              const SizedBox(height: 40.0),
              CustomLabelTextFormField(
                title: '이름',
                hintText: '이름을 입력해주세요.',
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 20.0),
              CustomLabelTextFormFieldAndButton(
                title: '휴대폰 번호',
                hintText: '휴대폰 번호',
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
                buttonText: isPushCertification ? '재 전송' : '인증번호 전송',
                buttonOnPressed: () {
                  showCustomToast(context, msg: '인증번호가 전송되었습니다.');
                  setState(() {
                    isPushCertification = true;
                  });
                },
              ),
              const SizedBox(height: 20.0),
              CustomLabelTextFormFieldAndButton(
                title: '인증번호',
                hintText: '인증번호 입력',
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
                buttonText: '인증하기',
                buttonOnPressed: () {
                  showCustomToast(context, msg: '인증되었습니다.');
                  setState(() {
                    isDoneCertification = true;
                  });
                },
              ),
              const SizedBox(height: 20.0),
              CustomLabelTextFormField(
                title: '이메일',
                hintText: '이메일을 입력해 주세요.',
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
