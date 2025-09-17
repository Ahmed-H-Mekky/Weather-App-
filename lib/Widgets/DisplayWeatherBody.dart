import 'package:flutter/material.dart';
import 'package:weatherbloc/cubits/stateWeather/stateWeather.dart';

class DisplayWeatherBody extends StatelessWidget {
  const DisplayWeatherBody({super.key, required this.state});
  final SuccessState state;

  @override
  Widget build(BuildContext context) {
    // معالجة رابط الصورة لتجنبه لو كان غير مكتمل
    String imageUrl = "";
    if (state.weather.image.startsWith("http")) {
      imageUrl = state.weather.image;
    } else {
      imageUrl = "http:${state.weather.image}";
    }

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            state.weather.cityName,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),

          Text(
            'updated at ${state.weather.dateTime.hour}:${state.weather.dateTime.minute.toString().padLeft(2, '0')}', //padLeft(2, '0') بيضيف ارقام من نوع صفر او حسب ما تحدد حتي يجعل النص متناسق
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 50),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                imageUrl,
                width: 80,
                height: 80,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, size: 80, color: Colors.red);
                },
              ),

              Text(
                "${state.weather.tempe.round()}°C",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),

              Column(
                children: [
                  Text(
                    'MaxTemp: ${state.weather.maxTempe.round()}°C',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'MinTemp: ${state.weather.minTemp.round()}°C',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),

          Text(
            state.weather.conditions,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
