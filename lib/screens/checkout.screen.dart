import 'dart:ui';

import 'package:delivery_app/constants/app.constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CheckoutScreen extends StatelessWidget {
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

  Widget _items() => SizedBox(
        height: 60.h,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            ListTile(
              leading: Image.network(
                  'https://s7d1.scene7.com/is/image/mcdonalds/t-mcdonalds-Hamburger:1-3-product-tile-desktop?wid=829&hei=515&dpr=off'),
              title: const Text('Nombre de producto'),
              subtitle: const Text('2'),
              trailing: const Text('15.00'),
            ),
            ListTile(
              leading: Image.network(
                  'https://s7d1.scene7.com/is/image/mcdonalds/t-mcdonalds-Hamburger:1-3-product-tile-desktop?wid=829&hei=515&dpr=off'),
              title: const Text('Nombre de producto'),
              subtitle: const Text('2'),
              trailing: const Text('15.00'),
            ),
            ListTile(
              leading: Image.network(
                  'https://s7d1.scene7.com/is/image/mcdonalds/t-mcdonalds-Hamburger:1-3-product-tile-desktop?wid=829&hei=515&dpr=off'),
              title: const Text('Nombre de producto'),
              subtitle: const Text('2'),
              trailing: const Text('15.00'),
            ),
            ListTile(
              leading: Image.network(
                  'https://s7d1.scene7.com/is/image/mcdonalds/t-mcdonalds-Hamburger:1-3-product-tile-desktop?wid=829&hei=515&dpr=off'),
              title: const Text('Nombre de producto'),
              subtitle: const Text('2'),
              trailing: const Text('15.00'),
            ),
            ListTile(
              leading: Image.network(
                  'https://s7d1.scene7.com/is/image/mcdonalds/t-mcdonalds-Hamburger:1-3-product-tile-desktop?wid=829&hei=515&dpr=off'),
              title: const Text('Nombre de producto'),
              subtitle: const Text('2'),
              trailing: const Text('15.00'),
            ),
            ListTile(
              leading: Image.network(
                  'https://s7d1.scene7.com/is/image/mcdonalds/t-mcdonalds-Hamburger:1-3-product-tile-desktop?wid=829&hei=515&dpr=off'),
              title: const Text('Nombre de producto'),
              subtitle: const Text('2'),
              trailing: const Text('15.00'),
            ),
          ],
        ),
      );

  Widget _total() => Padding(
        padding: const EdgeInsets.all(AppConstants.insetSize),
        child: Wrap(
          children: [
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppConstants.insetSize * 1.5),
              child: Table(
                children: [
                  TableRow(children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text('Total a pagar')]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [Text('55.00')]),
                  ]),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              width: 100.w,
              child: ElevatedButton.icon(
                  onPressed: () => {},
                  icon: const Icon(Icons.check),
                  label: const Text('Aceptar')),
            ),
          ],
        ),
      );
}
