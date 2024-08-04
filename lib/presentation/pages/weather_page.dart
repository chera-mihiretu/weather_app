import 'package:flutter/material.dart';
import 'package:flutter_basics/presentation/bloc/weather_block.dart';
import 'package:flutter_basics/presentation/bloc/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Weather",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return const CircularProgressIndicator();
                } else if (state is WeatherLoaded) {
                  return const Text("Weather Loaded");
                }else if (state is WeatherLoadingFailed){
                  return Text("Error ${state.message}");
                }
                return const Text("No data");
              }
            ),
          ),
          Center(
            child: FilledButton(
              onPressed: () {},
              child: const Icon(Icons.refresh),
            ),
          ),
        ],
      ),
    );
  }
}
