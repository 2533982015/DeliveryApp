import 'dart:async';

import 'package:delivery_app/constants/app.constants.dart';
import 'package:delivery_app/screens/home.screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen())),
    );

    return Container(
        decoration: const BoxDecoration(gradient: AppConstants.generalGradient),
        child: const Icon(Icons.motorcycle, color: Colors.white, size: 60));
  }
}
