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

// Función para insertar o actualizar un producto
Future<void> insertOrUpdateProduct(Product product) async {
  final db = await getDatabase();

  await db.rawInsert('''
    INSERT INTO product (id, name, price, imgpath, desc, quantity)
    VALUES (?, ?, ?, ?, ?, 1)
    ON CONFLICT(id) DO UPDATE SET
      name = excluded.name,
      price = excluded.price,
      imgpath = excluded.imgpath,
      desc = excluded.desc,
      quantity = product.quantity + 1
  ''', [
    product.id,
    product.name,
    product.price,
    product.imgpath,
    product.desc,
  ]);
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

//funcion para devolver true or false
Future<bool> isProductInCart(int productId) async {
  final db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query(
    'product',
    where: 'id = ?',
    whereArgs: [productId],
  );
  return result.isNotEmpty; // Retorna true si el producto ya existe.
}
