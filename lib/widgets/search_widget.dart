
import 'package:flutter/material.dart';
import 'package:flutter_application_36/commands/theme_helper.dart';
import 'package:flutter_application_36/screens/main_screen/bloc/weather_bloc.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.mycontroller,
    required this.weatherBloc,
  }) : super(key: key);

  final TextEditingController mycontroller;
  final WeatherBloc weatherBloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Введите город",
          style: TextHelper.bold40.copyWith(color: ThemeHelper.white),
        ),
        SizedBox(
          height: 30,
        ),
        TextFormField(
          controller: mycontroller,
          decoration: InputDecoration(
              fillColor: Colors.amber,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ThemeHelper.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ThemeHelper.white)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: ThemeHelper.white))),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: ThemeHelper.white),
          onPressed: () {
            if (mycontroller.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("enter city end try again"),
                ),
              );
            } else {
              weatherBloc
                  .add(GetWeatherEvent(city: mycontroller.text));
            }

            print(mycontroller.text);
          },
          child: Text(
            "Search city",
            style: TextHelper.medium14
                .copyWith(color: ThemeHelper.black),
          ),
        ),
      ],
    );
  }
}
