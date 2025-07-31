import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weatherapp/resources/assets/image_assets.dart';
import 'package:weatherapp/resources/styles/my_text_style.dart';
import 'package:weatherapp/view_models/controllers/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {
  SplashServices services=SplashServices();
  @override
  void initState() {

    super.initState();


    services.start();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       children: [


         Text('splash_welcome'.tr,style:MyTextStyles.primaryText,),

         SvgPicture.asset(MyImageAssets.splashScreen,)
       ],
      ),
    ),

    );
  }
}
