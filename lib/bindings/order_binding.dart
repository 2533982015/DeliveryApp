import 'package:delivery_app/controllers/order.controller.dart';
import 'package:delivery_app/services/order.service.dart';
import 'package:get/get.dart';

class OrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderController(orderService: OrderService()));
  }
}
