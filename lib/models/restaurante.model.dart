import 'dart:convert';

List<Restaurante> restaurantesFromJson(String str) => List<Restaurante>.from(
    json.decode(str).map((x) => Restaurante.fromJson(x)));

class Restaurante {
  Restaurante({
    required this.id,
    required this.nombre,
    required this.idCategoria,
    required this.imagen,
    required this.products,
  });

  final String id;
  final String nombre;
  final String idCategoria;
  final String imagen;
  final List<Product> products;

  factory Restaurante.fromJson(Map<String, dynamic> json) => Restaurante(
        id: json["_id"],
        nombre: json["nombre: "],
        idCategoria: json["idCategoria"],
        imagen: json["imagen"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );
}

class Product {
  Product({
    required this.id,
    required this.nombre,
    required this.imagen,
    required this.descripcion,
    required this.precio,
  });

  final String id;
  final String nombre;
  final String imagen;
  final String descripcion;
  final double precio;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        nombre: json["nombre"],
        imagen: json["imagen"],
        descripcion: json["descripcion"],
        precio: json["precio"].toDouble(),
      );
}
