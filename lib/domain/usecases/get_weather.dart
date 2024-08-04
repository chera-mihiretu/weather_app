import 'package:dartz/dartz.dart';
import 'package:flutter_basics/core/errors/failures/failure.dart';
import 'package:flutter_basics/domain/entities/weather.dart';
import 'package:flutter_basics/domain/repositories/weather_repository.dart';

class GetWeatherUseCase {
  final WeatherRepository weatherRepository;
  GetWeatherUseCase(this.weatherRepository);

  Future<Either<Failure, WeatherEntity>> execute() {
    return weatherRepository.getWeather();
  }
}