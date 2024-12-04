import 'package:flutter/material.dart';
import 'package:myshop/constant/darktheme.dart';
import 'package:myshop/pages/shop.dart';
import 'package:myshop/pages/shopcart.dart';

class Navigationbar extends StatefulWidget {
  const Navigationbar({super.key});

  @override
  State<Navigationbar> createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  int _selectedIndex = 0;
  static final List<Widget> _sections = [
    Shop(),
    const Shopcart(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarBackgroundColor,
        iconTheme: const IconThemeData(color: appBarTextIconColor),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Amazon',
              style: TextStyle(color: appBarTextIconColor),
            ),
            IconButton(
              icon: const Icon(Icons.search_rounded),
              color: appBarTextIconColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: _sections[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTap,
        currentIndex: _selectedIndex,
        selectedItemColor: navBarActiveIconColor,
        selectedFontSize: 12,
        showUnselectedLabels: false,
        unselectedItemColor: navBarUnselectedItemColor,
        backgroundColor: navBarBackgroundColor,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              size: 20,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_rounded,
              size: 20,
            ),
            label: 'Shopping Cart',
          ),
        ],
      ),
    );
  }
}
