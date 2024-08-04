import 'package:flutter_basics/domain/usecases/get_weather.dart';
import 'package:flutter_basics/presentation/bloc/weather_event.dart';
import 'package:flutter_basics/presentation/bloc/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  WeatherBloc(this.getWeatherUseCase) : super(WeatherEmpty()) {
    on<GetWeatherEvent>((event, emit) async {
      emit(WeatherLoading());
      final result = await getWeatherUseCase.execute();
      result.fold((failure){
        emit(WeatherLoadingFailed(failure.message));
      }, (data){
        emit(WeatherLoaded(data));
      });
    });
  }
}