import 'package:myshop/class/product.dart';

class Listproduct {
  final List<Product> products = [
    Product(
      id: 1,
      name: 'BMW 7 Series',
      price: 12000.99,
      imgpath: 'assets/images/bmw.png',
      desc:
          'A premium luxury sedan that combines elegant design, advanced technology, and exceptional performance for a truly sophisticated driving experience.',
      quantity: 0,
    ),
    Product(
      id: 2,
      name: 'BMW M4',
      price: 99999.50,
      imgpath: 'assets/images/bmw2.png',
      desc:
          'A sleek and stylish sport coupe designed for enthusiasts. Experience thrilling speed, agile handling, and unparalleled comfort on every drive.',
      quantity: 0,
    ),
    Product(
      id: 3,
      name: 'BMW 3 Series',
      price: 29999.00,
      imgpath: 'assets/images/bmw4.png',
      desc:
          'An efficient and practical compact hatchback ideal for urban adventures. Combines modern design with excellent fuel economy.',
      quantity: 0,
    ),
    Product(
      id: 4,
      name: 'BMW Z4',
      price: 44999.00,
      imgpath: 'assets/images/bmw5.png',
      desc:
          'A timeless classic convertible that offers a perfect blend of nostalgia and modern features. Enjoy open-top driving with exceptional elegance.',
      quantity: 0,
    ),
  ];

  final List<Product> wheels = [
    Product(
      id: 5,
      name: 'Turbo 22',
      price: 220.0,
      imgpath: 'assets/images/wheel.png',
      desc:
          'High-performance 22-inch wheels designed for speed and durability.',
      quantity: 0,
    ),
    Product(
      id: 6,
      name: 'Racing X',
      price: 240.0,
      imgpath: 'assets/images/wheel2.png',
      desc: 'Aerodynamic design for improved handling at high speeds.',
      quantity: 0,
    ),
    Product(
      id: 7,
      name: 'SportMax 18',
      price: 200.0,
      imgpath: 'assets/images/wheel3.png',
      desc:
          'Lightweight 18-inch wheels ideal for sports cars and precision driving.',
      quantity: 0,
    ),
  ];
}
