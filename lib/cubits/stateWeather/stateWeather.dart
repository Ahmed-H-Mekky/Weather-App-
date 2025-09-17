import 'package:weatherbloc/model/modelWeather.dart';

abstract class WeatherState {}

class InitailState extends WeatherState {}

class LoadingState extends WeatherState {}

class SuccessState extends WeatherState {
  SuccessState({required this.weather});
  final ModelWeather weather; //علشان اوصل للمتغير باسم الاستاد
}

class FailureState extends WeatherState {
  FailureState({required this.message});
  final String message;
}
