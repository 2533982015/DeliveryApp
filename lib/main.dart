import 'package:delivery_app/bindings/home_binding.dart';
import 'package:delivery_app/login/Screens/Login_Screen.dart';
import 'package:delivery_app/screens/splash.screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => GetMaterialApp(
            initialBinding: HomeBinding(),
            initialRoute: '/',
            debugShowCheckedModeBanner: false,
            title: 'Delivery App',
            theme: ThemeData(primarySwatch: Colors.blue),
            home: LoginScreen()));
  }
}
