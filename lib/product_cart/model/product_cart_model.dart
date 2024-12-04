import '../../product/model/product_model.dart';

class ProductCartModel {
  final String id;
  final ProductModel product;
  final int amount;
  final bool isSelected;

  ProductCartModel({
    required this.id,
    required this.product,
    required this.amount,
    required this.isSelected,
  });

  ProductCartModel copyWith({
    String? id,
    ProductModel? product,
    int? amount,
    bool? isSelected,
  }) {
    return ProductCartModel(
      id: id ?? this.id,
      product: product ?? this.product,
      amount: amount ?? this.amount,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
