import 'package:flutter/material.dart';
import 'package:myshop/class/bbdd.dart';
import 'package:myshop/class/product.dart';
import 'package:myshop/constant/darktheme.dart';
import 'package:myshop/class/shoppingcart.dart';
import 'package:myshop/components/cartile.dart';
import 'package:slide_to_act/slide_to_act.dart';

class Shopcart extends StatefulWidget {
  final VoidCallback onUpdate;
  const Shopcart({super.key, required this.onUpdate});

  @override
  State<Shopcart> createState() => _ShopcartState();
}

class _ShopcartState extends State<Shopcart> {
  List<Product> updatedList = [];
  double totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    loadCart();
  }

  void loadCart() async {
    List<Product> fetchedList = await fetchListFromDatabase();
    double fetchedPrice = await getTotalPrice();

    setState(() {
      updatedList = fetchedList;
      totalPrice = fetchedPrice;
    });

    widget.onUpdate();
  }

  void onBuy() async {
    await deleteAllProduct();
    loadCart();
  }

  onCheckout() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: cardBackgroundColor,
          title: const Text(
            'Payment Successful',
            style: TextStyle(
              color: cardTextColor,
            ),
          ),
          content: const Text(
            'Your payment has been processed successfully.',
            style: TextStyle(
              color: primaryTextColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onBuy();
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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              onUpdate: loadCart,
                              width: width,
                              height: width),
                        ),
                      ),
                    ),
                  ),
            if (updatedList.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8, bottom: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: const BoxDecoration(
                          border: Border(top: BorderSide(color: Colors.white))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total:',
                            style: TextStyle(
                                color: logoTitleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            '$totalPrice\$',
                            style: const TextStyle(
                                color: logoTitleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SlideAction(
                      borderRadius: 12,
                      elevation: 0,
                      innerColor: Colors.white,
                      outerColor: redHighlightColor,
                      text: 'SLIDE TO PAY',
                      textStyle: const TextStyle(
                          color: logoTitleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                      sliderRotate: false,
                      onSubmit: () => onCheckout(),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
