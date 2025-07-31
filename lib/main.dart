import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/resources/get_x_localization/language.dart';
import 'package:weatherapp/resources/routes/app_routes.dart';
import 'package:weatherapp/view/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyLanguage(),
      locale: Locale('en','US'),
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:SplashScreen(

      ),
      getPages: AppRoutes.appRoutes()
      ,
    );
  }
}

