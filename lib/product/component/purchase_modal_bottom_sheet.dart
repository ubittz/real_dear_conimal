import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:real_dear_conimal/common/component/button/default_button.dart';
import 'package:real_dear_conimal/product_cart/provider/product_cart_provider.dart';

import '../../common/component/modal/show/show_custom_toast.dart';
import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/utils/data_utils.dart';
import '../../order/view/create_order_screen.dart';
import '../model/product_model.dart';

class PurchaseModalBottomSheet extends ConsumerStatefulWidget {
  final ProductModel product;

  const PurchaseModalBottomSheet({
    super.key,
    required this.product,
  });

  @override
  ConsumerState<PurchaseModalBottomSheet> createState() =>
      _PurchaseModalBottomSheetState();
}

class _PurchaseModalBottomSheetState
    extends ConsumerState<PurchaseModalBottomSheet> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: MyColor.grayScale000,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.0),
        ),
      ),
      width: double.infinity,
      height: 450.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Image.asset(
                    widget.product.mainImageUrl,
                    width: 120.0,
                    height: 120.0,
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name,
                          style: MyTextStyle.body16R,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          "${DataUtils.convertPriceToMoneyString(price: widget.product.price)} 원",
                          style: MyTextStyle.title20EB,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '수량 선택',
                  style: MyTextStyle.subtitle16B,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (count > 1) {
                          setState(() {
                            count--;
                          });
                        }
                      },
                      icon: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: MyColor.grayScale400,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PhosphorIcon(
                            PhosphorIcons.minus(),
                            size: 20.0,
                            color: MyColor.grayScale900,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40.0,
                      child: Text(
                        count.toString(),
                        style: MyTextStyle.title20EB,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          count++;
                        });
                      },
                      icon: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color: MyColor.grayScale400,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PhosphorIcon(
                            PhosphorIcons.plus(),
                            size: 20.0,
                            color: MyColor.grayScale900,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Divider(
                color: MyColor.grayScale100,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '총 결제금액 ',
                  style: MyTextStyle.body16R,
                ),
                Text(
                  '${DataUtils.convertPriceToMoneyString(price: widget.product.price * count)} 원',
                  style: MyTextStyle.title20EB,
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            Row(
              children: [
                Expanded(
                  child: GhostButton(
                    onPressed: () {
                      ref.read(productCartProvider.notifier).addProduct(
                            product: widget.product,
                            amount: count,
                          );

                      context.pop();

                      showCustomToast(context, msg: '장바구니에 상품을 담았습니다.');
                    },
                    child: const Text('장바구니 담기'),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: SolidButton(
                    onPressed: () {
                      ref
                          .read(productCartProvider.notifier)
                          .updateAllSelected(isSelected: false);
                      ref
                          .read(productCartProvider.notifier)
                          .addProduct(product: widget.product, amount: count);
                      context.goNamed(CreateOrderScreen.routeName);
                    },
                    child: const Text('바로 구매하기'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
