import 'package:flutter/material.dart';
import 'package:greengroocer/src/config/custom_colors.dart';
import 'package:greengroocer/src/pages/cart/cart_tab.dart';
import 'package:greengroocer/src/pages/home/home_tab.dart';
import 'package:greengroocer/src/pages/order/order_tab.dart';
import 'package:greengroocer/src/pages/profile/profile_tab.dart';
import 'package:greengroocer/src/repository/cart_repository.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  var currentIndex = 0;
  final pageController = PageController();
  CartRepository cartRepository = CartRepository();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomeTab(
            cartRepository: cartRepository,
          ),
          CartScreenView(
            controller: pageController,
            cartRepository: cartRepository,
          ),
          const OrderTab(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: CustomColors.customPurpleColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withAlpha(120),
          onTap: (index) {
            setState(() {
              currentIndex = index;
              pageController.jumpToPage(index);
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_sharp),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_outlined), label: 'Orders'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined), label: 'Profile'),
          ]),
    );
  }
}
