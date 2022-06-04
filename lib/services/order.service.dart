import 'package:delivery_app/app_util.dart';
import 'package:delivery_app/models/order.history.model.dart';
import 'package:delivery_app/models/order.model.dart';

class OrderService {
  Future<bool> addItem(
      {required String producto,
      required int cantidad,
      required String nombre,
      required String imagen,
      required double precio}) async {
    final response = await AppUtils.sendRequest(
        endpoint:
            'https://data.mongodb-api.com/app/delivery_app-ennhb/endpoint/addorder?producto=$producto&cantidad=$cantidad&usuario=jose&nombre=$nombre&imagen=$imagen&precio=$precio');
    return response == "Ok";
  }

  Future<Order> getOrder() async {
    final response = await AppUtils.sendRequest(
        endpoint:
            'https://data.mongodb-api.com/app/delivery_app-ennhb/endpoint/getorderactive?usuario=jose');
    return orderFromJson(response);
  }

  Future<bool> confirmOrder(String orden) async {
    final response = await AppUtils.sendRequest(
        endpoint:
            'https://data.mongodb-api.com/app/delivery_app-ennhb/endpoint/confimorder?orden=$orden');
    return response == "Ok";
  }

  Future<List<OrderHistory>> historial() async {
    final response = await AppUtils.sendRequest(
        endpoint:
            'https://data.mongodb-api.com/app/delivery_app-ennhb/endpoint/ordershistory?usuario=jose');
    return orderHistoryFromJson(response);
  }
}
