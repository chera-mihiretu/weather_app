import 'dart:developer';
import 'dart:io';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_basics/core/errors/exceptions/server_exception.dart';
import 'package:flutter_basics/core/errors/failures/failure.dart';
import 'package:flutter_basics/data/models/weather_model.dart';
import 'package:flutter_basics/data/repositories/weather_repository_impl.dart';
import 'package:flutter_basics/domain/entities/weather.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helpers.mocks.dart';

void main() {
  late MockRemoteWeatherDataSourceImpl mockRemoteWeatherDataSourceImpl;
  late WeatherRepositoryImpl weatherRepositoryImpl;

  setUp(() {
    mockRemoteWeatherDataSourceImpl = MockRemoteWeatherDataSourceImpl();
    weatherRepositoryImpl =
        WeatherRepositoryImpl(mockRemoteWeatherDataSourceImpl);
  });

  const weatherModel = WeatherDataModel(
    cityName:	"London",
    main:	"Rain",
    description:	"few clouds",
    iconCode:	"02d",
    temperature:	35.63,
    pressure:	995,
    humidity:	96,
  );

  const weatherEntity = WeatherEntity(
    cityName:	"London",
    main:	"Rain",
    description:	"few clouds",
    iconCode:	"02d",
    temperature:	35.63,
    pressure:	995,
    humidity:	96,
  );

  group('Implementation of repository in data is success', () {
    test('Success when data is recieved', () async {
      /// arrange
      when(
          mockRemoteWeatherDataSourceImpl.getWeather()
      ).thenAnswer((_) async => weatherModel);

      /// action

      final result = await weatherRepositoryImpl.getWeather();

      /// assert
      ///
      expect(result, const Right(weatherEntity));


    });

    test('When error happens it should return Failure', () async{
      /// arrange
      when(
          mockRemoteWeatherDataSourceImpl.getWeather()
      ).thenThrow(ServerException());
      /// action

      final result = await weatherRepositoryImpl.getWeather();
      /// asser
      ///
      expect(result, const Left(ServerFailure("Server Failed")));

    });

    test('When error happens it should return Failure', () async{
      /// arrange
      when(
          mockRemoteWeatherDataSourceImpl.getWeather()
      ).thenThrow(const SocketException("Connection Failed"));
      /// action

      final result = await weatherRepositoryImpl.getWeather();
      /// asser
      ///
      expect(result, const Left(ConnectionFailure("Connection Failed")));

    });
  });
}
