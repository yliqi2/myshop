import 'package:myshop/class/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//función para crear la tabla y iniciar la tabla
Future<Database> getDatabase() async {
  return openDatabase(
    join(await getDatabasesPath(), 'product_db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE product(id INTEGER PRIMARY KEY, name TEXT, price REAL, imgpath TEXT, desc TEXT)');
    },
    version: 1,
  );
}

//función para insertar
Future<void> insertProduct(Product product) async {
  final db = await getDatabase();
  await db.insert('product', product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

//función para iniciar la base de datos
Future<void> initializeDatabase() async {
  await getDatabase();
}

// Future<void> 
