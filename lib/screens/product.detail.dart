import 'package:delivery_app/constants/app.constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:sizer/sizer.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

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
        child: Image.network(
            'https://s7d1.scene7.com/is/image/mcdonalds/t-mcdonalds-Hamburger:1-3-product-tile-desktop?wid=829&hei=515&dpr=off'),
      );

  Widget _description() => Wrap(
        direction: Axis.vertical,
        runSpacing: AppConstants.insetSize,
        children: const [
          Text('name of product',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          Text('100.00',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18)),
          Text('description random de producto de esta pantalla bla blabla',
              style: TextStyle(color: AppConstants.textColorPrimary))
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
                onChanged: (value) {},
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
                onPressed: () => {},
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Añadir')),
          ),
        ),
      );
}
