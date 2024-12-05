import 'package:flutter/material.dart';
import 'package:myshop/constant/darktheme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final widthProfile = screenWidth * 0.25;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 26,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //texto de profile

          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: logoTitleColor),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //foto de perfil
              Container(
                width: widthProfile,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widthProfile),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(widthProfile),
                  child: Image.asset('assets/images/profile.jpg'),
                ),
              ),
              //nombre
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Liqiang Y.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: redHighlightColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '@yliqi_2',
                    style: TextStyle(fontSize: 16, color: logoTitleColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 16, color: bottomColor),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          //Payments
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Transactions',
                    style: TextStyle(color: logoTitleColor),
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet_rounded,
                    size: 30,
                    color: logoTitleColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'My Wallet',
                    style: TextStyle(color: subtitleColor),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: logoTitleColor,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.attach_money,
                    size: 30,
                    color: logoTitleColor,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Finished Transactions',
                    style: TextStyle(color: subtitleColor),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: logoTitleColor,
                  ),
                ],
              ),
            ],
          )
          //metodo de pago
        ],
      ),
    );
  }
}
