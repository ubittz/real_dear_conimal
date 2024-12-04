import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:real_dear_conimal/care/provider/care_provider.dart';
import 'package:real_dear_conimal/care/view/care_category_screen.dart';
import 'package:real_dear_conimal/care/view/care_detail_screen.dart';
import 'package:real_dear_conimal/care/view/care_screen.dart';
import 'package:real_dear_conimal/common/component/button/default_button.dart';
import 'package:real_dear_conimal/common/component/etc/stress_row_text.dart';
import 'package:real_dear_conimal/common/utils/data_utils.dart';
import 'package:real_dear_conimal/product/view/product_detail_screen.dart';

import '../../common/const/colors.dart';
import '../../common/const/dummy.dart';
import '../../common/const/image_path.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../product/provider/product_provider.dart';
import '../../product/view/product_screen.dart';
import '../../user/model/user_model.dart';
import '../../user/provider/user_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static String get routeName => "home";

  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    final UserModel user = ref.watch(userProvider) as UserModel;
    final products = ref.watch(productProvider);
    final cares = ref.watch(careProvider).sublist(0, 7);

    final gridItemWidth = (MediaQuery.of(context).size.width - 72 - 20) / 2;

    return DefaultLayout(
      backgroundColor: MyColor.grayScale050,
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
            SizedBox(
              height: 200.0,
              child: PageView.builder(
                controller: controller,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Image.asset(ImagePath.homeBanner1);
                  } else {
                    return Image.asset(ImagePath.homeBanner2);
                  }
                },
              ),
            ),
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
                            context.goNamed(ProductScreen.routeName);
                          },
                          child: Image.asset(ImagePath.shoppingButton),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            context.goNamed(CareScreen.routeName);
                          },
                          child: Image.asset(ImagePath.careButton),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Image.asset(ImagePath.homeBanner3),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: MyColor.grayScale000,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      StressRowText(
                        title1: '',
                        title2: user.name,
                        title3: '님을 위한 추천 상품',
                      ),
                      const SizedBox(height: 20.0),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          final product = products[index];

                          return InkWell(
                            onTap: () {
                              context.pushNamed(
                                ProductDetailScreen.routeName,
                                pathParameters: {'id': product.id.toString()},
                              );
                            },
                            child: Row(
                              children: [
                                Image.asset(product.mainImageUrl, width: 100.0),
                                const SizedBox(width: 8.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(product.manufacturer,
                                          style: MyTextStyle.caption12R),
                                      Text(product.name,
                                          style: MyTextStyle.body16R),
                                      Text(
                                        '${DataUtils.convertPriceToMoneyString(
                                          price: product.price,
                                        )}원',
                                        style: MyTextStyle.subtitle16B,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12.0),
                                PhosphorIcon(
                                  PhosphorIcons.heart(PhosphorIconsStyle.fill),
                                  color: MyColor.redCherry500,
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 16.0);
                        },
                        itemCount: 5,
                      ),
                      const SizedBox(height: 20.0),
                      SolidButton(
                        onPressed: () {
                          context.goNamed(ProductScreen.routeName);
                        },
                        child: const Text('추천상품 더보기'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: MyColor.grayScale000,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      StressRowText(
                        title1: '',
                        title2: user.name,
                        title3: '님을 위한 맞춤 추천 병원',
                      ),
                      const SizedBox(height: 20.0),
                      Wrap(
                        runSpacing: 20.0,
                        spacing: 20.0,
                        children: [
                          ...cares.map(
                            (e) => InkWell(
                              onTap: () {
                                context.pushNamed(
                                  CareDetailScreen.routeName,
                                  pathParameters: {'id': e.id.toString()},
                                );
                              },
                              child: SizedBox(
                                width: gridItemWidth,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        e.mainImageUrl,
                                        width: gridItemWidth,
                                        height: gridItemWidth,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      e.manufacturer,
                                      style: MyTextStyle.caption12R.copyWith(
                                        color: MyColor.grayScale400,
                                      ),
                                    ),
                                    Text(
                                      e.name,
                                      style: MyTextStyle.body16R,
                                    ),
                                    const SizedBox(height: 8.0),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            PhosphorIcon(
                                              PhosphorIcons.star(),
                                              color: MyColor.star,
                                              size: 16.0,
                                            ),
                                            const SizedBox(width: 2.0),
                                            Text(
                                              '${e.reviewAverage}점',
                                              style: MyTextStyle.caption12R
                                                  .copyWith(
                                                color: MyColor.grayScale400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 12.0),
                                        Row(
                                          children: [
                                            PhosphorIcon(
                                              PhosphorIcons.chatCentered(),
                                              size: 16.0,
                                            ),
                                            const SizedBox(width: 2.0),
                                            Text(
                                              '${e.reviewCount}개의 리뷰',
                                              style: MyTextStyle.caption12R
                                                  .copyWith(
                                                color: MyColor.grayScale400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      SolidButton(
                        onPressed: () {
                          context.pushNamed(CareCategoryScreen.routeName);
                        },
                        child: const Text('추천병원 더보기'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Image.asset(ImagePath.homeBanner4),
            ),
            const SizedBox(height: 40.0),
            const _Footer(),
          ],
        ),
      ),
    );
  }

  Widget _renderTitle({
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        title,
        style: MyTextStyle.body20R,
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColor.grayScale100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              footerData[0],
              style: MyTextStyle.title20EB.copyWith(
                color: MyColor.grayScale700,
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              footerData[1],
              style: MyTextStyle.caption12R.copyWith(
                color: MyColor.grayScale600,
              ),
            ),
            const SizedBox(height: 2.0),
            Text(
              footerData[2],
              style: MyTextStyle.caption12R.copyWith(
                color: MyColor.grayScale600,
              ),
            ),
            const SizedBox(height: 2.0),
            Text(
              footerData[3],
              style: MyTextStyle.caption12R.copyWith(
                color: MyColor.grayScale600,
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              footerData[4],
              style: MyTextStyle.caption12R.copyWith(
                color: MyColor.grayScale600,
              ),
            ),
            const SizedBox(height: 2.0),
            Text(
              footerData[5],
              style: MyTextStyle.caption12R.copyWith(
                color: MyColor.grayScale600,
              ),
            ),
            const SizedBox(height: 2.0),
            Text(
              footerData[6],
              style: MyTextStyle.caption12R.copyWith(
                color: MyColor.grayScale600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
