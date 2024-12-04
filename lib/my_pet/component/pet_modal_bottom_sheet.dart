import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:real_dear_conimal/common/component/button/default_button.dart';
import 'package:real_dear_conimal/common/utils/data_utils.dart';
import 'package:real_dear_conimal/my_pet/view/create_pet_screen.dart';
import 'package:real_dear_conimal/user/model/user_model.dart';
import 'package:real_dear_conimal/user/provider/user_provider.dart';

import '../../common/component/etc/stress_row_text.dart';
import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';

class PetModalBottomSheet extends ConsumerWidget {
  const PetModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider) as UserModel;
    final pet = user.myPet;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const StressRowText(title1: '마이펫 선택', title2: "", title3: ""),
          const SizedBox(height: 12.0),
          Container(
            decoration: BoxDecoration(
              color: MyColor.grayScale000,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: const [
                BoxShadow(
                  color: MyColor.grayScale200,
                  offset: Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          pet.mainImageUrl,
                          width: 80.0,
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${pet.name}(남)',
                              style: MyTextStyle.body20R,
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              '출생일 : ${DataUtils.convertDateTimeToDateString(datetime: pet.birth)}',
                              style: MyTextStyle.body14R.copyWith(
                                color: MyColor.grayScale500,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              '종류(품종) : ${pet.kind}',
                              style: MyTextStyle.body14R.copyWith(
                                color: MyColor.grayScale500,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              '모색 : ${pet.furColor}',
                              style: MyTextStyle.body14R.copyWith(
                                color: MyColor.grayScale500,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              '거주지역 : ${pet.location}',
                              style: MyTextStyle.body14R.copyWith(
                                color: MyColor.grayScale500,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              '기타특징 : ${pet.etc}',
                              style: MyTextStyle.body14R.copyWith(
                                color: MyColor.grayScale500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          SolidButton(
            onPressed: () {
              context.goNamed(CreatePetScreen.routeName);
            },
            child: const Text('수정하기'),
          ),
        ],
      ),
    );
  }
}
