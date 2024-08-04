import 'dart:convert';

import 'package:flutter_basics/core/constants/constants.dart';
import 'package:flutter_basics/core/errors/exceptions/server_exception.dart';
import 'package:flutter_basics/data/models/weather_model.dart';
import 'package:http/http.dart' as http;
abstract class RemoteWeatherDataSource {
  final http.Client client;

  RemoteWeatherDataSource({required this.client});
  Future<WeatherDataModel> getWeather();
}

class RemoteWeatherDataSourceImpl extends RemoteWeatherDataSource{
  RemoteWeatherDataSourceImpl(http.Client client) : super(client: client);
  @override
  Future<WeatherDataModel> getWeather() async  {
    final result = await client.get(Uri.parse(HttpInfo.weatherUtl));
    if (result.statusCode == 200) {
      return WeatherDataModel.fromJson(json.decode(result.body));
    }else{
      throw ServerException();
    }
  }
}