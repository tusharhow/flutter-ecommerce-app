import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/resource/data/data.dart';
import 'package:get/get.dart';

class MyBottomNavBar extends StatelessWidget {
  MyBottomNavBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);
  int currentIndex;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        init: ProductController(),
        builder: (productController) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: productController.selectedIndex.value,
                  onTap: (index) {
                    productController.changeIndex(index);
                    productController.update();
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/icons/home.png',
                        height: 25,
                        width: 25,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/icons/cart.png',
                        height: 25,
                        width: 25,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/icons/category.png',
                        height: 25,
                        width: 25,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        'assets/icons/user.png',
                        height: 25,
                        width: 25,
                      ),
                      label: 'Profile',
                    ),
                  ]),
            ),
          );
        });
  }
}
