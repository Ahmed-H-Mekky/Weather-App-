import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherbloc/cubits/stateWeather/stateWeather.dart';
import 'package:weatherbloc/model/getThemeColor.dart';
import 'package:weatherbloc/pages/displayTemp.dart';
import '../cubits/cubit weather/cubitweather.dart';

class CustomerMaterial extends StatelessWidget {
  const CustomerMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Cubitweather, WeatherState>(
      builder: (contextWatch, state) {
        // لتغير لون الثيم
        //بيستمع لحالة الاستديد واي تغير يحدث  يعيد بناء التطبيق عليه
        final weather = contextWatch
            .watch<Cubitweather>()
            .modelWeather
            ?.conditions;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Weather',
          theme: ThemeData(
            //في التحديث الاخير اصبح كالر ثيم هو ال بيتحكم في الثيم العام للتطبيق
            colorScheme: ColorScheme.fromSeed(
              seedColor: getThemeColor(weather),
            ),
          ),
          home: const CategoryPag(),
        );
      },
    );
  }
}
