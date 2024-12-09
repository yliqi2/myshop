import 'package:flutter/material.dart';
import 'package:myshop/class/product.dart';
import 'package:myshop/constant/darktheme.dart';
import 'package:myshop/class/shoppingcart.dart';
import 'package:myshop/components/cartile.dart';

class Shopcart extends StatefulWidget {
  final VoidCallback onUpdate;
  const Shopcart({super.key, required this.onUpdate});

  @override
  State<Shopcart> createState() => _ShopcartState();
}

class _ShopcartState extends State<Shopcart> {
  List<Product> updatedList = [];

  @override
  void initState() {
    super.initState();
    loadCart();
  }

  void loadCart() async {
    List<Product> fetchedList = await fetchListFromDatabase();

    setState(() {
      updatedList = fetchedList;
    });

    widget.onUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'My Cart',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: logoTitleColor),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(),
            ),
            updatedList.isEmpty
                ? const Expanded(
                    child: Center(
                      child: Text(
                        'No items in the cart',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: redHighlightColor),
                      ),
                    ),
                  )
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                        left: 10,
                      ),
                      child: ListView.builder(
                        itemCount: updatedList.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(
                              bottom: 25, top: index == 0 ? 25 : 0),
                          child: cartTile(
                            product: updatedList[index],
                            onUpdate:
                                loadCart, // Llamamos al callback para actualizar
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
