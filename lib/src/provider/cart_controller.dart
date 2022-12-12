import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/cart_item.dart';
import '../model/product_model.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;
  var isLoading = false.obs;

  Future<void> addToCart(Product product) async {
    var cartItem = cartItems.firstWhere(
      (element) => element.product!.id == product.id,
      orElse: () => CartItem(product: product, quantity: 0),
    );
    cartItem.quantity = cartItem.quantity! + 1;
    if (!cartItems.contains(cartItem)) {
      cartItems.add(cartItem);
    }
    update();
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
    update();
    await saveCartItems();
  }

  Future<void> saveCartItems() async {
    var prefs = await SharedPreferences.getInstance();
    var cartItemStrings = cartItems.map((e) => e.toString()).toList();
    await prefs.setStringList('cartItems', cartItemStrings);
  }

  Future<void> getCartItems() async {
    isLoading(true);
    update();
    await Future.delayed(const Duration(seconds: 1));

    var prefs = await SharedPreferences.getInstance();
    var cartItemStrings = prefs.getStringList('cartItems');
    if (cartItemStrings != null) {
      cartItems =  cartItemStrings.map((e) => CartItem.fromString(e)).toList().obs;  
    }
    isLoading(false);
    update();
  }

  Future<void> clearCart() async {
    cartItems.clear();
    update();
    await saveCartItems();
  }

  double get totalPrice {
    var total = 0.0;
    for (var element in cartItems) {
      total += element.product!.productPrice * element.quantity!;
    }
    return total;
  }

  Future<void> increaseQuantity(CartItem cartItem) async {
    cartItem.quantity = cartItem.quantity! + 1;
    update();
    await saveCartItems();
  }

  Future<void> decreaseQuantity(CartItem cartItem) async {
    cartItem.quantity = cartItem.quantity! - 1;
    if (cartItem.quantity == 0) {
      cartItems.remove(cartItem);
    }
    update();
    await saveCartItems();
  }


  Future<void> checkout() async {
    Get.snackbar(
      'Checkout',
      'Checkout success with total price: \$${totalPrice.toStringAsFixed(2)}',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    cartItems.clear();
    update();
    await saveCartItems();
  }

  @override
  void onInit() {
    getCartItems();
    super.onInit();
  }
}
