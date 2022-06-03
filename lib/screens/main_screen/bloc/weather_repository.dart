import 'package:flutter_application_36/models/weather_model.dart';
import 'package:flutter_application_36/screens/main_screen/bloc/weather_provider.dart';

class WeatherRepository{
  Future<WeatherModel> getWeather(String city,){
    WeatherProvider provider =WeatherProvider();
    return provider.getWeather(city);

  }
}