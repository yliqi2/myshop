import 'package:flutter/material.dart';
import 'package:myshop/constant/darktheme.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:badges/badges.dart' as b;
import 'package:myshop/pages/intropage.dart';
import 'package:myshop/pages/profile.dart';
import 'package:myshop/pages/shop.dart';
import 'package:myshop/pages/shopcart.dart';

class Gnav extends StatefulWidget {
  const Gnav({super.key});

  @override
  State<Gnav> createState() => _GnavState();
}

class _GnavState extends State<Gnav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [Shop(), const Shopcart(), const Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarBackground,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Icon(
                    Icons.menu,
                    color: appBarTextIconColor,
                  ),
                ))),
      ),
      drawer: Drawer(
        backgroundColor: drawerBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/bmwlogo.png',
                        color: logoTitleColor,
                        scale: 3,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.home_rounded,
                      color: drawerIconColor,
                    ),
                    title: Text(
                      'Shop',
                      style: TextStyle(color: drawerTextColor),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: drawerIconColor,
                    ),
                    title: Text(
                      'About us',
                      style: TextStyle(color: drawerTextColor),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Intropage())),
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8, bottom: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: drawerIconColor,
                  ),
                  title: Text(
                    'Log out',
                    style: TextStyle(color: drawerTextColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: GNav(
        haptic: true,
        rippleColor: navBarActiveIconColor,
        color: navBarUnselectedItemColor,
        activeColor: navBarActiveIconColor,
        tabActiveBorder: Border.all(color: navBarBackgroundColor),
        tabBackgroundColor: navBarBackgroundColor,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        tabBorderRadius: 20,
        backgroundColor: navBarBackgroundColor,
        iconSize: 30,
        gap: 8,
        tabs: const [
          GButton(
            icon: Icons.home_rounded,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.shopping_bag_rounded,
            text: 'Cart',
            leading: b.Badge(
              badgeContent: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('3'),
              ),
              badgeStyle: b.BadgeStyle(
                  badgeColor: Colors.white,
                  padding: EdgeInsets.only(right: 10)),
              child: Icon(
                Icons.shopping_bag_rounded,
                size: 30,
              ),
            ),
          ),
          GButton(
            icon: Icons.person,
            text: '@yliqi_2',
            leading: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage(
                'assets/images/profile.jpg',
              ),
            ),
          ),
        ],
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
