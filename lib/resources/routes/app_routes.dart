
import 'package:get/get.dart';
import 'package:weatherapp/resources/routes/routes_name.dart';
import 'package:weatherapp/view/home/home_screen.dart';
import 'package:weatherapp/view/splash/splash_screen.dart';
class AppRoutes{

  static appRoutes(){
    return [GetPage(name: RouteName.splashScreen, page: ()=>SplashScreen()),

     GetPage(name: RouteName.homePage, page: ()=>HomeScreen()),
    ];
  }
}