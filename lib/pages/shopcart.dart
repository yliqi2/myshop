import 'package:flutter/material.dart';
import 'package:myshop/class/product.dart';
import 'package:myshop/constant/darktheme.dart';
import 'package:myshop/class/shoppingcart.dart';

class Shopcart extends StatefulWidget {
  const Shopcart({super.key});

  @override
  State<Shopcart> createState() => _ShopcartState();
}

class _ShopcartState extends State<Shopcart> {
  late List<Product> updatedList;
  @override
  void initState() {
    super.initState();
    loadCart();
  }

  void loadCart() async {
    updatedList = await fetchListFromDatabase();

    if (updatedList.isEmpty) print('empty');

    for (var product in updatedList) {
      print(
          'ID: ${product.id}, Name: ${product.name}, Price: ${product.price}, Quantity: ${product.quantity}');
    }
  }

  void _delete() async {
    List<Product> updatedList = await fetchListFromDatabase();
    removeProduct(updatedList, updatedList.first);
    loadCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            //my cart text
            const Padding(
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: const Divider(),
            ),

            ElevatedButton(
                onPressed: () => loadCart(), child: const Text('añadir')),
            ElevatedButton(
                onPressed: () => _delete(), child: const Text('eliminar')),
          ],
        ),
      ),

      //the order - wheels and rin

      //the order - cars

      //summary of the order

      //checkout button + total
    );
  }
}
