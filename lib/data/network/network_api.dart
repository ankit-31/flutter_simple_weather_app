import 'dart:convert';
import 'dart:io';

import 'package:weatherapp/data/network/base_api_service.dart';

import 'package:http/http.dart' as http;

class NetworkApi implements BaseApiService {
  @override
  Future getApi(String url) async {
    dynamic jsonResposne;
    try {
      dynamic data = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: 10));

      jsonResposne = returnResponse(data);
      return jsonResposne;
    } on SocketException {
      print('exception');
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic data = jsonDecode(response.body);
        return data;

      default:
        throw Exception('Exception');
    }
  }
}
