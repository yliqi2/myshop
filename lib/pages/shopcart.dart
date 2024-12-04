import 'package:flutter/material.dart';
import 'package:myshop/class/bbdd.dart';
import 'package:myshop/class/product.dart';
import 'package:myshop/constant/darktheme.dart';

class Shopcart extends StatefulWidget {
  const Shopcart({super.key});

  @override
  State<Shopcart> createState() => _ShopcartState();
}

class _ShopcartState extends State<Shopcart> {
  void fetchProducts() async {
    final List<Product> products = await productos();
    for (var product in products) {
      print('Product: ${product.name}, Price: ${product.price}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            //my cart text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: const Divider(),
            ),
          ],
        ),
      ),

      //the order - wheels and rin

      //the order - cars

      //checkout button + total
    );
  }
}
