

import 'package:flutter_basics/data/data_sources/remote_weather_data_source.dart';
import 'package:flutter_basics/data/repositories/weather_repository_impl.dart';
import 'package:flutter_basics/domain/repositories/weather_repository.dart';
import 'package:flutter_basics/domain/usecases/get_weather.dart';
import 'package:flutter_basics/presentation/bloc/weather_block.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void setUpObjects(){


  locator.registerLazySingleton(()=> http.Client());
  //
  locator.registerLazySingleton(()=> RemoteWeatherDataSourceImpl(locator()));
  //
  locator.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(locator()));
  //
  locator.registerLazySingleton(() => GetWeatherUseCase(locator()));
  //

  locator.registerFactory(()=> WeatherBloc(locator()));

}