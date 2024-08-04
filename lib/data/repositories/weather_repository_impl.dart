import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_basics/core/errors/exceptions/server_exception.dart';
import 'package:flutter_basics/core/errors/failures/failure.dart';
import 'package:flutter_basics/data/data_sources/remote_weather_data_source.dart';
import 'package:flutter_basics/domain/entities/weather.dart';
import 'package:flutter_basics/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final RemoteWeatherDataSourceImpl remoteWeatherDataSourceImpl;

  WeatherRepositoryImpl(this.remoteWeatherDataSourceImpl);

  @override
  Future<Either<Failure, WeatherEntity>> getWeather() async {
    try{
      final result = await remoteWeatherDataSourceImpl.getWeather();
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure("Server Failed"));
    } on SocketException {
      return const Left(ConnectionFailure("Connection Failed"));
    }
  }



}