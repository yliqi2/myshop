import 'package:myshop/class/product.dart';
import 'package:myshop/class/bbdd.dart';

//obtener lista
Future<List<Product>> fetchListFromDatabase() async {
  return await selectProductos(); // Asigna los productos desde la base de datos a `productList`
}

//eliminar objetos
void removeProduct(List<Product> productList, Product product) async {
  //remove en la base de datos
  deleteProduct(product.id);
  productList.remove(product);
}
