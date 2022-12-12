import 'package:flutter_ecommerce_app/src/model/product_model.dart';

class CartItem {
  Product? product;
  int? quantity;

  CartItem({required this.product, required this.quantity});

  CartItem.fromString(String string) {
    var split = string.split(',');
    product = Product(
      id:  int.parse(split[0]),
      productName: split[1],
      productDescription: split[2],
      productPrice: double.parse(split[3]),
      productImage: split[4],
      category: split[5],
      productQuantity: int.parse(split[6]),
      isAvailable: true,
    );
    quantity = int.parse(split[6]);
  }
}
