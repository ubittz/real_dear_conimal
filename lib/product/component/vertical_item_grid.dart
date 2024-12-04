import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/utils/data_utils.dart';
import '../model/product_model.dart';
import '../view/product_detail_screen.dart';

class VerticalItemList extends ConsumerWidget {
  final List<ProductModel> products;

  const VerticalItemList({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double itemSpacing = 20.0;
    const double horizontalPadding = 20.0;
    final double itemWidth = (MediaQuery.of(context).size.width -
            (horizontalPadding * 2) -
            itemSpacing) /
        2;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: horizontalPadding,
      ),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: itemSpacing,
        crossAxisSpacing: itemSpacing,
        childAspectRatio: itemWidth / (itemWidth + 148), // / 1,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return GestureDetector(
          onTap: () {
            context.goNamed(
              ProductDetailScreen.routeName,
              pathParameters: {'id': product.id.toString()},
            );
          },
          child: SizedBox(
            width: itemWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: MyColor.grayScale100,
                      width: 1.0,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      product.mainImageUrl,
                      fit: BoxFit.cover,
                      height: itemWidth,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  product.manufacturer,
                  style: MyTextStyle.caption12R.copyWith(
                    color: MyColor.grayScale400,
                  ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  product.name,
                  style: MyTextStyle.body14R,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8.0),
                Text(
                  '${DataUtils.convertPriceToMoneyString(price: product.price)} 원',
                  style: MyTextStyle.subtitle16B,
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
                          '${product.reviewAverage}점',
                          style: MyTextStyle.caption12R.copyWith(
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
                          '${product.reviewCount}개의 리뷰',
                          style: MyTextStyle.caption12R.copyWith(
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
        );
      },
    );
  }
}
