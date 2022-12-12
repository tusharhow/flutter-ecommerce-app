import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/provider/cart_controller.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: GetBuilder<CartController>(
          init: CartController(),
          builder: (cartController) {
            if (cartController.cartItems.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      'No items in cart',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        minimumSize: const Size(100, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Go Back',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: cartController.cartItems.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final item = cartController.cartItems[index];
                                  return Container(
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    height: 120,
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 10),
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              item.product!.productImage,
                                              height: 110,
                                              width: 100,
                                              fit: BoxFit.cover,
                                            )),
                                        const SizedBox(width: 10),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.product!.productName,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            Text(
                                              '৳${item.product!.productPrice}',
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                            Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    cartController
                                                        .decreaseQuantity(item);
                                                  },
                                                  icon:
                                                      const Icon(Icons.remove),
                                                ),
                                                Text(
                                                  item.quantity.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    cartController
                                                        .increaseQuantity(item);
                                                  },
                                                  icon: const Icon(Icons.add),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            cartController
                                                .removeFromCart(item.product!);
                                          },
                                          icon: Icon(Icons.delete,
                                              color: Colors.redAccent
                                                  .withOpacity(0.5)),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          color: Colors.redAccent.withOpacity(0.1),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '৳${cartController.totalPrice}',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text('Checkout'),
                                              content: const Text(
                                                  'Are you sure you want to checkout?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: const Text('No'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Get.back();
                                                    cartController.checkout();
                                                  },
                                                  child: const Text('Yes'),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      minimumSize: const Size(110, 45),
                                      backgroundColor:
                                          Colors.redAccent.withOpacity(0.5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text('Checkout',
                                        style: TextStyle(fontSize: 16)),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          }),
    );
  }
}
