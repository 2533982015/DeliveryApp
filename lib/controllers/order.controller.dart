import 'package:delivery_app/models/order.model.dart';
import 'package:delivery_app/services/order.service.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  OrderController({required this.orderService});
  final OrderService orderService;

  int cantidad = 1;

  final _orden = Order(id: '', usuario: '', activa: false, items: []).obs;
  Order get orden => _orden.value;
  set orden(Order value) => _orden.value = value;

  final _monto = 0.0.obs;
  double get monto => _monto.value;
  set monto(double value) => _monto.value = value;

  @override
  Future<void> onInit() async {
    super.onInit();
    getOrder();
  }

  void addItem(String producto, int cantidad, String nombre, String imagen,
      double precio) {
    orderService.addItem(
        producto: producto,
        cantidad: cantidad,
        nombre: nombre,
        imagen: imagen,
        precio: precio);
  }

  Future<void> getOrder() async {
    orden = await orderService.getOrder();

    monto = 0.00;
    for (var item in orden.items) {
      monto += item.cantidad * item.precio;
    }
  }
}
