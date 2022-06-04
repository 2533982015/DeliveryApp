import 'package:delivery_app/constants/app.constants.dart';
import 'package:delivery_app/controllers/profile.controller.dart';
import 'package:delivery_app/models/order.history.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: AppConstants.primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _sectionLabel('Historial de ordenes'),
          _ordenes(),
        ],
      ),
    );
  }

  Widget _sectionLabel(String text) => Padding(
      padding: const EdgeInsets.all(AppConstants.insetSize),
      child: Text(text,
          style: const TextStyle(
              color: AppConstants.primaryColor, fontWeight: FontWeight.w700)));

  Widget _ordenes() => Obx(
        () => Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: controller.historial
                .cast<OrderHistory>()
                .map(
                  (item) => ListTile(
                    title: Text('Fecha: ${item.fecha.toString()}'),
                    subtitle: Wrap(
                        children: item.items
                            .map((e) => Text(
                                'Producto: ${e.nombre} - Precio: ${e.precio} - Cant: ${e.cantidad}'))
                            .toList()),
                  ),
                )
                .toList(),
          ),
        ),
      );
}
