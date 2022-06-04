import 'package:delivery_app/controllers/home.controller.dart';
import 'package:delivery_app/services/restaurante.service.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(restauranteService: RestauranteService()));
  }
}
