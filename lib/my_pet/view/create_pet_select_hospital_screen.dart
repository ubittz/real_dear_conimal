import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:real_dear_conimal/common/component/button/default_button.dart';
import 'package:real_dear_conimal/common/const/colors.dart';
import 'package:real_dear_conimal/common/const/image_path.dart';
import 'package:real_dear_conimal/common/view/completion_screen.dart';

import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../provider/selected_hospital_provider.dart';

class CreatePetSelectHospitalScreen extends ConsumerStatefulWidget {
  static String get routeName => 'create_pet_select_hospital';

  const CreatePetSelectHospitalScreen({super.key});

  @override
  ConsumerState<CreatePetSelectHospitalScreen> createState() =>
      _CreatePetSelectHospitalScreenState();
}

class _CreatePetSelectHospitalScreenState
    extends ConsumerState<CreatePetSelectHospitalScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedHospitalType = ref.watch(selectedHospitalProvider);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: ''),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '병원 키워드 선택',
              style: MyTextStyle.title24EB,
            ),
            const SizedBox(height: 8.0),
            Text(
              '마이펫 케어를 위한 병원 키워드를 선택해주세요.\n(최대 3개까지 선택 가능합니다.)',
              style: MyTextStyle.body14R,
            ),
            const SizedBox(height: 40.0),

            // 병원 키워드 선택
            Wrap(
              spacing: 12.0,
              runSpacing: 12.0,
              children: HospitalType.values
                  .mapIndexed(
                    (index, e) => InkWell(
                      onTap: () {
                        ref.read(selectedHospitalProvider.notifier).state = e;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedHospitalType == e
                              ? MyColor.main400
                              : MyColor.grayScale000,
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
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                '${ImagePath.petDirectory}check$index.png',
                                width: 32.0,
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                e.label,
                                style: MyTextStyle.body16R.copyWith(
                                  color: selectedHospitalType == e
                                      ? MyColor.grayScale000
                                      : MyColor.grayScale900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const Spacer(),
            SolidButton(
              onPressed: () {
                context.goNamed(CompletionScreen.routeName, pathParameters: {
                  "title": "마이펫 등록이\n완료되었습니다.",
                });
              },
              child: const Text('완료'),
            ),
          ],
        ),
      ),
    );
  }
}
