class ModelWeather {
  final String cityName;
  final DateTime dateTime;
  final double tempe;
  final double maxTempe;
  final double minTemp;
  final String image;
  final String conditions;

  const ModelWeather({
    required this.cityName,
    required this.dateTime,
    required this.tempe,
    required this.maxTempe,
    required this.minTemp,
    required this.image,
    required this.conditions,
  });

  factory ModelWeather.fromJson(Map<String, dynamic> json) {
    if (json['error'] != null) {
      throw Exception(
        json['error']['message'],
      ); // ✅ لو فيه خطأ من API يرجع سبب واضح
    }
    return ModelWeather(
      cityName: json['location']['name'],
      dateTime: DateTime.parse(json['current']['last_updated']),
      tempe: (json['forecast']['forecastday'][0]['day']['avgtemp_c']),
      maxTempe: (json['forecast']['forecastday'][0]['day']['maxtemp_c']),
      minTemp: (json['forecast']['forecastday'][0]['day']['mintemp_c']),
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      conditions:
          json['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}
