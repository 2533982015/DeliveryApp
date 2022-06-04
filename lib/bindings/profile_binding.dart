import 'package:delivery_app/controllers/order.controller.dart';
import 'package:delivery_app/controllers/profile.controller.dart';
import 'package:delivery_app/services/order.service.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(orderService: OrderService()));
  }
}
