import 'package:weatherapp/data/network/network_api.dart';
import 'package:weatherapp/models/countrymodel/CountryModel.dart';
import 'package:weatherapp/resources/api_url/api_url.dart';

class HomeRepository{


final _apiService = NetworkApi();


  Future<CountryModel> getCountryApi(double lat ,double long)async{


   // var response = await _apiService.getApi('https://api.openweathermap.org/data/2.5/weather?q=pokhara&appid=0ee8eb527aabd53b3b365bd6c58da1c0&units=metric');
    var response =await _apiService.getApi(ApiUrl.getWeatherByCooridnates(lat, long));
        return CountryModel.fromJson(response);
  }

}