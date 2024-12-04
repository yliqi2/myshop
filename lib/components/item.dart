import 'package:flutter/material.dart';
import 'package:myshop/class/product.dart';
import 'package:myshop/constant/darktheme.dart';

Widget item({required Product product}) {
  return Card(
    elevation: 5,
    color: cardBackgroundColor,
    shadowColor: cardShadowColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
      side: const BorderSide(color: cardBorderColor, width: 1.5),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: AssetImage(product.imgPath), fit: BoxFit.cover)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    color: cardTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.desc,
                  style: const TextStyle(
                    color: primaryTextColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${product.price.toString()} €',
                  style: const TextStyle(
                    color: cardPriceTextColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.add_circle_outline_sharp,
            color: redHighlightColor,
            size: 20,
          ),
        ],
      ),
    ),
  );
}
