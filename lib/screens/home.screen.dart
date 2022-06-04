import 'package:delivery_app/constants/app.constants.dart';
import 'package:delivery_app/controllers/home.controller.dart';
import 'package:delivery_app/models/categorias.model.dart';
import 'package:delivery_app/models/restaurante.model.dart';
import 'package:delivery_app/screens/checkout.screen.dart';
import 'package:delivery_app/screens/product_list.scren.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppConstants.primaryColor,
          actions: [
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const CheckoutScreen())),
              child: const Padding(
                  padding: EdgeInsets.all(AppConstants.insetSize),
                  child: Icon(Icons.shopping_cart)),
            )
          ],
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              _banner(),
              _sectionLabel('Categorias'),
              _categories(),
              _sectionLabel('Restaurantes'),
              _restaurants(context),
            ]));
  }

  Widget _sectionLabel(String text) => Padding(
      padding: const EdgeInsets.all(AppConstants.insetSize),
      child: Text(text,
          style: const TextStyle(
              color: AppConstants.primaryColor, fontWeight: FontWeight.w700)));

  Widget _banner() => Container(
        padding: const EdgeInsets.only(
          left: AppConstants.insetSize,
          right: AppConstants.insetSize,
          bottom: AppConstants.insetSize,
        ),
        decoration: const BoxDecoration(gradient: AppConstants.generalGradient),
        width: double.infinity,
        child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.vertical,
            spacing: AppConstants.insetSize / 2,
            children: const [
              Text(
                'Hola!',
                style: TextStyle(fontSize: 16, color: AppConstants.whiteColor),
              ),
              Text(
                '¿Que deseas ordenar?',
                style: TextStyle(
                    fontSize: 24,
                    color: AppConstants.whiteColor,
                    fontWeight: FontWeight.w600),
              ),
            ]),
      );

  Widget _categories() => Obx(() => SizedBox(
      height: 20.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: controller.categorias
            .cast<Categoria>()
            .map((cat) => GestureDetector(
                  onTap: () => controller.filtrarCategoria(cat.id),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.insetSize),
                      child: Text(cat.nombre,
                          style: const TextStyle(
                              color: AppConstants.textColorPrimary))),
                ))
            .toList(),
      )));

  Widget _restaurants(BuildContext context) => Obx(
        () => Expanded(
            child: GridView.count(
          padding:
              const EdgeInsets.symmetric(horizontal: AppConstants.insetSize),
          mainAxisSpacing: AppConstants.insetSize,
          crossAxisSpacing: AppConstants.insetSize,
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          children: controller.restaurantes
              .cast<Restaurante>()
              .map((res) => GestureDetector(
                  onTap: () =>
                      Get.to(() => ProductListScreen(restaurante: res)),
                  child: Container(
                      decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(res.imagen), fit: BoxFit.cover),
                  ))))
              .toList(),
        )),
      );
}
