import 'package:flutter/material.dart';
import 'package:flutter_application_36/commands/theme_helper.dart';
import 'package:flutter_application_36/models/weather_model.dart';
import 'package:flutter_application_36/screens/main_screen/main_screen.dart';
import 'package:flutter_application_36/screens/second_screen/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
  //     routes: {

  //   '/': (context) => const MainScreen(),
  //   // When navigating to the "/second" route, build the SecondScreen widget.
  //   '/second': (context) =>  SecondScreen(weatherModel: WeatherModel()),
  // },
    );
  }
}
