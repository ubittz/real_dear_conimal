import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_dear_conimal/common/component/button/custom_ink_well_button.dart';
import 'package:real_dear_conimal/common/component/wrap/horizontal_button_list.dart';
import 'package:real_dear_conimal/common/layout/default_app_bar.dart';
import 'package:real_dear_conimal/common/layout/default_layout.dart';
import 'package:real_dear_conimal/product/component/vertical_item_grid.dart';

import '../model/enum/product_category_type.dart';
import '../provider/category_provider.dart';
import '../provider/product_provider.dart';

class ProductCategoryScreen extends ConsumerWidget {
  static String get routeName => 'category';

  const ProductCategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productDividerProvider);
    final selectedProductCategoryType =
        ref.watch(selectedProductCategoryTypeProvider);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: ''),
      child: Column(
        children: [
          const SizedBox(height: 12.0),
          HorizontalButtonList(buttons: [
            ...ProductCategoryType.values.map((e) => CustomInkWellButton(
                  title: e.label,
                  onTap: () {
                    ref
                        .read(selectedProductCategoryTypeProvider.notifier)
                        .state = e;
                  },
                  isSelected: selectedProductCategoryType == e,
                )),
          ]),
          Expanded(
            child: VerticalItemList(products: products),
          ),
        ],
      ),
    );
  }
}
