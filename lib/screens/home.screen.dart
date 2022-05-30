import 'package:delivery_app/constants/app.constants.dart';
import 'package:delivery_app/screens/product_list.scren.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppConstants.primaryColor,
          actions: [
            GestureDetector(
              onTap: () {
                //here call profile page
              },
              child: const Padding(
                  padding: EdgeInsets.all(AppConstants.insetSize),
                  child: Icon(Icons.person)),
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

  Widget _categories() => SizedBox(
      height: 20.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
            10,
            (index) => const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstants.insetSize,
                ),
                child: Text('Categorie name',
                    style: TextStyle(color: AppConstants.textColorPrimary)))),
      ));

  Widget _restaurants(BuildContext context) => Expanded(
        child: GridView.count(
          padding:
              const EdgeInsets.symmetric(horizontal: AppConstants.insetSize),
          mainAxisSpacing: AppConstants.insetSize,
          crossAxisSpacing: AppConstants.insetSize,
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          children: List.generate(10, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const ProductListScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://scontent.fsal1-1.fna.fbcdn.net/v/t39.30808-6/284007749_4878752012235506_8303324042213146289_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=5NhzR2crDcsAX-IPAJU&_nc_ht=scontent.fsal1-1.fna&oh=00_AT-FxZCWzFRdLw1bgzpIxMH0uPfTTGetyvSTdn_BEqKv2A&oe=629A2C9E"),
                      fit: BoxFit.cover),
                ),
              ),
            );
          }),
        ),
      );
}
