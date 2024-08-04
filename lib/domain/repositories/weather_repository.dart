import 'package:dartz/dartz.dart';
import 'package:flutter_basics/core/errors/failures/failure.dart';
import 'package:flutter_basics/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getWeather();
}