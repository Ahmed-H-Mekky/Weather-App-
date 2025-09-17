import 'package:dio/dio.dart';
import 'package:weatherbloc/model/modelWeather.dart';

class GetWeather {
  static Dio dio = Dio();
  static final String apiKey = 'fbf134f5a3e34cf48f7135448251609';
  static final String pathUrl = 'http://api.weatherapi.com/v1';

  static Future<ModelWeather> weather({required String cityname}) async {
    try {
      Response response = await dio.get(
        '$pathUrl/forecast.json?key=$apiKey&q=$cityname&days=1&aqi=no&alerts=no',
      );
      ModelWeather modelWeather = ModelWeather.fromJson(response.data);
      return modelWeather;
    } catch (e) {
      throw Exception('Oops! Failed, try again. Error: $e');
    }
  }
}
