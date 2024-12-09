import 'package:myshop/class/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// creating the database using path and sqflite
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

// insert and handle the btn get pressed multiple times of the product to add to the cart
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

//initialize the database
Future<void> initializeDatabase() async {
  await getDatabase();
}

//funtion to get a list from the database of the objects products
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

//funtion to delete the product from the database
Future<void> deleteProduct(int id) async {
  final db = await getDatabase();
  await db.delete(
    'product',
    where: 'id = ?',
    whereArgs: [id],
  );
}

//function to add and decrease de amount of the product
Future<void> decreaseOrAugmentProduct(int id, int action) async {
  final db = await getDatabase();

  final List<Map<String, Object?>> result = await db.query(
    'product',
    columns: ['quantity'],
    where: 'id = ?',
    whereArgs: [id],
  );

  if (result.isNotEmpty) {
    int valor = result.first['quantity'] as int;

    if (action == 0) {
      if (valor > 1) {
        await db.update(
          'product',
          {'quantity': valor - 1},
          where: 'id = ?',
          whereArgs: [id],
        );
      } else {
        await deleteProduct(id);
      }
    } else {
      await db.update(
        'product',
        {'quantity': valor + 1},
        where: 'id = ?',
        whereArgs: [id],
      );
    }
  }
}

//function to get sum of quantity
Future<int> getTotalQuantity() async {
  final db = await getDatabase();

  final List<Map<String, Object?>> result = await db.rawQuery('''
    SELECT SUM(quantity) as totalQuantity FROM product
  ''');

  if (result.isNotEmpty && result.first['totalQuantity'] != null) {
    return result.first['totalQuantity'] as int;
  }

  return 0;
}
