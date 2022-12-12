import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/resource/data/data.dart';
import 'package:get/get.dart';
import '../components/nav_bar.dart';
import '../provider/cart_controller.dart';
import 'bottom_nav_screens/home_page.dart';
import 'cart_screen.dart';
import 'category_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomePage(),
      const CartScreen(),
      const CategoryScreen(),
      const CartScreen(),
    ];
    final ProductController productController = Get.put(ProductController());
    return Scaffold(
      extendBody: true,
      bottomNavigationBar:
          MyBottomNavBar(currentIndex: productController.selectedIndex.value),
      appBar: AppBar(
        title: const Text('Mahajon'),
        actions: [
          Stack(
            children: [
              GetBuilder<CartController>(
                init: CartController(),
                initState: (_) {},
                builder: (cartController) {
                  return Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          cartController.cartItems.length.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                },
                icon: Image.asset(
                  'assets/icons/cart.png',
                  height: 25,
                  width: 25,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: GetBuilder<ProductController>(
          init: ProductController(),
          builder: (cont) {
            return screens[cont.selectedIndex.value];
          }),
    );
  }
}
