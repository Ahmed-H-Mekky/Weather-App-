import 'package:flutter/material.dart';

MaterialColor getThemeColor(String? weather) {
  if (weather == null) return Colors.blue;

  weather = weather.toLowerCase();

  if (weather.contains('sunny') || weather.contains('clear')) {
    return Colors.orange;
  } else if (weather.contains('cloudy') || weather.contains('overcast')) {
    return Colors.indigo;
  } else if (weather.contains('mist') || weather.contains('fog')) {
    return Colors.blueGrey;
  } else if (weather.contains('drizzle') || weather.contains('sleet')) {
    return Colors.lightBlue;
  } else if (weather.contains('rain')) {
    return Colors.blue;
  } else if (weather.contains('snow')) {
    return Colors.cyan;
  } else if (weather.contains('thunder')) {
    return Colors.deepPurple;
  } else {
    return Colors.teal;
  }
}
