import 'package:delivery_app/models/categorias.model.dart';
import 'package:delivery_app/models/restaurante.model.dart';
import 'package:delivery_app/services/restaurante.service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController({required this.restauranteService});
  final RestauranteService restauranteService;

  //categorias
  final RxList<dynamic> _categorias = [].obs;
  RxList<dynamic> get categorias => _categorias;
  set categorias(value) => _categorias.assignAll(value);

  //restaurantes
  late List<Restaurante> restaurantesData;
  final RxList<dynamic> _restaurantes = [].obs;
  RxList<dynamic> get restaurantes => _restaurantes;
  set restaurantes(value) => _restaurantes.assignAll(value);

  @override
  Future<void> onInit() async {
    super.onInit();
    getCategorias();
    getRestaurantes();
  }

  Future<void> getCategorias() async {
    var categoriasData = await restauranteService.getCategorias();
    categoriasData.insert(0, Categoria(id: '', nombre: 'Todos'));
    categorias = categoriasData;
  }

  Future<void> getRestaurantes() async {
    restaurantesData = await restauranteService.getRestaurantes();
    restaurantes = restaurantesData;
  }

  Future<void> filtrarCategoria(String categoria) async {
    if (categoria.isEmpty) {
      restaurantes = restaurantesData;
    } else {
      restaurantes =
          restaurantesData.where((element) => element.idCategoria == categoria);
    }
  }
}
