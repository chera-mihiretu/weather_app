import 'package:equatable/equatable.dart';
import 'package:flutter_basics/domain/entities/weather.dart';

abstract class WeatherState extends Equatable{
  const WeatherState();
  @override
  List<Object?> get props => [];
}

class WeatherEmpty extends WeatherState {}
class WeatherLoading extends WeatherState{}
class WeatherLoaded extends WeatherState {
  final WeatherEntity weatherEntity;
  const WeatherLoaded(this.weatherEntity);

  @override
  List<Object?> get props => [weatherEntity];
}
class WeatherLoadingFailed extends WeatherState{
  final String message;
  const WeatherLoadingFailed(this.message);

  @override
  List<Object?> get props => [message];
}