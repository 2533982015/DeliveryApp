import 'dart:convert';

List<OrderHistory> orderHistoryFromJson(String str) => List<OrderHistory>.from(
    json.decode(str).map((x) => OrderHistory.fromJson(x)));

class OrderHistory {
  OrderHistory({
    required this.id,
    required this.usuario,
    required this.activa,
    required this.items,
    required this.fecha,
  });

  final String id;
  final String usuario;
  final bool activa;
  final List<Item> items;
  final DateTime fecha;

  factory OrderHistory.fromJson(Map<String, dynamic> json) => OrderHistory(
        id: json["_id"],
        usuario: json["usuario"],
        activa: json["activa"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        fecha: DateTime.parse(json["fecha"]),
      );
}

class Item {
  Item({
    required this.producto,
    required this.cantidad,
    required this.nombre,
    required this.imagen,
    required this.precio,
  });

  final String producto;
  final int cantidad;
  final String nombre;
  final String imagen;
  final double precio;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        producto: json["producto"],
        cantidad: json["cantidad"],
        nombre: json["nombre"],
        imagen: json["imagen"],
        precio: json["precio"].toDouble(),
      );
}
