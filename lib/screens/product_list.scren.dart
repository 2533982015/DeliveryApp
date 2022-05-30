import 'package:delivery_app/constants/app.constants.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.primaryColor,
        title: const Text('Burguer king'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title('productos de restaurante'),
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
          children: List.generate(10, (index) {
            return GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    color: AppConstants.whiteColor,
                    child: Column(
                      children: [
                        Image.network(
                            'https://s7d1.scene7.com/is/image/mcdonalds/t-mcdonalds-Hamburger:1-3-product-tile-desktop?wid=829&hei=515&dpr=off'),
                        const SizedBox(height: AppConstants.insetSize),
                        const Text('nombre de producto',
                            style: TextStyle(
                                color: AppConstants.textColorPrimary)),
                        const Text(
                          '10.00',
                          style: TextStyle(
                              color: AppConstants.textColorPrimary,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ));
          }),
        ),
      );
}
