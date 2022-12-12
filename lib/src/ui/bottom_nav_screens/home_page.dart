import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../provider/cart_controller.dart';
import '../../resource/data/data.dart';
import '../product_detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GetBuilder<ProductController>(
            init: ProductController(),
            initState: (_) {},
            builder: (productController) {
              return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  padding: const EdgeInsets.all(10),
                  itemCount: productController.products.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = productController.products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ProductDetailPage(
                              product: item,
                            );
                          },
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  item.productImage,
                                  height: 110,
                                  width: 100,
                                  fit: BoxFit.cover,
                                )),
                            const SizedBox(height: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  item.productName,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Text(
                                  '৳ ${item.productPrice.toString().replaceAll(".0", "")}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            GetBuilder<CartController>(
                              init: CartController(),
                              initState: (_) {},
                              builder: (cartController) {
                                return GestureDetector(
                                  onTap: () {
                                    cartController.addToCart(item);
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Add to Cart',
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
