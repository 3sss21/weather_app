import 'package:dio/dio.dart';
import 'package:flutter_application_36/helpers/api_requester.dart';
import 'package:flutter_application_36/helpers/cath_exceptions.dart';
import 'package:flutter_application_36/models/weather_model.dart';

class WeatherProvider {
  Future<WeatherModel> getWeather(
    String city,
  ) async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet('', param: {
        'q': city,
        'appid': "4026bc3d5c416700c0cd10f77b04acf7",
      });
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
