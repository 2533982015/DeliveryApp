import 'package:delivery_app/controllers/order.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:delivery_app/constants/app.constants.dart';
import 'package:delivery_app/models/restaurante.model.dart';

class ProductDetailScreen extends GetView<OrderController> {
  const ProductDetailScreen({
    Key? key,
    required this.producto,
  }) : super(key: key);

  final Product producto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.primaryColor,
        title: const Text('Detalle de producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.insetSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _productImage(),
            _description(),
            _cart(),
            _cartButton(),
          ],
        ),
      ),
    );
  }

  Widget _productImage() => ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(producto.imagen),
      );

  Widget _description() => Wrap(
        direction: Axis.vertical,
        runSpacing: AppConstants.insetSize,
        children: [
          Text(producto.nombre,
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          Text(producto.precio.toString(),
              style:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 18)),
          Text(producto.descripcion,
              style: const TextStyle(color: AppConstants.textColorPrimary))
        ],
      );

  Widget _cart() => Padding(
        padding: const EdgeInsets.symmetric(vertical: AppConstants.insetSize),
        child: Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          children: [
            const Text(
              'Cantidad',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 40.w,
              child: SpinBox(
                readOnly: true,
                min: 1,
                max: 100,
                value: 1,
                onChanged: (value) => controller.cantidad = value.toInt(),
              ),
            ),
          ],
        ),
      );

  Widget _cartButton() => Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 100.w,
            child: ElevatedButton.icon(
                onPressed: () =>
                    controller.addItem(producto.id, controller.cantidad, producto.nombre, producto.imagen, producto.precio),
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Añadir')),
          ),
        ),
      );
}
