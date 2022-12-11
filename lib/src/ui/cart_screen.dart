import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/provider/cart_controller.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Provider.of<CartController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: cartController.cartItems.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final item = cartController.cartItems[index];
                return Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 120,
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            item.product!.productImage,
                            height: 110,
                            width: 100,
                            fit: BoxFit.cover,
                          )),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.product!.productName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            item.product!.productPrice.toString(),
                            style: const TextStyle(fontSize: 16),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  cartController.decreaseQuantity(item);
                                },
                                icon: const Icon(Icons.remove),
                              ),
                              Text(
                                item.quantity.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              IconButton(
                                onPressed: () {
                                  cartController.increaseQuantity(item);
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
                          cartController.removeFromCart(item.product!);
                        },
                        icon: Icon(Icons.delete,
                            color: Colors.redAccent.withOpacity(0.5)),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
