import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:real_dear_conimal/common/component/button/default_button.dart';
import 'package:real_dear_conimal/my_pet/view/create_pet_select_hospital_screen.dart';

import '../../common/component/drop_down/custom_drop_down_single.dart';
import '../../common/component/text_form_filed/custom_label_text_form_field.dart';
import '../../common/const/colors.dart';
import '../../common/const/image_path.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';

class CreatePetScreen extends ConsumerWidget {
  static String get routeName => 'create_pet';

  const CreatePetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: ''),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '마이펫 등록',
                style: MyTextStyle.title24EB,
              ),
              const SizedBox(height: 8.0),
              Text(
                '마이펫에 대한 정보를 입력해주세요.',
                style: MyTextStyle.body14R,
              ),
              const SizedBox(height: 20.0),
              CustomLabelTextFormField(
                title: '이름',
                hintText: '마이펫의 이름을 입력해 주세요.',
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              CustomLabelTextFormField(
                title: '출생일',
                hintText: 'ex. 20120130',
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              Text(
                '성별',
                style: MyTextStyle.body14R.copyWith(
                  color: MyColor.grayScale800,
                ),
              ),
              const SizedBox(height: 8.0),
              CustomSingleDropDown(
                dropdownList: const ['남아', '여아'],
                hintText: '선택해 주세요.',
                onChanged: (value) {},
                dropdownHeight: 100.0,
              ),
              const SizedBox(height: 20.0),
              Text(
                '종류/품종',
                style: MyTextStyle.body14R.copyWith(
                  color: MyColor.grayScale800,
                ),
              ),
              const SizedBox(height: 8.0),
              CustomSingleDropDown(
                dropdownList: [
                  "푸들",
                  "시츄",
                  "폴드",
                  "말티즈",
                  "샴",
                  "리트리버",
                  "블루",
                  "프리제",
                  "치와와",
                  "페르시안",
                ],
                hintText: '선택해 주세요.',
                onChanged: (value) {},
                dropdownHeight: 200.0,
              ),
              const SizedBox(height: 20.0),
              Text(
                '모색',
                style: MyTextStyle.body14R.copyWith(
                  color: MyColor.grayScale800,
                ),
              ),
              const SizedBox(height: 8.0),
              CustomSingleDropDown(
                dropdownList: [
                  "갈색",
                  "흰색",
                  "회색",
                  "베이지",
                  "황금색",
                  "은회색",
                  "검정색",
                ],
                hintText: '선택해 주세요.',
                onChanged: (value) {},
                dropdownHeight: 200.0,
              ),
              const SizedBox(height: 20.0),
              Text(
                '거주지역',
                style: MyTextStyle.body14R.copyWith(
                  color: MyColor.grayScale800,
                ),
              ),
              const SizedBox(height: 8.0),
              CustomSingleDropDown(
                dropdownList: [
                  "서울",
                  "부산",
                  "대구",
                  "인천",
                  "경기도",
                  "대전",
                  "광주",
                ],
                hintText: '선택해 주세요.',
                onChanged: (value) {},
                dropdownHeight: 200.0,
              ),
              const SizedBox(height: 20.0),
              Text(
                '프로필 이미지',
                style: MyTextStyle.body14R.copyWith(
                  color: MyColor.grayScale800,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    fit: StackFit.loose,
                    children: [
                      Image.asset(
                        ImagePath.user,
                        width: 92.0,
                        height: 92.0,
                      ),
                      Positioned(
                        right: -8.0,
                        bottom: -8.0,
                        child: IconButton(
                          onPressed: () {
                            print('camera');
                          },
                          iconSize: 20.0,
                          icon: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: MyColor.grayScale900,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: PhosphorIcon(PhosphorIcons.camera()),
                            ),
                          ),
                          color: MyColor.grayScale000,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 60.0),
              SolidButton(
                onPressed: () {
                  context.goNamed(CreatePetSelectHospitalScreen.routeName);
                },
                child: const Text('다음'),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
