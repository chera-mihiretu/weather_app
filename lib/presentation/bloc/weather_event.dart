import 'package:equatable/equatable.dart';

abstract  class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetWeatherEvent extends WeatherEvent{

}