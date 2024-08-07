import 'package:flutter/material.dart';
import 'package:flutter_basics/presentation/bloc/weather_block.dart';
import 'package:flutter_basics/presentation/bloc/weather_event.dart';
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
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              state.weatherEntity.cityName,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network("http://openweathermap.org/img/wn/${state.weatherEntity.iconCode}@2x.png",),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              state.weatherEntity.main,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              state.weatherEntity.description,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:Border.all(color: Colors.black, width: 1)
                            ),
                            child: const Center(
                              child: Text(
                                "Temprature",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:Border.all(color: Colors.black, width: 1)
                            ),
                            child: Center(
                              child: Text(
                                state.weatherEntity.temperature.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:Border.all(color: Colors.black, width: 1)
                            ),
                            child: const Center(
                              child: Text(
                                "Pressure",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(

                          child: DecoratedBox(

                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(10),
                              border:Border.all(color: Colors.black, width: 1)
                            ),
                            child: Center(
                              child: Text(
                                state.weatherEntity.pressure.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:Border.all(color: Colors.black, width: 1)
                            ),
                            child: const Center(
                              child: Text(
                                "Humidity",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:Border.all(color: Colors.black, width: 1)
                            ),
                            child: Center(
                              child: Text(
                                state.weatherEntity.humidity.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              } else if (state is WeatherLoadingFailed) {
                return Text("Error ${state.message}");
              }
              return const Text("No data");
            }),
          ),
          Center(
            child: FilledButton(
              onPressed: () {
                BlocProvider.of<WeatherBloc>(context).add(GetWeatherEvent());
              },
              child: const Icon(Icons.refresh),
            ),
          ),
        ],
      ),
    );
  }
}
