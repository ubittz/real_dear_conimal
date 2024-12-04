import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/utils/data_utils.dart';
import '../../product/model/product_model.dart';
import '../model/product_cart_model.dart';

final selectedProductCartProvider = Provider<List<ProductCartModel>>((ref) {
  final carts = ref.watch(productCartProvider);

  return carts.where((element) => element.isSelected).toList();
});

final productCartProvider =
    StateNotifierProvider<ProductCartStateNotifier, List<ProductCartModel>>(
        (ref) {
  return ProductCartStateNotifier();
});

class ProductCartStateNotifier extends StateNotifier<List<ProductCartModel>> {
  ProductCartStateNotifier() : super([]);

  void addProduct({
    required ProductModel product,
    required int amount,
  }) {
    if (state.where((element) => element.product.id == product.id).isEmpty) {
      state = [
        ...state,
        ProductCartModel(
          id: DataUtils.getUuid(),
          product: product,
          amount: amount,
          isSelected: true,
        ),
      ];
    }
  }

  void addAllProduct({
    required List<ProductModel> products,
  }) {
    state = [
      ...state,
      ...products.map(
        (e) => ProductCartModel(
          id: DataUtils.getUuid(),
          product: e,
          amount: 1,
          isSelected: true,
        ),
      ),
    ];
  }

  void updateSelected({
    required String cartId,
    required bool isSelected,
  }) {
    state = state.map<ProductCartModel>((e) {
      if (e.id == cartId) {
        return e.copyWith(isSelected: isSelected);
      }
      return e;
    }).toList();
  }

  void updateAllSelected({
    required bool isSelected,
  }) {
    state = state.map<ProductCartModel>((e) {
      return e.copyWith(isSelected: isSelected);
    }).toList();
  }

  void removeProduct({
    required String id,
  }) {
    state = state.where((element) => element.id != id).toList();
  }

  void removeAll() {
    state = [];
  }

  void removeAllSelectedProduct() {
    state = state.where((element) => !element.isSelected).toList();
  }

  void updateAmount({
    required String cartId,
    required int amount,
  }) {
    state = state.map<ProductCartModel>((e) {
      if (e.id == cartId) {
        return e.copyWith(amount: amount);
      }
      return e;
    }).toList();
  }
}
