import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/model/product_model.dart';

class ProductController extends ChangeNotifier {
  ProductController() {
    fetchProducts();
    // fetchRandomOrderPosts();
  }

  var randomPosts = <Product>[];
  final TextEditingController searchQuery = TextEditingController();

  Future<List<Product>> fetchRandomOrderPosts() async {
    var random = Random();
    randomPosts = products;
    randomPosts.shuffle(random);
    notifyListeners();

    return randomPosts;
  }

  var searhResults = <Product>[];

  Future<List<Product>> onSearchTextChanged(String text) async {
    searhResults.clear();
    if (text.isEmpty) {
      notifyListeners();
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
    notifyListeners();
    return searhResults;
  }

// post reading time
  String readingTime(String text) {
    var words = text.split(' ');
    var readingTime = (words.length / 200).ceil();
    return '$readingTime মিনিট পড়ার সময়';
  }

  var products = <Product>[];
  bool isLoading = false;

  Future<List<Product>> fetchProducts() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    products.addAll([
      Product(
        id: 1,
        productName: 'Lenovo HE05',
        productDescription: 'বাংলাদেশের সবচেয়ে বড় বাজার',
        productImage: 'assets/images/headphone.jpg',
        productPrice: 160,
        productQuantity: 1,
        category: 'বাজার',
        isAvailable: true,
      ),
      Product(
        id: 2,
        productName: 'Yuventas Jersy',
        productDescription: 'বাংলাদেশের সবচেয়ে বড় বাজার',
        productImage: 'assets/images/yuv.jpg',
        productPrice: 380,
        productQuantity: 1,
        category: 'বাজার',
        isAvailable: true,
      ),
      Product(
        id: 3,
        productName: 'Brazil Jersy Yellow',
        productDescription: 'বাংলাদেশের সবচেয়ে বড় বাজার',
        productImage: 'assets/images/bra.jpg',
        productPrice: 350,
        productQuantity: 1,
        category: 'বাজার',
        isAvailable: true,
      ),
      Product(
        id: 4,
        productName: 'Brazil Jersy',
        productDescription: 'বাংলাদেশের সবচেয়ে বড় বাজার',
        productImage: 'assets/images/bra2.png',
        productPrice: 450,
        productQuantity: 1,
        category: 'বাজার',
        isAvailable: true,
      ),
      Product(
        id: 5,
        productName: 'M10 TWS',
        productDescription: 'বাংলাদেশের সবচেয়ে বড় বাজার',
        productImage: 'assets/images/tws.jpg',
        productPrice: 980,
        productQuantity: 1,
        category: 'বাজার',
        isAvailable: true,
      ),
      Product(
        id: 6,
        productName: 'inPods 12 TWS',
        productDescription: 'বাংলাদেশের সবচেয়ে বড় বাজার',
        productImage: 'assets/images/tws2.jpg',
        productPrice: 1250,
        productQuantity: 1,
        category: 'বাজার',
        isAvailable: true,
      ),
      Product(
        id: 7,
        productName: 'Lenovo HE05',
        productDescription: 'বাংলাদেশের সবচেয়ে বড় বাজার',
        productImage: 'assets/images/headphone.jpg',
        productPrice: 100,
        productQuantity: 1,
        category: 'বাজার',
        isAvailable: true,
      ),
      Product(
        id: 8,
        productName: 'Lenovo HE05',
        productDescription: 'বাংলাদেশের সবচেয়ে বড় বাজার',
        productImage: 'assets/images/headphone.jpg',
        productPrice: 100,
        productQuantity: 1,
        category: 'বাজার',
        isAvailable: true,
      ),
      Product(
        id: 9,
        productName: 'Lenovo HE05',
        productDescription: 'বাংলাদেশের সবচেয়ে বড় বাজার',
        productImage: 'assets/images/headphone.jpg',
        productPrice: 100,
        productQuantity: 1,
        category: 'বাজার',
        isAvailable: true,
      ),
      Product(
        id: 10,
        productName: 'Lenovo HE05',
        productDescription: 'বাংলাদেশের সবচেয়ে বড় বাজার',
        productImage: 'assets/images/headphone.jpg',
        productPrice: 100,
        productQuantity: 1,
        category: 'বাজার',
        isAvailable: true,
      ),
      Product(
        id: 11,
        productName: 'Lenovo HE05',
        productDescription: 'বাংলাদেশের সবচেয়ে বড় বাজার',
        productImage: 'assets/images/headphone.jpg',
        productPrice: 100,
        productQuantity: 1,
        category: 'বাজার',
        isAvailable: true,
      ),
      Product(
        id: 12,
        productName: 'Lenovo HE05',
        productDescription: 'বাংলাদেশের সবচেয়ে বড় বাজার',
        productImage: 'assets/images/headphone.jpg',
        productPrice: 100,
        productQuantity: 1,
        category: 'বাজার',
        isAvailable: true,
      ),
    ]);
    isLoading = false;
    notifyListeners();
    return products;
  }
}
