import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

class Order {
  Order({
    required this.id,
    required this.usuario,
    required this.activa,
    required this.items,
  });

  final String id;
  final String usuario;
  final bool activa;
  final List<Item> items;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["_id"],
        usuario: json["usuario"],
        activa: json["activa"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );
}

class Item {
  Item({
    required this.producto,
    required this.cantidad,
    required this.nombre,
    required this.precio,
    required this.imagen,
  });

  final String producto;
  final int cantidad;
  final String nombre;
  final double precio;
  final String imagen;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        producto: json["producto"],
        cantidad: json["cantidad"],
        nombre: json["nombre"],
        precio: json["precio"],
        imagen: json["imagen"],
      );
}
