import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:real_dear_conimal/common/component/button/default_button.dart';

import '../../common/component/divider/divider_container.dart';
import '../../common/component/modal/show/show_cupertino_alert.dart';
import '../../common/component/modal/show/show_custom_toast.dart';
import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../common/utils/data_utils.dart';
import '../../order/view/create_order_screen.dart';
import '../../product/view/product_screen.dart';
import '../component/product_and_amount_card.dart';
import '../provider/product_cart_provider.dart';

class ProductCartScreen extends ConsumerStatefulWidget {
  static String get routeName => 'cart';

  const ProductCartScreen({super.key});

  @override
  ConsumerState<ProductCartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<ProductCartScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final carts = ref.watch(productCartProvider);
    print(carts.map((element) => element.isSelected));
    final isAllSelected =
        carts.firstWhereOrNull((element) => !element.isSelected) == null;

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '장바구니'),
      bottomNavigationBar: carts.isNotEmpty
          ? Padding(
              padding:
                  const EdgeInsets.only(bottom: 20.0, left: 24.0, right: 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: SolidButton(
                      onPressed: () {
                        // ref
                        //     .read(orderProvider.notifier)
                        //     .addProductsFromCarts(carts: carts);
                        context.pushNamed(CreateOrderScreen.routeName);
                      },
                      child: Text(
                        '${DataUtils.convertPriceToMoneyString(
                          price: carts.map((e) {
                            if (!e.isSelected) {
                              return 0;
                            }
                            return e.amount * e.product.price;
                          }).reduce((value, element) => value + element),
                        )} 원 주문하기',
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox(height: 0.0),
      child: carts.isNotEmpty
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 24.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          ref
                              .read(productCartProvider.notifier)
                              .updateAllSelected(isSelected: !isAllSelected);
                        },
                        child: Row(
                          children: [
                            (isAllSelected)
                                ? PhosphorIcon(
                                    PhosphorIcons.checkSquare(
                                      PhosphorIconsStyle.fill,
                                    ),
                                    color: MyColor.main400,
                                    size: 32.0,
                                  )
                                : PhosphorIcon(
                                    PhosphorIcons.square(),
                                    color: MyColor.grayScale900,
                                    size: 32.0,
                                  ),
                            const SizedBox(width: 8.0),
                            Text(
                              '전체 선택',
                              style: MyTextStyle.button16M,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showCustomCupertinoAlert(
                            context: context,
                            titleWidget: const Text('상품을 삭제하시겠습니까?'),
                            completeText: '삭제하기',
                            completeFunction: () {
                              ref
                                  .read(productCartProvider.notifier)
                                  .removeAllSelectedProduct();

                              showCustomToast(context, msg: '상품을 삭제했습니다.');
                              context.pop();
                            },
                            cancelText: '취소',
                            cancelFunction: () {
                              context.pop();
                            },
                          );
                        },
                        child: Text(
                          '선택 삭제',
                          style: MyTextStyle.button16M,
                        ),
                      ),
                    ],
                  ),
                ),
                const DividerContainer(),
                Expanded(
                  child: ListView.separated(
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    itemBuilder: (_, index) {
                      final cart = carts[index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: IconButton(
                              onPressed: () {
                                ref
                                    .read(productCartProvider.notifier)
                                    .updateSelected(
                                      cartId: cart.id,
                                      isSelected: !cart.isSelected,
                                    );
                              },
                              icon: cart.isSelected
                                  ? PhosphorIcon(
                                      PhosphorIcons.checkSquare(
                                        PhosphorIconsStyle.fill,
                                      ),
                                      color: MyColor.main400,
                                    )
                                  : PhosphorIcon(PhosphorIcons.square()),
                              iconSize: 32.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            child: ProductAndAmountCard(cart: cart),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Divider(
                          height: 40.0,
                          color: MyColor.grayScale100,
                        ),
                      );
                    },
                    itemCount: carts.length,
                  ),
                )
              ],
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 80.0),
                  Text(
                    '장바구니에\n담긴 상품이 없습니다.',
                    style: MyTextStyle.title20EB,
                    textAlign: TextAlign.start,
                  ),
                  const Expanded(child: SizedBox(height: 1.0)),
                  SolidButton(
                    onPressed: () {
                      context.goNamed(ProductScreen.routeName);
                    },
                    child: const Text('상품 보러가기'),
                  )
                ],
              ),
            ),
    );
  }
}
