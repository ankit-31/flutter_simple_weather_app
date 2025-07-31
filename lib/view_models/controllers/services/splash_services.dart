
import 'dart:async';
import 'package:get/get.dart';
import 'package:weatherapp/resources/routes/app_routes.dart';
import 'package:weatherapp/resources/routes/routes_name.dart';



class SplashServices{



  void start(){

    Future.delayed(Duration(seconds: 3),()=>Get.offNamed(RouteName.homePage));
  }


}