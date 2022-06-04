import 'package:delivery_app/constants/app.constants.dart';
import 'package:delivery_app/controllers/order.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CheckoutScreen extends GetView<OrderController> {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen de pedido'),
        backgroundColor: AppConstants.primaryColor,
      ),
      body: Column(
        
        children: [_items(), _total()],
      ),
    );
  }

  Widget _items() => Obx(() => SizedBox(
        height: 60.h,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: controller.orden.items
              .map(
                (item) => ListTile(
                  leading: Image.network(item.imagen),
                  title: Text(item.nombre),
                  subtitle: Text(item.cantidad.toString()),
                  trailing: Text("${item.precio * item.cantidad}"),
                ),
              )
              .toList(),
        ),
      ));

  Widget _total() => Obx(
        () => Padding(
          padding: const EdgeInsets.all(AppConstants.insetSize),
          child: Wrap(
            children: [
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: AppConstants.insetSize * 1.5),
                child: Table(
                  children: [
                    TableRow(children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [Text('Total a pagar')]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [Text(controller.monto.toString())]),
                    ]),
                  ],
                ),
              ),
              const Divider(),
              SizedBox(
                width: 100.w,
                child: ElevatedButton.icon(
                    onPressed: () =>
                        controller.confirmOrder(controller.orden.id),
                    icon: const Icon(Icons.check),
                    label: const Text('Aceptar')),
              ),
            ],
          ),
        ),
      );
}
