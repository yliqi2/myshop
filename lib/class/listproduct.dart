import 'package:myshop/class/product.dart';

class Listproduct {
  final List<Product> products = [
    Product(
      1,
      'Luxury Sedan',
      12000.99, // Precio actualizado para un modelo de lujo
      'assets/images/bmw.png',
      'A premium luxury sedan that combines elegant design, advanced technology, and exceptional performance for a truly sophisticated driving experience.',
    ),
    Product(
      2,
      'Sport Coupe',
      99999.50, // Precio actualizado para un coche deportivo
      'assets/images/bmw2.png',
      'A sleek and stylish sport coupe designed for enthusiasts. Experience thrilling speed, agile handling, and unparalleled comfort on every drive.',
    ),
    Product(
      3,
      'Compact Hatchback',
      29999.00, // Precio actualizado para un hatchback compacto
      'assets/images/bmw4.png',
      'An efficient and practical compact hatchback ideal for urban adventures. Combines modern design with excellent fuel economy.',
    ),
    Product(
      4,
      'Classic Convertible',
      44999.00, // Precio actualizado para un convertible clásico
      'assets/images/bmw5.png',
      'A timeless classic convertible that offers a perfect blend of nostalgia and modern features. Enjoy open-top driving with exceptional elegance.',
    ),
  ];

  final List<Product> wheels = [
    Product(5, 'Turbo 22', 220.0, 'assets/images/wheel.png',
        'High-performance 22-inch wheels designed for speed and durability.'),
    Product(6, 'Racing X', 240.0, 'assets/images/wheel2.png',
        'Aerodynamic design for improved handling at high speeds.'),
    Product(7, 'SportMax 18', 200.0, 'assets/images/wheel3.png',
        'Lightweight 18-inch wheels ideal for sports cars and precision driving.'),
  ];
}
