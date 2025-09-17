import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherbloc/Widgets/DefauiltBody.dart';
import 'package:weatherbloc/Widgets/DisplayWeatherBody.dart';
import 'package:weatherbloc/cubits/cubit%20weather/cubitweather.dart';
import 'package:weatherbloc/cubits/stateWeather/stateWeather.dart';
import 'package:weatherbloc/model/getThemeColor.dart';
import 'package:weatherbloc/pages/homepage.dart';

class CategoryPag extends StatelessWidget {
  const CategoryPag({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
        // نتحكم في الون AppBar حسب الحالة
        flexibleSpace: BlocBuilder<Cubitweather, WeatherState>(
          builder: (context, state) {
            if (state is SuccessState) {
              final modelWeather = state.weather;
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      getThemeColor(modelWeather.conditions),
                      getThemeColor(modelWeather.conditions)[100]!,
                      getThemeColor(modelWeather.conditions)[300]!,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              );
            }
            // حالة مبدئية بدون بيانات
            return Container(color: Colors.blue);
          },
        ),
      ),

      body: BlocBuilder<Cubitweather, WeatherState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SuccessState) {
            final modelWeather = state.weather;
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    getThemeColor(modelWeather.conditions),
                    getThemeColor(modelWeather.conditions)[300]!,
                    getThemeColor(modelWeather.conditions)[100]!,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 170),
                child: DisplayWeatherBody(state: state),
              ),
            );
          } else if (state is FailureState) {
            return Center(child: Text(state.message));
          } else {
            return const DefaultBody();
          }
        },
      ),
    );
  }
}
