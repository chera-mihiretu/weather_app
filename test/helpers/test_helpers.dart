import 'package:flutter_basics/data/data_sources/remote_weather_data_source.dart';
import 'package:flutter_basics/domain/repositories/weather_repository.dart';
import 'package:flutter_basics/domain/usecases/get_weather.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
@GenerateMocks(
  [
    WeatherRepository,
    RemoteWeatherDataSourceImpl,
    GetWeatherUseCase
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpCllient)]
)

void main(){

}