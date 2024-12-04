import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/component/button/custom_ink_well_button.dart';
import '../../common/component/etc/stress_row_text.dart';
import '../../common/const/colors.dart';
import '../../common/const/image_path.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../component/care_horizontal_item_list.dart';
import '../model/enum/care_category_type.dart';
import '../provider/care_category_provider.dart';
import '../provider/care_provider.dart';
import 'care_category_screen.dart';

class CareScreen extends ConsumerStatefulWidget {
  static String get routeName => 'care';

  const CareScreen({super.key});

  @override
  ConsumerState<CareScreen> createState() => _CareScreenState();
}

class _CareScreenState extends ConsumerState<CareScreen> {
  CareCategoryType _type = CareCategoryType.hospital;

  @override
  Widget build(BuildContext context) {
    final cares = ref.watch(careProvider);

    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '',
        titleWidget: Image.asset(
          ImagePath.appIconPure,
          fit: BoxFit.fitHeight,
          height: 72.0,
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomInkWellButton(
                  title: CareCategoryType.hospital.label,
                  onTap: () {
                    setState(() {
                      _type = CareCategoryType.hospital;
                    });
                  },
                  isSelected: _type == CareCategoryType.hospital,
                ),
                const SizedBox(width: 8.0),
                CustomInkWellButton(
                  title: CareCategoryType.hotel.label,
                  onTap: () {
                    setState(() {
                      _type = CareCategoryType.hotel;
                    });
                  },
                  isSelected: _type == CareCategoryType.hotel,
                ),
                const SizedBox(width: 8.0),
                CustomInkWellButton(
                  title: CareCategoryType.beauty.label,
                  onTap: () {
                    setState(() {
                      _type = CareCategoryType.beauty;
                    });
                  },
                  isSelected: _type == CareCategoryType.beauty,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Image.asset(ImagePath.careBanner7),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            ref
                                .read(selectedCareCategoryTypeProvider.notifier)
                                .state = CareCategoryType.hospital;
                            context.goNamed(CareCategoryScreen.routeName);
                          },
                          child: Image.asset(ImagePath.hospitalButton),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            ref
                                .read(selectedCareCategoryTypeProvider.notifier)
                                .state = CareCategoryType.beauty;
                            context.goNamed(CareCategoryScreen.routeName);
                          },
                          child: Image.asset(ImagePath.beautyButton),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      ref
                          .read(selectedCareCategoryTypeProvider.notifier)
                          .state = CareCategoryType.hotel;
                      context.goNamed(CareCategoryScreen.routeName);
                    },
                    child: Image.asset(ImagePath.hotelButton),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            if (_type == CareCategoryType.hospital)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: StressRowText(
                      title1: '마이펫 ',
                      title2: '인근 병원 ',
                      title3: '',
                      suffixWidget: PhosphorIcon(PhosphorIcons.caretRight()),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  CareHorizontalItemList(
                    cares: cares.sublist(0, 7),
                  ),
                ],
              )
            else if (_type == CareCategoryType.hotel)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: StressRowText(
                      title1: '인기 ',
                      title2: '호텔 ',
                      title3: 'TOP7',
                      suffixWidget: PhosphorIcon(PhosphorIcons.caretRight()),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  CareHorizontalItemList(
                    cares: cares.sublist(14, 21),
                  ),
                ],
              )
            else
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: StressRowText(
                      title1: '인기 ',
                      title2: '미용업체',
                      title3: 'TOP7',
                      suffixWidget: PhosphorIcon(PhosphorIcons.caretRight()),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  CareHorizontalItemList(
                    cares: cares.sublist(21, 28),
                  ),
                ],
              ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Image.asset(ImagePath.careBanner8),
            ),
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: StressRowText(
                title1: '지금 HOT한 ',
                title2: '케어 ',
                title3: 'TOP7',
                suffixWidget: PhosphorIcon(PhosphorIcons.caretRight()),
              ),
            ),
            const SizedBox(height: 12.0),
            CareHorizontalItemList(
              cares: cares.sublist(7, 14),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget _renderImageAndTitle({
    required String imageUrl,
    required String title,
    required double radius,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: radius,
            backgroundColor: MyColor.grayScale200,
            child: Image.asset(imageUrl),
          ),
          const SizedBox(height: 8.0),
          Text(
            title,
            style: MyTextStyle.body14R.copyWith(
              color: MyColor.grayScale700,
            ),
          ),
        ],
      ),
    );
  }
}
