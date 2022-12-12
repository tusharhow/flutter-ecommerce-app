import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/model/product_model.dart';
import 'package:flutter_ecommerce_app/src/provider/cart_controller.dart';
import 'package:flutter_ecommerce_app/src/resource/data/data.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    final ProductController productController = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        title: Text(product.productName),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                product.productImage,
                height: 300,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                    image: AssetImage(product.productImage),
                    height: 50,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(
                    image: AssetImage(product.productImage),
                    height: 50,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                product.productName,
                style: GoogleFonts.openSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 25),
                const Icon(Icons.star, color: Colors.orange, size: 25),
                const Icon(Icons.star, color: Colors.orange, size: 25),
                const Icon(Icons.star, color: Colors.orange, size: 25),
                const Icon(Icons.star, color: Colors.orange, size: 25),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '5.0 (302 Reviews)',
                  style:
                      GoogleFonts.openSans(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 6,
                ),
                Text(
                  '৳${product.productPrice}'.replaceAll(".0", ""),
                  style: GoogleFonts.openSans(
                    fontSize: 30,
                    color: const Color(0xff29B806),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  '৳${product.productPrice + 50}'.replaceAll(".0", ""),
                  style: GoogleFonts.openSans(
                      fontSize: 18,
                      color: const Color(0xff4B4B4B),
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    cartController.addToCart(product).then(
                          (value) => Get.snackbar(
                              'Success', 'Product added to cart successfully',
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.green,
                              colorText: Colors.white),
                        );
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Add to Cart',
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
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
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Buy Now',
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20 + 6,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Specification',
                style: GoogleFonts.oswald(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Row(
                children: [
                  Text(
                    'Brand',
                    style: GoogleFonts.raleway(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 16 * 6,
                  ),
                  Text(
                    'Mercury',
                    style: GoogleFonts.raleway(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Row(
                children: [
                  Text(
                    'Colour',
                    style: GoogleFonts.raleway(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 16 * 5 + 15,
                  ),
                  Text(
                    'Yellow',
                    style: GoogleFonts.raleway(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Row(
                children: [
                  Text(
                    'Item Weight',
                    style: GoogleFonts.raleway(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 16 * 4,
                  ),
                  Text(
                    '240 gm',
                    style: GoogleFonts.raleway(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text('Description',
                  style: GoogleFonts.oswald(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  )),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              product.productDescription,
              style: GoogleFonts.openSans(
                fontSize: 14,
                color: Colors.black54,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    product.productImage,
                    height: 170,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    product.productImage,
                    height: 170,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16 + 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text('Reviews',
                  style: GoogleFonts.oswald(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width / 0.90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                            image: AssetImage(
                              product.productImage,
                            ),
                            height: 60,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tushar Mahmud',
                            style: GoogleFonts.openSans(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit ut',
                            style: GoogleFonts.openSans(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('Similar Products',
                        style: GoogleFonts.oswald(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        )),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text('View All',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          )))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: productController.randomPosts.length,
                  itemBuilder: (context, index) {
                    final item = productController.randomPosts[index];
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 1.5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image(
                                        image: AssetImage(
                                          product.productImage,
                                        ),
                                        height: 60,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.productName,
                                        style: GoogleFonts.openSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '৳${product.productPrice}',
                                        style: GoogleFonts.openSans(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 16,
            ),
          ]),
        ),
      ),
    );
  }
}
