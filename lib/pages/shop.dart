import 'package:flutter/material.dart';
import 'package:myshop/class/listproduct.dart';
import 'package:myshop/components/itemtile.dart';
import 'package:myshop/constant/darktheme.dart';

class Shop extends StatefulWidget {
  final VoidCallback onUpdate;
  const Shop({super.key, required this.onUpdate});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final Listproduct productList = Listproduct();

  void onProduct(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: cardBackgroundColor,
          title: const Text(
            "Cart Update",
            style: TextStyle(
              color: cardTextColor,
            ),
          ),
          content: const Text(
            'The product has been added to your cart or the quantity has been updated.',
            style: TextStyle(
              color: primaryTextColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                widget.onUpdate();
              },
              child: const Text(
                "OK",
                style: TextStyle(
                  color: cardHighlightColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final widthItem = screenWidth * 0.625;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(horizontal: 3.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: searchBarcolor,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Search for new models, wheels...',
                            style: TextStyle(),
                          ),
                          Icon(Icons.search),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rim & Wheels',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: logoTitleColor),
                        ),
                        Text(
                          'See all',
                          style:
                              TextStyle(fontSize: 16, color: redHighlightColor),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: 24,
                      child: Divider(),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
          // Horizontal List wheels
          SliverToBoxAdapter(
            child: SizedBox(
              height: 430,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productList.wheels.length,
                itemBuilder: (context, index) {
                  final product = productList.wheels[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            index == productList.wheels.length - 1 ? 20 : 10.0),
                    child: itemTile(
                      product: product,
                      width: widthItem,
                      onProduct: () => onProduct(context),
                    ),
                  );
                },
              ),
            ),
          ),
          // New Section Text - "Cars"
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 26,
                vertical: 16.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Models',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: logoTitleColor),
                      ),
                      Text(
                        'See all',
                        style:
                            TextStyle(fontSize: 16, color: redHighlightColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                    child: Divider(),
                  ),
                ],
              ),
            ),
          ),
          // Vertical List
          SliverPadding(
            padding: const EdgeInsets.only(right: 25),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = productList.products[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: itemTile(
                      product: product,
                      width: widthItem,
                      onProduct: () => onProduct(context),
                    ),
                  );
                },
                childCount: productList.products.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
              child: Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
