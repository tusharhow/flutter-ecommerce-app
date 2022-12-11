import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/cart_item.dart';
import '../model/product_model.dart';

class CartController extends ChangeNotifier {
  var cartItems = <CartItem>[];

  CartController() {
    getCartItems();
  }

  Future<void> addToCart(Product product) async {
    var cartItem = cartItems.firstWhere(
      (element) => element.product!.id == product.id,
      orElse: () => CartItem(product: product, quantity: 0),
    );
    cartItem.quantity = cartItem.quantity! + 1;
    if (!cartItems.contains(cartItem)) {
      cartItems.add(cartItem);
    }
    notifyListeners();
    await saveCartItems();
  }

  Future<void> removeFromCart(Product product) async {
    var cartItem = cartItems.firstWhere(
      (element) => element.product!.id == product.id,
      orElse: () => CartItem(product: product, quantity: 0),
    );
    cartItem.quantity = cartItem.quantity! - 1;
    if (cartItem.quantity == 0) {
      cartItems.remove(cartItem);
    }
    notifyListeners();
    await saveCartItems();
  }

  Future<void> saveCartItems() async {
    var prefs = await SharedPreferences.getInstance();
    var cartItemStrings = cartItems.map((e) => e.toString()).toList();
    await prefs.setStringList('cartItems', cartItemStrings);
  }

  Future<void> getCartItems() async {
    var prefs = await SharedPreferences.getInstance();
    var cartItemStrings = prefs.getStringList('cartItems');
    if (cartItemStrings != null) {
      cartItems = cartItemStrings.map((e) => CartItem.fromString(e)).toList();
    }
    notifyListeners();
  }

  Future<void> clearCart() async {
    cartItems.clear();
    notifyListeners();
    await saveCartItems();
  }

  double get totalAmount {
    var total = 0.0;
    for (var element in cartItems) {
      total += element.product!.productPrice * element.quantity!;
    }
    return total;
  }

  Future<void> increaseQuantity(CartItem cartItem) async {
    cartItem.quantity = cartItem.quantity! + 1;
    notifyListeners();
    await saveCartItems();
  }

  Future<void> decreaseQuantity(CartItem cartItem) async {
    cartItem.quantity = cartItem.quantity! - 1;
    if (cartItem.quantity == 0) {
      cartItems.remove(cartItem);
    }
    notifyListeners();
    await saveCartItems();
  }
}
