class ProductModel {
  final String id;
  final String manufacturer;
  final String name;
  final int price;
  final String mainImageUrl;
  final List<String> detailImageUrls;
  final List<String> categories;
  final String reviewAverage;
  final int reviewCount;
  final bool isLike;
  final int likeCount;

  ProductModel({
    required this.id,
    required this.manufacturer,
    required this.name,
    required this.price,
    required this.mainImageUrl,
    required this.detailImageUrls,
    required this.categories,
    required this.reviewAverage,
    required this.reviewCount,
    required this.isLike,
    required this.likeCount,
  });

  ProductModel copyWith({
    String? id,
    String? manufacturer,
    String? name,
    int? price,
    String? mainImageUrl,
    List<String>? detailImageUrls,
    List<String>? categories,
    String? reviewAverage,
    int? reviewCount,
    bool? isLike,
    int? likeCount,
  }) {
    return ProductModel(
      id: id ?? this.id,
      manufacturer: manufacturer ?? this.manufacturer,
      name: name ?? this.name,
      price: price ?? this.price,
      mainImageUrl: mainImageUrl ?? this.mainImageUrl,
      detailImageUrls: detailImageUrls ?? this.detailImageUrls,
      categories: categories ?? this.categories,
      reviewAverage: reviewAverage ?? this.reviewAverage,
      reviewCount: reviewCount ?? this.reviewCount,
      isLike: isLike ?? this.isLike,
      likeCount: likeCount ?? this.likeCount,
    );
  }
}
