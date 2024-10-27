class CategoryModel {
  final String categoryName;
  final List<String> subCategoryNames;
  final String categoryImage;
  final String productName;

  CategoryModel({
    required this.categoryName,
    required this.subCategoryNames,
    required this.categoryImage,
    required this.productName,
  });
}