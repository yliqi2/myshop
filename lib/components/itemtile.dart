import 'package:flutter/material.dart';
import 'package:myshop/class/product.dart';
import 'package:myshop/constant/darktheme.dart';
import 'package:myshop/class/bbdd.dart';

Widget itemTile(
    {required Product product,
    required double width,
    required VoidCallback onProduct}) {
  return Container(
    // decoration
    margin: const EdgeInsets.only(left: 25),
    width: width,
    decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: cardBorderColor)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //car
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(product.imgpath),
          ),
        ),
        //desc
        Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 15, bottom: 30),
          child: Text(
            product.desc,
            style: const TextStyle(color: subtitleColor),
            textAlign: TextAlign.center,
          ),
        ),

        //name
        //price
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                          color: cardTextColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${product.price}\$',
                      style: const TextStyle(color: cardPriceTextColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),

              //add button
              GestureDetector(
                onTap: () async {
                  await insertOrUpdateProduct(product);
                  onProduct();
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: cardHighlightColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: cardicon,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
