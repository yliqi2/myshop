import 'package:flutter/material.dart';
import 'package:myshop/constant/darktheme.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:badges/badges.dart' as b;
import 'package:myshop/pages/intropage.dart';
import 'package:myshop/pages/profile.dart';
import 'package:myshop/pages/shop.dart';
import 'package:myshop/pages/shopcart.dart';
import 'package:myshop/class/bbdd.dart';

class Gnav extends StatefulWidget {
  const Gnav({super.key});

  @override
  State<Gnav> createState() => _GnavState();
}

class _GnavState extends State<Gnav> {
  int _selectedIndex = 0;
  int _badgeCount = 0; // Guardar la cantidad del carrito

  // Remove const to allow dynamic initialization
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Initialize _pages after the class is constructed
    _pages = [
      Shop(
        onUpdate: updateBadgeCount,
      ),
      Shopcart(
        onUpdate:
            updateBadgeCount, // Pasamos el callback para actualizar el contador
      ),
      const Profile()
    ];
  }

  // Método para obtener el total de productos en el carrito
  Future<int> getBadgeCount() async {
    return await getTotalQuantity(); // Deberías tener la lógica de cómo obtener este total
  }

  // Función que actualiza el estado del carrito (cuando se añade, elimina o cambia cantidad)
  void updateBadgeCount() {
    getBadgeCount().then((count) {
      setState(() {
        _badgeCount = count; // Actualizar el contador
      });
    });
  }

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
            ),
          ),
        ),
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
        gap: 16,
        tabs: [
          const GButton(
            icon: Icons.home_rounded,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.shopping_bag_rounded,
            text: 'Cart',
            leading: FutureBuilder<int>(
              future: getBadgeCount(),
              builder: (context, snapshot) {
                final badgeCount = snapshot.data ??
                    _badgeCount; // Usar el _badgeCount que se actualiza
                return b.Badge(
                  badgeContent: badgeCount > 0
                      ? Text(
                          badgeCount < 10
                              ? ' $badgeCount '
                              : badgeCount > 99
                                  ? '+99'
                                  : badgeCount.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : null,
                  showBadge: badgeCount > 0,
                  badgeStyle: const b.BadgeStyle(
                    badgeColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                  ),
                  child: Icon(
                    Icons.shopping_bag_rounded,
                    color: _selectedIndex == 1
                        ? navBarActiveIconColor
                        : navBarUnselectedItemColor,
                    size: 30,
                  ),
                );
              },
            ),
          ),
          const GButton(
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
