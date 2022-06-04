import 'package:delivery_app/app_util.dart';
import 'package:delivery_app/models/categorias.model.dart';
import 'package:delivery_app/models/restaurante.model.dart';

class RestauranteService {
  Future<List<Restaurante>> getRestaurantes({String categoria = ''}) async {
    final response = await AppUtils.sendRequest(
        endpoint:
            'https://data.mongodb-api.com/app/delivery_app-ennhb/endpoint/restaurantes?categoria=$categoria');
    return restaurantesFromJson(response);
  }

  Future<List<Categoria>> getCategorias() async {
    final response = await AppUtils.sendRequest(
        endpoint:
            'https://data.mongodb-api.com/app/delivery_app-ennhb/endpoint/categorias');
    return categoriasFromJson(response);
  }
}
