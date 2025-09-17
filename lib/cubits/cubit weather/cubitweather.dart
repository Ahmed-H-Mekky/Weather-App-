import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherbloc/cubits/stateWeather/stateWeather.dart';
import 'package:weatherbloc/model/modelWeather.dart';
import 'package:weatherbloc/servers/serversGetWeather.dart';

class Cubitweather extends Cubit<WeatherState> {
  Cubitweather() : super(InitailState());
  ModelWeather?
  modelWeather; //علشان اكسسه في الهوم باج اول ما اكتب اسم المدينة في البحث
  Future<void> getWeather({required String cityname}) async {
    try {
      emit(LoadingState());
      modelWeather = await GetWeather.weather(
        cityname: cityname,
      ); //بستلم اسم المدينة ال المستخدم بحث عنها علشان ابحث عنها في الموقع
      emit(SuccessState(weather: modelWeather!));
    } catch (e) {
      emit(FailureState(message: e.toString()));
    }
  }
}
