import 'package:flutter/material.dart';
import 'package:myshop/class/product.dart';
import 'package:myshop/constant/darktheme.dart';

Widget cartTile({required Product product}) {
  return Container(
    decoration: BoxDecoration(
      color: cardBackgroundColor,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: cardBorderColor),
    ),
    child: Padding(
      padding: const EdgeInsets.only(right: 25.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Imagen del producto
              Padding(
                padding: product.id < 5
                    ? const EdgeInsets.all(10.0)
                    : const EdgeInsets.all(25.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    product.imgpath,
                    width: product.id < 5 ? 175 : 120,
                  ),
                ),
              ),
              // Nombre, ID y precio
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
                  // Precio
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
          //control de + -
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.remove,
                    color: cardicon,
                    size: 35,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: cardSubBackground,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: cardBorderColor),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(product.quantity.toString()),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: cardicon,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
