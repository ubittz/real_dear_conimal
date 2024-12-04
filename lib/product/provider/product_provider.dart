import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_dear_conimal/common/const/image_path.dart';
import 'package:real_dear_conimal/product/model/enum/product_category_type.dart';
import 'package:real_dear_conimal/product/provider/category_provider.dart';

import '../../common/const/dummy.dart';
import '../../common/utils/data_utils.dart';
import '../model/product_model.dart';

final productDividerProvider = Provider<List<ProductModel>>((ref) {
  final products = ref.watch(productProvider);
  final selectedCategory = ref.watch(selectedProductCategoryTypeProvider);

  switch (selectedCategory) {
    case ProductCategoryType.feed:
      return products.sublist(0, 7);
    case ProductCategoryType.snack:
      return products.sublist(7, 14);
    case ProductCategoryType.supplements:
      return products.sublist(14, 21);
    case ProductCategoryType.nutritionalSnack:
      return products.sublist(21, 28);
    default:
      return products;
  }
});

final productRandomProvider = Provider<List<ProductModel>>((ref) {
  final products = ref.watch(productProvider);
  // final selectedCategory = ref.watch(categorySelectedProvider);

  final randomProducts =
      DataUtils.getRandomShuffledList<ProductModel>(products);
  return randomProducts;
});
//
// final productPreferProvider = Provider<List<ProductModel>>((ref) {
//   final products = ref.watch(productProvider);
//
//   final pairProducts = DataUtils.getRandomShuffledList<ProductModel>(products);
//   return pairProducts.take(4).toList();
// });

final productDetailProvider = Provider.family<ProductModel, String>((ref, id) {
  final product =
      ref.watch(productProvider).firstWhere((element) => element.id == id);
  return product;
});

final productProvider =
    StateNotifierProvider<ProductStateNotifier, List<ProductModel>>((ref) {
  return ProductStateNotifier();
});

class ProductStateNotifier extends StateNotifier<List<ProductModel>> {
  ProductStateNotifier() : super([]) {
    state = getItems();
  }

  void updateLike({
    required String productId,
    required bool isLike,
  }) {
    state = state.map((element) {
      if (element.id == productId) {
        return element.copyWith(isLike: isLike);
      } else {
        return element;
      }
    }).toList();
  }

  List<ProductModel> getItems() {
    return List.generate(
      productData.length,
      (index) {
        return ProductModel(
          id: index.toString(),
          manufacturer: productData.values.elementAt(index),
          name: productData.keys.elementAt(index),
          price: productPrices[index],
          mainImageUrl: '${ImagePath.productDirectory}$index.png',
          detailImageUrls: [
            '${ImagePath.productDirectory}$index.png',
            '${ImagePath.productDirectory}$index.png',
          ],
          categories: [
            'categories',
            'categories',
          ],
          reviewAverage: DataUtils.getRandomDouble(min: 4.5, range: 0.5)
              .toStringAsFixed(1),
          reviewCount: DataUtils.getRandomInt(dividerNumber: 100),
          isLike: true,
          likeCount: DataUtils.getRandomInt(dividerNumber: 100),
        );
      },
    );
  }
}
