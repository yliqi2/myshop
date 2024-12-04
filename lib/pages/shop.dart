import 'package:flutter/material.dart';
import 'package:myshop/class/listproduct.dart';
import 'package:myshop/components/itemtile.dart';
import 'package:myshop/constant/darktheme.dart';

class Shop extends StatelessWidget {
  Shop({super.key});

  final Listproduct productList = Listproduct();

  @override
  Widget build(BuildContext context) {
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
              height: 450,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productList.wheels.length,
                itemBuilder: (context, index) {
                  final product = productList.wheels[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            index == productList.wheels.length - 1 ? 20 : 10.0),
                    child: itemTile(product: product),
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
                    child: itemTile(product: product),
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
