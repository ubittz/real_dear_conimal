import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hidable/hidable.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:real_dear_conimal/common/component/button/default_button.dart';
import 'package:real_dear_conimal/product/component/container_review.dart';
import 'package:real_dear_conimal/product_cart/provider/product_cart_provider.dart';
import 'package:real_dear_conimal/product_cart/view/product_cart_screen.dart';

import '../../common/component/divider/divider_container.dart';
import '../../common/component/modal/show/show_component_modal_bottom_sheet.dart';
import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../common/utils/data_utils.dart';
import '../component/container_question.dart';
import '../component/product_horizontal_item_list.dart';
import '../component/purchase_modal_bottom_sheet.dart';
import '../model/product_model.dart';
import '../provider/product_provider.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  static String get routeName => 'product_detail';

  final String id;

  const ProductDetailScreen({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  final ScrollController scrollController = ScrollController();
  int count = 1;

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productDetailProvider(widget.id));
    final productPrefer = ref.watch(productRandomProvider);

    final fullWidth = MediaQuery.of(context).size.width;
    final safeTopPadding = MediaQuery.of(context).padding.top;

    final carts = ref.watch(productCartProvider);

    return DefaultLayout(
      appbar: Hidable(
        preferredWidgetSize:
            Size.fromHeight(DefaultAppBar.defaultAppBarHeight + safeTopPadding),
        controller: scrollController,
        child: DefaultAppBar(
          title: '',
          action: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {
                  context.pushNamed(ProductCartScreen.routeName);
                },
                icon: badges.Badge(
                  showBadge: carts.isNotEmpty,
                  badgeContent: Text(
                    carts.length.toString(),
                    style: MyTextStyle.caption12R.copyWith(
                      color: MyColor.grayScale000,
                      height: 1.0,
                    ),
                  ),
                  child: PhosphorIcon(
                    PhosphorIcons.shoppingCart(),
                    size: 28.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Hidable(
        controller: scrollController,
        preferredWidgetSize: const Size.fromHeight(68),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  ref.read(productProvider.notifier).updateLike(
                        productId: product.id,
                        isLike: !product.isLike,
                      );
                },
                icon: product.isLike
                    ? PhosphorIcon(
                        PhosphorIcons.heart(PhosphorIconsStyle.fill),
                        color: MyColor.error,
                        size: 32.0,
                      )
                    : PhosphorIcon(
                        PhosphorIcons.heart(),
                        color: MyColor.grayScale400,
                        size: 32.0,
                      ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: OutlineButton(
                  onPressed: () {
                    showCustomModalBottomSheet(
                      context: context,
                      bottomSheetWidget: PurchaseModalBottomSheet(
                        product: product,
                      ),
                    );
                  },
                  child: const Text('장바구니'),
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: SolidButton(
                  onPressed: () {
                    showCustomModalBottomSheet(
                      context: context,
                      bottomSheetWidget: PurchaseModalBottomSheet(
                        product: product,
                      ),
                    );
                  },
                  child: const Text('구매하기'),
                ),
              ),
            ],
          ),
        ),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              product.mainImageUrl,
              width: fullWidth,
              height: fullWidth,
              fit: BoxFit.fitWidth,
            ),
            renderProductInfo(product: product),
            const DividerContainer(),
            renderDescriptionImages(
                detailImages: product.detailImageUrls.first),
            const SizedBox(height: 40.0),
            const DividerContainer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('이용안내', style: MyTextStyle.title24EB),
                  const SizedBox(height: 20.0),
                  Text(
                    '''- 결제완료 후 취소나 변경이 어려운 상품의 경우 상품페이지 내에 공지되어있으니 참고하여 구매 부탁드립니다.\n\n- 제주도 추가배송비 3000원, 제주도 내 산간벽지 6000원이 추가됩니다.\n\n- 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다. (색상 교환, 사이즈 교환 등 포함)''',
                    style: MyTextStyle.body14R.copyWith(
                      color: MyColor.grayScale300,
                    ),
                  ),
                ],
              ),
            ),
            const DividerContainer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: ContainerReview(),
            ),
            const DividerContainer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: ContainerQuestion(),
            ),
            const DividerContainer(),
            Padding(
              padding:
                  const EdgeInsets.only(left: 24.0, right: 24.0, top: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '함께보면 좋은 상품',
                    style: MyTextStyle.title24EB,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '더보기',
                      style: MyTextStyle.body16R.copyWith(
                        color: MyColor.grayScale300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            ProductHorizontalItemList(products: productPrefer),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }

  Widget renderProductInfo({
    required ProductModel product,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            product.manufacturer,
            style: MyTextStyle.caption12R.copyWith(
              color: MyColor.grayScale300,
            ),
          ),
          const SizedBox(width: 8.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  product.name,
                  style: MyTextStyle.body16R,
                ),
              ),
              const SizedBox(width: 12.0),
              IconButton(
                onPressed: () {
                  ref.read(productProvider.notifier).updateLike(
                        productId: product.id,
                        isLike: !product.isLike,
                      );
                },
                icon: product.isLike
                    ? PhosphorIcon(
                        PhosphorIcons.heart(PhosphorIconsStyle.fill),
                        color: MyColor.redCherry500,
                        size: 32.0,
                      )
                    : PhosphorIcon(
                        PhosphorIcons.heart(),
                        color: MyColor.grayScale400,
                        size: 32.0,
                      ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${DataUtils.convertPriceToMoneyString(price: product.price)} 원',
                style: MyTextStyle.subtitle18EB,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget renderDescriptionImages({
    required String detailImages,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 40.0, bottom: 20.0),
          child: Text(
            '상품 정보',
            style: MyTextStyle.title24EB,
          ),
        ),
        Container(
          color: MyColor.grayScale400,
          child: Image.asset(
            detailImages,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
