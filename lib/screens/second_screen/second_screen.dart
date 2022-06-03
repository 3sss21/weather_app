import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_36/commands/theme_helper.dart';
import 'package:flutter_application_36/models/weather_model.dart';
import 'package:flutter_application_36/screens/main_screen/bloc/weather_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
class SecondScreen extends StatefulWidget {
  WeatherModel weatherModel;

  SecondScreen({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  void initState() {
    GetWeatherEvent(city: "Moscow");
    super.initState();
  }

  getDateFormat(int date) {
    var millis = date;
    var dt =
        DateTime.fromMillisecondsSinceEpoch(widget.weatherModel.dt! * 1000);
    return DateFormat('dd.MM.yyyy HH:mm').format(dt);
  }

  getWeekFormat(int date) {
    var millis = date;
    var dt =
        DateTime.fromMillisecondsSinceEpoch(widget.weatherModel.dt! * 1000);
    return DateFormat('EEEE').format(dt);
  }

  getTimeFormat(int date) {
    var millis = date;
    var dt =
        DateTime.fromMillisecondsSinceEpoch(widget.weatherModel.dt! * 1000);
    return DateFormat(' HH:mm').format(dt);
  }
  

  getTempFormat(int temp) {
    int temp = (widget.weatherModel.main!.temp! - 273.15).toInt();
    return temp.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => WeatherBloc(),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.blue[600],
            child: Column(children: [
              SizedBox(
                height: 50,
              ),
              Text(
                getWeekFormat(widget.weatherModel.dt!),
                style: TextHelper.medium14,
              ),
              Text(
                getTimeFormat(widget.weatherModel.dt!),
                style: TextHelper.medium14,
              ),
              Text(
                widget.weatherModel.name.toString(),
                style: TextHelper.medium14,
              ),
              SizedBox(
                height: 20,
              ),

              Image.network(
                  "https://openweathermap.org/img/wn/${widget.weatherModel.weather!.first.icon}@4x.png"),

              SizedBox(
                height: 50,
              ),
              Text(
                getTempFormat(widget.weatherModel.main!.temp!.toInt())
                    .toString(),
                style: TextHelper.medium14,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                getWeekFormat(widget.weatherModel.dt!),
                style: TextHelper.medium14,
              ),
              SizedBox(height: 50,),
              ElevatedButton(
              
                  onPressed: () {
                    Navigator.pop(context);

                  },
                  child: Text('back to search')),
            ]),
          ),
        ),
      ),
    );
  }
}
