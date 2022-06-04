import 'package:delivery_app/services/order.service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final OrderService orderService;

  ProfileController({required this.orderService});

  final RxList<dynamic> _historial = [].obs;
  RxList<dynamic> get historial => _historial;
  set historial(value) => _historial.assignAll(value);

  @override
  Future<void> onInit() async {
    super.onInit();
    getHistory();
  }

  Future<void> getHistory() async {
    historial = await orderService.historial();
  }
}
