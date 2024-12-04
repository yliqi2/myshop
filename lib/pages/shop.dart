import 'package:flutter/material.dart';
import 'package:myshop/class/listproduct.dart';
import 'package:myshop/components/item.dart';
import 'package:myshop/constant/darktheme.dart';
import 'package:myshop/class/bbdd.dart';

class Shop extends StatelessWidget {
  Shop({super.key});

  final Listproduct productList = Listproduct();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Column(
                        children: List.generate(
                          productList.products.length,
                          (index) {
                            final product = productList.products[index];
                            return GestureDetector(
                              onTap: () async {
                                await insertProduct(product);
                                print('${product.id} insertado.');
                              },
                              child: item(product: product),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
