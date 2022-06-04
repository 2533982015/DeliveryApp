import 'dart:convert';

List<Categoria> categoriasFromJson(String str) =>
    List<Categoria>.from(json.decode(str).map((x) => Categoria.fromJson(x)));

class Categoria {
  Categoria({
    required this.id,
    required this.nombre,
  });

  final String id;
  final String nombre;

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        id: json["_id"],
        nombre: json["nombre"],
      );
}
