import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp/models/countrymodel/CountryModel.dart';
import 'package:weatherapp/repositories/home_repository/home_repository.dart';
import 'package:weatherapp/resources/assets/image_assets.dart';
import 'package:weatherapp/view_models/controllers/services/permission_services.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeViewController extends GetxController {
  //basic things for controller
  //1.data observable(value displayed in app)
  //2.loading state and error handling
  //3.api hit method(hit,update and parse data)

  final _api = HomeRepository();

  final countrydata = CountryModel().obs;
final locationPermission=false.obs;
final isLoading =false.obs;



@override
  void onInit(){
    super.onInit();



}

  void setCountryData(CountryModel _value)=>countrydata.value=_value;

  // double getTemp() => countrydata.value.main!.temp!;
  // String getCountry() => countrydata.value.name!;
  void fetchCountryWeather(double lat,double long) {
    _api.getCountryApi(lat,long).then((value) {
         // countrydata.value = value;
          setCountryData(value);
        })
        .onError((error, stackTrace) {
          print(error);
        });

  }

  String getWeatherAccToDescription(){

    String desc=countrydata.value.weather![0].description!.toString();
    if(desc.contains('clouds')) return MyImageAssets.cloud;

    if(desc.contains('rain'))return MyImageAssets.heavyRain;


    return '';
    
  }

  void checkPermission()async{
    locationPermission.value= await PermissionServices().askLocationPermission();
    if(!locationPermission.value){

      Get.snackbar('Permission Required', 'to get weather of your location');
      return;

    }

    try {
      isLoading.value = true;

      Position position=await Geolocator.getCurrentPosition(
       locationSettings: LocationSettings(accuracy: LocationAccuracy.best)

      );

      double lat=position.latitude;
      double long=position.longitude;
      print(lat);
      print(long);

      fetchCountryWeather(lat, long);


    }catch(e){
      print(e);
    }
    finally{
      isLoading.value=false;
    }

  }


}
