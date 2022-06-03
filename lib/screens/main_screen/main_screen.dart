import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_36/commands/theme_helper.dart';
import 'package:flutter_application_36/models/weather_model.dart';
import 'package:flutter_application_36/screens/main_screen/bloc/weather_bloc.dart';
import 'package:flutter_application_36/screens/second_screen/second_screen.dart';
import 'package:flutter_application_36/widgets/search_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late var mycontroller = TextEditingController();
  late WeatherBloc weatherBloc;
  late String city;

  @override
  void initState() {
    weatherBloc = WeatherBloc();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      backgroundColor: ThemeHelper.black,
      body: BlocConsumer<WeatherBloc, WeatherState>(
          bloc: weatherBloc,
          listener: (context, state) {
            if (state is WeatherFetchedState) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen(
                    weatherModel: state.weatherModel,
                  ),
                ),
              );
               mycontroller.clear();
            }
            if (state is WeatherErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.error.message.toString(),
                  ),
                ),
              );
            }
            ;
          },
          builder: (context, state) {
            return Center(
              
              child: SearchWidget(mycontroller: mycontroller, weatherBloc: weatherBloc),
            );
          }),
    );
  }
}
