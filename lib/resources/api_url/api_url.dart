class ApiUrl{

  static const String baseUrl='https://api.openweathermap.org/data/2.5/';


  static const api_Key='0ee8eb527aabd53b3b365bd6c58da1c0';

static String getWeatherByCooridnates(double lat,double long){
  return '${baseUrl}weather?lat=$lat&lon=$long&appid=$api_Key&units=metric';
}


}