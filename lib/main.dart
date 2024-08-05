import 'package:flutter/material.dart';
import 'package:flutter_basics/dependency_injection.dart';
import 'package:flutter_basics/presentation/bloc/weather_block.dart';
import 'package:flutter_basics/presentation/pages/weather_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  setUpObjects();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> locator<WeatherBloc>())
      ],
      child: const MaterialApp(
        home: WeatherPage(),
      ),
    );
  }
}