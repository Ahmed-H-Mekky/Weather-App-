import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherbloc/Widgets/materialWidget.dart';
import 'package:weatherbloc/cubits/cubit%20weather/cubitweather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Cubitweather>(
      create: (context) => Cubitweather(),
      //فصلت ال ماتيريل عن ال مان علشان مش يتعارض ال كونتكس ويتعرف عل موقه فيشجرة الويدج
      child: CustomerMaterial(),
    );
  }
}
