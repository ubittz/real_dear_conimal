import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/const/text_styles.dart';
import '../../common/utils/data_utils.dart';
import '../model/order_model.dart';

class OrderListCard extends ConsumerWidget {
  final OrderModel order;

  const OrderListCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _renderTitleAndDescription(
          title: '상품명',
          description: order.carts.length > 1
              ? '${order.carts.first.product.name}외 ${order.carts.length - 1}개'
              : order.carts.first.product.name,
        ),
        _renderTitleAndDescription(
          title: '주문번호',
          description: DataUtils.extractNumbers(order.id.split('-').join())
              .substring(0, 9),
        ),
        _renderTitleAndDescription(
          title: '결제금액',
          description:
              '${DataUtils.convertPriceToMoneyString(price: order.payment.price)} 원',
        ),
        _renderTitleAndDescription(
          title: '주문상태',
          description: order.status.label,
        ),
      ],
    );
  }

  Widget _renderTitleAndDescription({
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80.0,
            child: Text(
              title,
              style: MyTextStyle.body16R,
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Text(
              description,
              style: MyTextStyle.body16R,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
