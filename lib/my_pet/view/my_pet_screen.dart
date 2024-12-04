import 'dart:io';

import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:real_dear_conimal/care/provider/care_provider.dart';
import 'package:real_dear_conimal/common/component/button/default_button.dart';
import 'package:real_dear_conimal/common/component/etc/stress_row_text.dart';
import 'package:real_dear_conimal/common/component/modal/modal_bottom_sheet_widget.dart';
import 'package:real_dear_conimal/common/component/modal/show/show_component_modal_bottom_sheet.dart';
import 'package:real_dear_conimal/common/component/modal/show/show_custom_general_dialog.dart';
import 'package:real_dear_conimal/common/component/modal/show/show_custom_toast.dart';
import 'package:real_dear_conimal/common/const/colors.dart';
import 'package:real_dear_conimal/common/const/image_path.dart';
import 'package:real_dear_conimal/common/const/text_styles.dart';
import 'package:real_dear_conimal/common/layout/default_app_bar.dart';
import 'package:real_dear_conimal/common/layout/default_layout.dart';
import 'package:real_dear_conimal/my_pet/component/pet_modal_bottom_sheet.dart';
import 'package:real_dear_conimal/user/provider/user_provider.dart';

import '../../care/component/care_horizontal_item_list.dart';
import '../../common/const/dummy.dart';
import '../../user/model/user_model.dart';

class MyPetScreen extends ConsumerStatefulWidget {
  static String get routeName => 'my_pet';

  const MyPetScreen({super.key});

  @override
  ConsumerState<MyPetScreen> createState() => _MyPetScreenState();
}

class _MyPetScreenState extends ConsumerState<MyPetScreen> {
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;

  // File? file;

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider) as UserModel;
    final pet = user.myPet;

    return DefaultLayout(
      appbar: DefaultAppBar(
        title: "",
        leadingWidth: 300.0,
        leading: InkWell(
          onTap: () {
            showCustomModalBottomSheet(
              context: context,
              bottomSheetWidget: ModalBottomSheetWidget(
                height: 380,
                child: PetModalBottomSheet(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Text(
                  '마이펫',
                  style: MyTextStyle.title24EB,
                ),
                const SizedBox(width: 8.0),
                PhosphorIcon(
                  PhosphorIcons.caretDown(),
                  size: 24.0,
                ),
              ],
            ),
          ),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const StressRowText(
                        title1: '마이펫의 ', title2: "최근 질병 사항", title3: ""),
                    const SizedBox(height: 6.0),
                    ...List.generate(
                      3,
                      (int index) {
                        late final imageUrl;
                        late final title;
                        late final description;
                        switch (index) {
                          case 0:
                            imageUrl = ImagePath.spoonButton;
                            title = '슬개골 탈구 2기';
                            description = '진료 진행 중';
                            break;
                          case 1:
                            imageUrl = ImagePath.iceButton;
                            title = '냉방병';
                            description = '완치';
                            break;
                          case 2:
                            imageUrl = ImagePath.spoonButton;
                            title = '급체';
                            description = '완치';
                            break;
                          default:
                            imageUrl = ImagePath.spoonButton;
                            title = '슬개골 탈구 2기';
                            description = '진료 진행 중';
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: MyColor.grayScale000,
                              border: Border.all(
                                  color: MyColor.grayScale100, width: 1),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: MyColor.grayScale100,
                                  offset: const Offset(0, 2),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        title,
                                        style: MyTextStyle.body20R,
                                      ),
                                      const SizedBox(height: 4.0),
                                      Text(
                                        description,
                                        style: MyTextStyle.body14R.copyWith(
                                          color: MyColor.grayScale500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    imageUrl,
                                    width: 60.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 40.0),
                    const StressRowText(
                        title1: '마이펫의 ', title2: "최근 질병 사항", title3: ""),
                    const SizedBox(height: 8.0),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isExpanded1 = !isExpanded1;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyColor.grayScale000,
                          border:
                              Border.all(color: MyColor.grayScale100, width: 1),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: MyColor.grayScale100,
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '바른펫동물의원 (2024. 08. 02)',
                                          style: MyTextStyle.body20R,
                                        ),
                                        isExpanded1
                                            ? PhosphorIcon(
                                                PhosphorIcons.caretUp())
                                            : PhosphorIcon(
                                                PhosphorIcons.caretDown()),
                                      ],
                                    ),
                                    if (isExpanded1)
                                      const SizedBox(height: 8.0),
                                    if (isExpanded1)
                                      Divider(
                                        color: MyColor.grayScale100,
                                        height: 20.0,
                                      ),
                                    if (isExpanded1)
                                      ...patScreenData[0]
                                          .mapIndexed((index, e) {
                                        late final title;
                                        switch (index) {
                                          case 0:
                                            title = '병명';
                                            break;
                                          case 1:
                                            title = '진단일';
                                            break;
                                          case 2:
                                            title = '예후 소견';
                                            break;
                                          default:
                                            title = '병명';
                                        }

                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 100.0,
                                                child: Text(
                                                  title,
                                                  style:
                                                      MyTextStyle.subtitle14B,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  e,
                                                  style: MyTextStyle.body14R,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isExpanded2 = !isExpanded2;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyColor.grayScale000,
                          border:
                              Border.all(color: MyColor.grayScale100, width: 1),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: MyColor.grayScale100,
                              offset: Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '바른펫동물의원 (2024. 07. 28)',
                                          style: MyTextStyle.body20R,
                                        ),
                                        isExpanded2
                                            ? PhosphorIcon(
                                                PhosphorIcons.caretUp())
                                            : PhosphorIcon(
                                                PhosphorIcons.caretDown()),
                                      ],
                                    ),
                                    if (isExpanded2)
                                      const SizedBox(height: 8.0),
                                    if (isExpanded2)
                                      Divider(
                                        color: MyColor.grayScale100,
                                        height: 20.0,
                                      ),
                                    if (isExpanded2)
                                      ...patScreenData[1]
                                          .mapIndexed((index, e) {
                                        late final title;
                                        switch (index) {
                                          case 0:
                                            title = '병명';
                                            break;
                                          case 1:
                                            title = '진단일';
                                            break;
                                          case 2:
                                            title = '예후 소견';
                                            break;
                                          default:
                                            title = '병명';
                                        }

                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 100.0,
                                                child: Text(
                                                  title,
                                                  style:
                                                      MyTextStyle.subtitle14B,
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  e,
                                                  style: MyTextStyle.body14R,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    SolidButton(
                      onPressed: () async {
                        showCustomGeneralDialog(
                          context: context,
                          bottomSheetWidget: _UploadPopUp(),
                        );
                      },
                      child: const Text('진단서 업로드'),
                    ),
                    const SizedBox(height: 40.0),
                    const StressRowText(
                        title1: '케어 ', title2: "솔루션", title3: ""),
                    const SizedBox(height: 8.0),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isExpanded3 = !isExpanded3;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: MyColor.grayScale000,
                          border:
                              Border.all(color: MyColor.grayScale100, width: 1),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: MyColor.grayScale100,
                              offset: Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '토리',
                                              style:
                                                  MyTextStyle.body20R.copyWith(
                                                color: MyColor.main400,
                                              ),
                                            ),
                                            Text(
                                              '의 케어 솔루션',
                                              style: MyTextStyle.body20R,
                                            ),
                                          ],
                                        ),
                                        isExpanded3
                                            ? PhosphorIcon(
                                                PhosphorIcons.caretUp())
                                            : PhosphorIcon(
                                                PhosphorIcons.caretDown()),
                                      ],
                                    ),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      '토리의 케어 히스토리를 분석하여 케어 솔루션을 제공합니다.',
                                      style: MyTextStyle.body14R.copyWith(
                                        color: MyColor.grayScale500,
                                      ),
                                    ),
                                    if (isExpanded3)
                                      const SizedBox(height: 8.0),
                                    if (isExpanded3)
                                      const Divider(
                                        color: MyColor.grayScale100,
                                        height: 20.0,
                                      ),
                                    if (isExpanded3)
                                      Text(
                                        '''1. 체중 관리\n- 체중 감소: 과체중은 관절에 더 큰 부담을 주므로, 적절한 체중을 유지하는 것이 중요합니다.\n- 균형 잡힌 식단: 고품질의 단백질과 관절 건강에 도움이 되는 오메가-3 지방산이 포함된 식단을 제공하세요.\n\n2. 적절한 운동\n- 부드러운 운동: 무리한 활동은 피하고, 슬개골에 무리가 가지 않는 선에서 가벼운 산책이나 수영 같은 운동을 시켜주세요.\n- 평평한 지면: 울퉁불퉁한 지형보다는 평평한 지면에서 산책하는 것이 좋습니다.\n\n3. 관절 보호 제품\n- 관절 보조제: 글루코사민, 콘드로이틴 등의 성분이 포함된 관절 보조제를 수의사와 상담 후 제공할 수 있습니다.\n- 슬개골 보호대: 슬개골을 지지하는 보호대를 사용하여 무릎이 안정되도록 돕습니다.\n\n4. 환경 관리\n- 미끄럼 방지: 강아지가 생활하는 공간에서 미끄러지지 않도록 러그나 카펫을 깔아주세요.\n- 점프 제한: 높은 곳에서 점프하지 않도록 소파나 침대로의 접근을 제한하는 것이 좋습니다.\n\n5. 수의사와의 상담\n- 정기적인 검사: 슬개골 탈구는 진행될 수 있으므로, 정기적으로 수의사와 상태를 점검하는 것이 중요합니다.\n- 수술적 치료: 심한 경우 수술이 필요할 수 있으므로, 수의사와의 상담을 통해 치료 방법을 결정하세요.\n\n슬개골 탈구는 관리와 케어를 통해 증상 완화와 더불어 삶의 질을 향상시킬 수 있습니다. 강아지의 상태에 맞는 적절한 조치를 취하는 것이 중요합니다.''',
                                        style: MyTextStyle.caption12R.copyWith(
                                          color: MyColor.grayScale500,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    const StressRowText(
                        title1: '유의질병 ', title2: "", title3: ""),
                    const SizedBox(height: 8.0),
                    ...List.generate(
                      2,
                      (int index) {
                        late final imageUrl;
                        late final title;
                        late final description;
                        switch (index) {
                          case 0:
                            imageUrl = ImagePath.pillButton;
                            title = '유의질병명';
                            description = '유의 영양소 내용입니다.';
                            break;
                          case 1:
                            imageUrl = ImagePath.syringeButton;
                            title = '유의질병명';
                            description = '유의 영양소 내용입니다.';
                            break;
                          default:
                            imageUrl = ImagePath.spoonButton;
                            title = '슬개골 탈구 2기';
                            description = '진료 진행 중';
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: MyColor.grayScale000,
                              border: Border.all(
                                  color: MyColor.grayScale100, width: 1),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: MyColor.grayScale100,
                                  offset: Offset(0, 2),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        title,
                                        style: MyTextStyle.body20R,
                                      ),
                                      const SizedBox(height: 4.0),
                                      Text(
                                        description,
                                        style: MyTextStyle.body14R.copyWith(
                                          color: MyColor.grayScale500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    imageUrl,
                                    width: 60.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 40.0),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: StressRowText(
                  title1: '추천 영양제',
                  title2: '',
                  title3: '',
                  suffixWidget: PhosphorIcon(
                    PhosphorIcons.caretRight(),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              CareHorizontalItemList(
                cares: ref.read(careProvider),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UploadPopUp extends StatefulWidget {
  const _UploadPopUp({
    super.key,
  });

  @override
  State<_UploadPopUp> createState() => _UploadPopUpState();
}

class _UploadPopUpState extends State<_UploadPopUp> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: file == null ? 200.0 : 222.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '진단서 업로드',
              style: MyTextStyle.title24EB,
            ),
            const SizedBox(height: 20.0),
            if (file != null)
              Text(
                '파일명: ${file!.path.split('/').last}',
                style: MyTextStyle.body16R,
              ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: OutlineButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text('돌아가기'),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: SolidButton(
                    onPressed: file == null
                        ? () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();
                            if (result != null) {
                              // reLoadFile(File(result.files.single.path!));
                              file = File(result.files.single.path!);
                              setState(() {});
                            }
                          }
                        : () {
                            context.pop();
                            showCustomToast(context, msg: "진단서가 업로드 되었습니다.");
                          },
                    child: file == null
                        ? const Text('파일 등록')
                        : const Text('업로드 하기'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
