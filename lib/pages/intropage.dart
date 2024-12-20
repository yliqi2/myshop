import 'package:flutter/material.dart';
import 'package:myshop/pages/gnav.dart';
import 'package:myshop/constant/darktheme.dart';

class Intropage extends StatelessWidget {
  const Intropage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Image.asset(
                  'assets/images/bmwlogo.png',
                  color: logoTitleColor,
                  scale: 1.3,
                ),
              ),
              const SizedBox(height: 48),
              const Text(
                'The Joy of Driving',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: logoTitleColor),
              ),
              const SizedBox(height: 24),
              const Text(
                'The BMW experience, now at your fingertips',
                style: TextStyle(fontSize: 16, color: subtitleColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Gnav())),
                child: Container(
                  decoration: BoxDecoration(
                      color: bottomColor,
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(25),
                  child: const Center(
                    child: Text(
                      'Make the experience yours',
                      style: TextStyle(
                          color: logoTitleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
