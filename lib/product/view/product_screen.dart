import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:real_dear_conimal/common/component/button/custom_ink_well_button.dart';
import 'package:real_dear_conimal/product/component/product_horizontal_item_list.dart';
import 'package:real_dear_conimal/product/view/product_category_screen.dart';

import '../../common/component/etc/stress_row_text.dart';
import '../../common/const/colors.dart';
import '../../common/const/image_path.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../model/enum/product_category_type.dart';
import '../provider/category_provider.dart';
import '../provider/product_provider.dart';

class ProductScreen extends ConsumerStatefulWidget {
  static String get routeName => "product";

  const ProductScreen({super.key});

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  bool isFood = true;

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productProvider);

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
                  title: '푸드',
                  onTap: () {
                    setState(() {
                      isFood = true;
                    });
                  },
                  isSelected: isFood,
                ),
                const SizedBox(width: 8.0),
                CustomInkWellButton(
                  title: '헬스',
                  onTap: () {
                    setState(() {
                      isFood = false;
                    });
                  },
                  isSelected: !isFood,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Image.asset(ImagePath.productBanner5),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              child: Column(
                children: [
                  isFood
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  ref
                                      .read(selectedProductCategoryTypeProvider
                                          .notifier)
                                      .state = ProductCategoryType.feed;
                                  context
                                      .goNamed(ProductCategoryScreen.routeName);
                                },
                                child: Image.asset(ImagePath.feedButton),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  ref
                                      .read(selectedProductCategoryTypeProvider
                                          .notifier)
                                      .state = ProductCategoryType.snack;
                                  context
                                      .goNamed(ProductCategoryScreen.routeName);
                                },
                                child: Image.asset(ImagePath.snackButton),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  ref
                                      .read(selectedProductCategoryTypeProvider
                                          .notifier)
                                      .state = ProductCategoryType.supplements;
                                  context
                                      .goNamed(ProductCategoryScreen.routeName);
                                },
                                child: Image.asset(ImagePath.supplementsButton),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  ref
                                          .read(
                                              selectedProductCategoryTypeProvider
                                                  .notifier)
                                          .state =
                                      ProductCategoryType.nutritionalSnack;
                                  context
                                      .goNamed(ProductCategoryScreen.routeName);
                                },
                                child: Image.asset(
                                    ImagePath.nutritionalSnackButton),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: isFood
                  ? StressRowText(
                      title1: '현재 ',
                      title2: 'HOT한 상품 ',
                      title3: 'TOP7',
                      suffixWidget: PhosphorIcon(PhosphorIcons.caretRight()),
                    )
                  : StressRowText(
                      title1: '인기 ',
                      title2: '영양/보조제 ',
                      title3: 'TOP7',
                      suffixWidget: PhosphorIcon(PhosphorIcons.caretRight()),
                    ),
            ),
            const SizedBox(height: 12.0),
            ProductHorizontalItemList(
              products:
                  isFood ? products.sublist(0, 7) : products.sublist(14, 21),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Image.asset(ImagePath.productBanner6),
            ),
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: isFood
                  ? StressRowText(
                      title1: '지금 집중해야할 ',
                      title2: '신상품 ',
                      title3: 'TOP7',
                      suffixWidget: PhosphorIcon(PhosphorIcons.caretRight()),
                    )
                  : StressRowText(
                      title1: '인기 ',
                      title2: '영양 간식 ',
                      title3: 'TOP7',
                      suffixWidget: PhosphorIcon(PhosphorIcons.caretRight()),
                    ),
            ),
            const SizedBox(height: 12.0),
            ProductHorizontalItemList(
              products:
                  isFood ? products.sublist(7, 14) : products.sublist(21, 28),
            ),
            const SizedBox(height: 40.0),
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
