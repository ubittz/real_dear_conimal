import 'package:flutter/material.dart';
import 'package:real_dear_conimal/product_cart/model/product_cart_model.dart';

import '../../common/const/text_styles.dart';
import '../../product_cart/component/product_and_amount_card.dart';

class ProductInfo extends StatelessWidget {
  final List<ProductCartModel> carts;

  const ProductInfo({
    super.key,
    required this.carts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '상품 정보',
            style: MyTextStyle.title24EB,
          ),
          const SizedBox(height: 8.0),
          ...carts.map(
            (cart) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ProductAndAmountCard(
                cart: cart,
                isFixed: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
