enum ProductCategoryType {
  feed("사료"),
  snack("간식"),
  supplements("영양/보조제"),
  nutritionalSnack("영양간식");

  const ProductCategoryType(this.label);

  final String label;
}
