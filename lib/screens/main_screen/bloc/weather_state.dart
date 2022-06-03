part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState{

}

class WeatherErrorState extends WeatherState{
  final CatchException error;

  WeatherErrorState({required this.error});

}
class WeatherFetchedState extends WeatherState{
  final WeatherModel weatherModel;

  WeatherFetchedState({required this.weatherModel});

}