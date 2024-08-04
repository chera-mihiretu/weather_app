import 'dart:io';

import 'package:flutter_basics/core/constants/constants.dart';
import 'package:flutter_basics/core/errors/exceptions/server_exception.dart';
import 'package:flutter_basics/data/data_sources/remote_weather_data_source.dart';
import 'package:flutter_basics/data/models/weather_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import '../../helpers/read_json.dart';
import '../../helpers/test_helpers.mocks.dart';

void main() {
  late MockHttpCllient mockHttpCllient;
  late RemoteWeatherDataSourceImpl remoteWeatherDataSourceImpl;

  setUp(() {
    mockHttpCllient = MockHttpCllient();
    remoteWeatherDataSourceImpl = RemoteWeatherDataSourceImpl(mockHttpCllient);
  });

  group('Server request is success', () {

    test('Recieved request Successfully ', () async {
      /// arrange
      when(mockHttpCllient.get(Uri.parse(HttpInfo.weatherUtl)))
          .thenAnswer((_) async {
        return http.Response(
          readJson("helpers/testing_datas/json_test_data.json"),
          200,
        );
      });

      /// act

      final result = await  remoteWeatherDataSourceImpl.getWeather();

      /// expect
      ///
      expect(result, isA<WeatherDataModel>());

    });


    test('Must throw exeption ', () async {
      /// arrange
      when(mockHttpCllient.get(Uri.parse(HttpInfo.weatherUtl)))
          .thenAnswer((_) async {
        return http.Response(
          "Not found",
          404,
        );
      });

      /// act

      /// expect

      expect(() async => await remoteWeatherDataSourceImpl.getWeather() , throwsA(isA<ServerException>()));

    });
  });
}
