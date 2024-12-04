import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_dear_conimal/product/model/enum/product_category_type.dart';

final selectedProductCategoryTypeProvider = StateProvider<ProductCategoryType>(
  (ref) => ProductCategoryType.feed,
);
