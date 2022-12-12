import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/model/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var randomPosts = <Product>[].obs;
  final TextEditingController searchQuery = TextEditingController();

  Future<List<Product>> fetchRandomProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    randomPosts = products;
    update();
    return randomPosts;
  }

  var searhResults = <Product>[].obs;

  Future<List<Product>> onSearchTextChanged(String text) async {
    searhResults.clear();
    if (text.isEmpty) {
      update();
      return searhResults;
    }

    for (var postDetail in products) {
      if (postDetail.productName.toLowerCase().contains(text.toLowerCase()) ||
          postDetail.productDescription
              .toLowerCase()
              .contains(text.toLowerCase()) ||
          postDetail.category.toLowerCase().contains(text.toLowerCase())) {
        searhResults.remove(postDetail);
        searhResults.add(postDetail);
      }
    }
    update();
    return searhResults;
  }

  var selectedIndex = 0.obs;
  void changeIndex(int index) {
    selectedIndex(index);
    update();
  }

  // filter by category
  var filterByCategory = <Product>[].obs;
  Future<List<Product>> filterByCategoryList(String category) async {
    filterByCategory.clear();
    for (var postDetail in products) {
      if (postDetail.category.toLowerCase().contains(category.toLowerCase())) {
        filterByCategory.remove(postDetail);
        filterByCategory.add(postDetail);
      }
    }
    print(filterByCategory.length);
    update();
    return filterByCategory;
  }

  var products = <Product>[].obs;
  var isLoading = false.obs;

  Future<List<Product>> fetchProducts() async {
    isLoading(true);
    update();
    await Future.delayed(const Duration(seconds: 1));
    products.addAll([
      Product(
        id: 1,
        productName: 'Lenovo HE05',
        productDescription:
            'The product detail page is a crucial element to your eCommerce strategy because it is where the fate of a potential sale lives. The product detail page should be carefully designed so that a hierarchy of information is presented in an intuitive manner.',
        productImage: 'assets/images/headphone.jpg',
        productPrice: 160.0,
        productQuantity: 1,
        category: 'Phones & Accessories',
        isAvailable: true,
      ),
      Product(
        id: 2,
        productName: 'Yuventas Jersy',
        productDescription:
            'The product detail page is a crucial element to your eCommerce strategy because it is where the fate of a potential sale lives. The product detail page should be carefully designed so that a hierarchy of information is presented in an intuitive manner.',
        productImage: 'assets/images/yuv.jpg',
        productPrice: 380.0,
        productQuantity: 1,
        category: "Men's Fashion",
        isAvailable: true,
      ),
      Product(
        id: 3,
        productName: 'Brazil Jersy Yellow',
        productDescription:
            'The product detail page is a crucial element to your eCommerce strategy because it is where the fate of a potential sale lives. The product detail page should be carefully designed so that a hierarchy of information is presented in an intuitive manner.',
        productImage: 'assets/images/bra.jpg',
        productPrice: 350.0,
        productQuantity: 1,
        category: "Men's Fashion",
        isAvailable: true,
      ),
      Product(
        id: 4,
        productName: 'Brazil Jersy',
        productDescription:
            'The product detail page is a crucial element to your eCommerce strategy because it is where the fate of a potential sale lives. The product detail page should be carefully designed so that a hierarchy of information is presented in an intuitive manner.',
        productImage: 'assets/images/bra2.png',
        productPrice: 450.0,
        productQuantity: 1,
        category: "Men's Fashion",
        isAvailable: true,
      ),
      Product(
        id: 5,
        productName: 'M10 TWS',
        productDescription:
            'The product detail page is a crucial element to your eCommerce strategy because it is where the fate of a potential sale lives. The product detail page should be carefully designed so that a hierarchy of information is presented in an intuitive manner.',
        productImage: 'assets/images/tws.jpg',
        productPrice: 980.0,
        productQuantity: 1,
        category: "Women's Fashion",
        isAvailable: true,
      ),
      Product(
        id: 6,
        productName: 'inPods 12 TWS',
        productDescription:
            'The product detail page is a crucial element to your eCommerce strategy because it is where the fate of a potential sale lives. The product detail page should be carefully designed so that a hierarchy of information is presented in an intuitive manner.',
        productImage: 'assets/images/tws2.jpg',
        productPrice: 1250.0,
        productQuantity: 1,
        category: "Women's Fashion",
        isAvailable: true,
      ),
      Product(
        id: 7,
        productName: 'Lenovo HE05',
        productDescription:
            'The product detail page is a crucial element to your eCommerce strategy because it is where the fate of a potential sale lives. The product detail page should be carefully designed so that a hierarchy of information is presented in an intuitive manner.',
        productImage: 'assets/images/headphone.jpg',
        productPrice: 100.0,
        productQuantity: 1,
        category: "Women's Fashion",
        isAvailable: true,
      ),
      Product(
        id: 8,
        productName: 'Lenovo HE05',
        productDescription:
            'The product detail page is a crucial element to your eCommerce strategy because it is where the fate of a potential sale lives. The product detail page should be carefully designed so that a hierarchy of information is presented in an intuitive manner.',
        productImage: 'assets/images/headphone.jpg',
        productPrice: 100.0,
        productQuantity: 1,
        category: "Women's Fashion",
        isAvailable: true,
      ),
      Product(
        id: 9,
        productName: 'Lenovo HE05',
        productDescription:
            'The product detail page is a crucial element to your eCommerce strategy because it is where the fate of a potential sale lives. The product detail page should be carefully designed so that a hierarchy of information is presented in an intuitive manner.',
        productImage: 'assets/images/headphone.jpg',
        productPrice: 100.0,
        productQuantity: 1,
        category: 'বাজার',
        isAvailable: true,
      ),
      Product(
        id: 10,
        productName: 'Lenovo HE05',
        productDescription:
            'The product detail page is a crucial element to your eCommerce strategy because it is where the fate of a potential sale lives. The product detail page should be carefully designed so that a hierarchy of information is presented in an intuitive manner.',
        productImage: 'assets/images/headphone.jpg',
        productPrice: 100.0,
        productQuantity: 1,
        category: 'বাজার',
        isAvailable: true,
      ),
      Product(
        id: 11,
        productName: 'Lenovo HE05',
        productDescription:
            'The product detail page is a crucial element to your eCommerce strategy because it is where the fate of a potential sale lives. The product detail page should be carefully designed so that a hierarchy of information is presented in an intuitive manner.',
        productImage: 'assets/images/headphone.jpg',
        productPrice: 100.0,
        productQuantity: 1,
        category: 'বাজার',
        isAvailable: true,
      ),
      Product(
        id: 12,
        productName: 'Lenovo HE05',
        productDescription:
            'The product detail page is a crucial element to your eCommerce strategy because it is where the fate of a potential sale lives. The product detail page should be carefully designed so that a hierarchy of information is presented in an intuitive manner.',
        productImage: 'assets/images/headphone.jpg',
        productPrice: 100.0,
        productQuantity: 1,
        category: 'বাজার',
        isAvailable: true,
      ),
    ]);

    isLoading(false);
    update();
    return products;
  }

  @override
  void onInit() {
    fetchProducts();
    fetchRandomProducts();
    super.onInit();
  }
}
