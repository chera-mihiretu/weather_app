import 'package:flutter_basics/presentation/bloc/weather_event.dart';
import 'package:flutter_basics/presentation/bloc/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(super.initialState);

}