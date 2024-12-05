import 'package:myshop/class/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//función para crear la tabla y iniciar la tabla
Future<Database> getDatabase() async {
  return openDatabase(
    join(await getDatabasesPath(), 'product_db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE product(id INTEGER PRIMARY KEY, name TEXT, price REAL, imgpath TEXT, desc TEXT, quantity INTEGER)');
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

// función para obtener los datos
Future<List<Product>> selectProductos() async {
  final db = await getDatabase();

  List<Map<String, Object?>> productMap = await db.query('product');

  return [
    for (final {
          'id': id as int,
          'name': name as String,
          'price': price as double,
          'imgpath': imgpath as String,
          'desc': desc as String,
          'quantity': quantity as int,
        } in productMap)
      Product(
        id: id,
        name: name,
        price: price,
        imgpath: imgpath,
        desc: desc,
        quantity: quantity,
      ),
  ];
}

//función para eliminar una fila de la tabla productos
Future<void> deleteProduct(int id) async {
  final db = await getDatabase();
  await db.delete(
    'product',
    where: 'id = ?',
    whereArgs: [id],
  );
}
