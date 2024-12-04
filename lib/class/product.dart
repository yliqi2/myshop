// Implementació de la classe LlistaProductes. Aquesta classe ha de contenir el llistat de
// tots els productes i/o serveis de l’eCommerce creats amb el constructor de la classe
// Producte. Cada producte ha de tenir, almenys, un nom, un ID, un preu, una imatge i una
// descripció. Aquesta classe ha de representar la pantalla principal (Tenda) de l’aplicació.

class Product {
  int id;
  String name;
  double price;
  String imgPath;
  String desc;

  Product(this.id, this.name, this.price, this.imgPath, this.desc);

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imgpath': imgPath,
      'desc': desc
    };
  }
}
