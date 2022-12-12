import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/resource/data/data.dart';
import 'package:get/get.dart';

import 'category_list_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryList = [
      "Phones & Accessories",
      "Home Appliances",
      "TV, Cameras & Gaming",
      "Computers & Laptops",
      "Home & Living",
      "Sports & Outdoors",
      "Men's Fashion",
      "Women's Fashion",
      "Health & Beauty",
      "Baby, Kids & Toys",
      "Global Collection",
    ];

    return Scaffold(
      body: GetBuilder<ProductController>(
          init: ProductController(),
          builder: (productController) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                          ),
                          child: ListTile(
                            onTap: () {
                              productController
                                  .filterByCategoryList(categoryList[index])
                                  .then((value) {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return const CategoryListScreen();
                                  },
                                ));
                              });
                              productController.update();
                            },
                            title: Text(
                              categoryList[index],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            );
          }),
    );
  }
}
