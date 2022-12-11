class Product {
  int id;
  String productName;
  String productDescription;
  String productImage;
  double productPrice;
  int productQuantity;
  String category;
  bool isAvailable;

  Product({
    required this.id,
    required this.productName,
    required this.productDescription,
    required this.productImage,
    required this.productPrice,
    required this.productQuantity,
    required this.category,
    required this.isAvailable,
  });
}
