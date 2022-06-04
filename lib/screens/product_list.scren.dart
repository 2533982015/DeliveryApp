import 'package:delivery_app/constants/app.constants.dart';
import 'package:delivery_app/models/restaurante.model.dart';
import 'package:delivery_app/screens/product.detail.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  final Restaurante restaurante;

  const ProductListScreen({Key? key, required this.restaurante})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.primaryColor,
        title: Text(restaurante.nombre),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title('Productos de restaurante'),
          _products(context),
        ],
      ),
    );
  }

  Widget title(String text) => Padding(
      padding: const EdgeInsets.all(AppConstants.insetSize),
      child: Text(text,
          style: const TextStyle(
              color: AppConstants.primaryColor, fontWeight: FontWeight.w700)));

  Widget _products(BuildContext context) => Expanded(
        child: GridView.count(
            padding:
                const EdgeInsets.symmetric(horizontal: AppConstants.insetSize),
            mainAxisSpacing: AppConstants.insetSize,
            crossAxisSpacing: AppConstants.insetSize,
            scrollDirection: Axis.vertical,
            crossAxisCount: 2,
            children: restaurante.products
                .map((pro) => GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ProductDetailScreen(producto: pro))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        color: AppConstants.whiteColor,
                        child: Column(
                          children: [
                            Image.network(pro.imagen),
                            const SizedBox(height: AppConstants.insetSize),
                            Text(pro.nombre,
                                style: const TextStyle(
                                    color: AppConstants.textColorPrimary)),
                            Text(
                              pro.precio.toString(),
                              style: const TextStyle(
                                  color: AppConstants.textColorPrimary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )))
                .toList()),
      );
}
