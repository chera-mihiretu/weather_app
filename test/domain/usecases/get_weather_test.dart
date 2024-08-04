import 'package:dartz/dartz.dart';
import 'package:flutter_basics/domain/entities/weather.dart';
import 'package:flutter_basics/domain/usecases/get_weather.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helpers.mocks.dart';

void main() {
  late GetWeatherUseCase getWeatherUseCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getWeatherUseCase = GetWeatherUseCase(mockWeatherRepository);
  });


  const myWeather = WeatherEntity(
    cityName:	"New York",
  main:	"Snow",
  description:	"mist",
    iconCode:	"01d",
    temperature:	-2.34,
    pressure:	1001,
    humidity:	27,
  );


  test("The Weather Use Case test is Done", () async {
    when(
        mockWeatherRepository.getWeather()
    ).thenAnswer((_) async =>  const Right(myWeather));

    final result = await getWeatherUseCase.execute();

    expect(result, const Right(myWeather));

  });
}