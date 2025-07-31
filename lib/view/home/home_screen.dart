import 'package:flutter/material.dart';
import 'package:weatherapp/models/countrymodel/CountryModel.dart';
import 'package:weatherapp/resources/assets/image_assets.dart';
import 'package:weatherapp/resources/styles/my_text_style.dart';
import 'package:weatherapp/view_models/controllers/home/home_view_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewController controller = Get.put(HomeViewController());

  @override
  void initState(){
    super.initState();

   // controller.fetchCountryWeather();

    controller.checkPermission();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
        child: Center(
          child: Obx(() {
            if(controller.isLoading.value) return CircularProgressIndicator();
            if(!controller.locationPermission.value) return Text('Permission Denied');

            final data = controller.countrydata.value;
            if (data.main == null || data.name == null) {
              return CircularProgressIndicator();
            }

            return Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.countrydata.value.name!,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[900],
                        ),
                      ),
                      Text(
                      '28 JUly',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Obx(()=>

                     Center(
                      child: Image.asset(controller.getWeatherAccToDescription(), height: 100),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Center(
                    child: Column(
                      children: [
                        Text(
                          '${controller.countrydata.value.main!.temp!.toString()} °C',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                        Text(
                          controller
                              .countrydata
                              .value
                              .weather![0]
                              .description!
                              .capitalize!,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      myfirstCardView(
                        'Temperature',
                        controller.countrydata.value.main!.tempMin!.toString(),
                      ),
                      myfirstCardView(
                        'Cloud Cover',
                        controller.countrydata.value.clouds!.all!.toString(),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      mySecondCardView(
                        'Humidity',
                        controller.countrydata.value.main!.humidity!.toString(),
                      ),
                      mySecondCardView(
                        'Pressure',
                        controller.countrydata.value.main!.pressure!.toString(),
                      ),
                      mySecondCardView(
                        'Visibility',
                        controller.countrydata.value.visibility!.toString(),
                      ),
                    ],
                  ),
                  SizedBox(height: 39,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     mythirdCardView(MyImageAssets.sunRise, 'SunRise', controller.countrydata.value.sys!.sunrise!),
                      mythirdCardView(MyImageAssets.sunSet, 'Sunset', controller.countrydata.value.sys!.sunset!)

                    ],
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget myfirstCardView(String name, String value) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        width: 150,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey[800],
              ),
            ),
            Text(
              '$value / $value',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal[700],
              ),
            ),


          ],
        ),
      ),
    );
  }

  Widget mySecondCardView(String name, String value) {


    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey[800],
              ),
            ),
            Text(
              '$value',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget mythirdCardView(String imagePath,String name,int time){
    //code to change UNIX time to UTC
    print(time);
    DateTime utcTime= DateTime.fromMillisecondsSinceEpoch(time*1000,isUtc: true);


    //for nepal time Zone
    Duration nepalOffSet=Duration(hours: 5,minutes: 45);
    DateTime nepalTime=utcTime.add(nepalOffSet);

    return Container(


      child: Card(


        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(imagePath,width: 90,),
              Column(
                children: [
                  Text(name,style: TextStyle(fontSize: 20),),
                  Text('${nepalTime.hour.toString().padLeft(2,'0')}:${nepalTime.minute.toString().padLeft(2,'0')}',style: TextStyle(fontSize: 18),),
                ],
              )

            ],
          ),
        ),

      ),
    );
  }




}
