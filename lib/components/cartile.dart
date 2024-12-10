import 'package:flutter/material.dart';
import 'package:myshop/class/bbdd.dart';
import 'package:myshop/class/product.dart';
import 'package:myshop/constant/darktheme.dart';

Widget cartTile({required Product product, required VoidCallback onUpdate}) {
  return Container(
    decoration: BoxDecoration(
      color: cardBackgroundColor,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: cardBorderColor, width: 2),
    ),
    child: Padding(
      padding: const EdgeInsets.only(right: 25.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // img
              Padding(
                padding: product.id < 5
                    ? const EdgeInsets.all(10.0)
                    : const EdgeInsets.all(25.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    product.imgpath,
                    width: product.id < 5 ? 175 : 120,
                    height: 125,
                  ),
                ),
              ),
              // name
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                        color: cardTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // price
                  Text(
                    '${product.price}\$',
                    style: const TextStyle(
                        color: cardPriceTextColor, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ],
          ),
          //control of + -
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  //remove from the cart
                  child: GestureDetector(
                    onTap: () async {
                      await deleteProduct(product.id);
                      onUpdate();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: cardHighlightColor),
                      ),
                      child: const Icon(
                        Icons.delete,
                        color: cardicon,
                        size: 35,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    //minus btn
                    GestureDetector(
                      onTap: () async {
                        await decreaseOrAugmentProduct(product.id, 0);
                        onUpdate();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: cardHighlightColor),
                        ),
                        child: const Icon(
                          Icons.remove,
                          color: cardicon,
                          size: 35,
                        ),
                      ),
                    ),
                    //quantity
                    Container(
                      decoration: BoxDecoration(
                        color: cardSubBackground,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: cardBorderColor),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        product.quantity.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    //plus btn
                    GestureDetector(
                      onTap: () async {
                        await decreaseOrAugmentProduct(product.id, 1);
                        onUpdate();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: cardHighlightColor),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: cardicon,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
