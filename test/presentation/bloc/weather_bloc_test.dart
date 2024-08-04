import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_basics/core/errors/failures/failure.dart';
import 'package:flutter_basics/domain/entities/weather.dart';
import 'package:flutter_basics/presentation/bloc/weather_block.dart';
import 'package:flutter_basics/presentation/bloc/weather_event.dart';
import 'package:flutter_basics/presentation/bloc/weather_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helpers.mocks.dart';

void main (){
    late MockGetWeatherUseCase getWeatherUseCase;
    late WeatherBloc weatherBloc;

    setUp((){
      getWeatherUseCase = MockGetWeatherUseCase();
      weatherBloc = WeatherBloc(getWeatherUseCase);
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


    test('Check if the bloc return WeatherLoading when starts', (){

      expect(weatherBloc.state, WeatherEmpty());
    });

    blocTest<WeatherBloc, WeatherState>('WeatherBloc is working properly',
        build: (){
          when(
            getWeatherUseCase.execute()
          ).thenAnswer((_) async => const Right(myWeather));
          return weatherBloc;
        },
      act: (bloc) => bloc.add(GetWeatherEvent()),
      wait: const Duration(milliseconds: 200),
      expect: () => [
        WeatherLoading(),
        const WeatherLoaded(myWeather)
      ]
    );

    blocTest<WeatherBloc, WeatherState>('The block should return error when Error happens',
        build: (){
          when(
            getWeatherUseCase.execute()
          ).thenAnswer((_) async =>  const Left(ServerFailure('Failed')));
          return weatherBloc;
        },
        act: (bloc) => bloc.add(GetWeatherEvent()),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          WeatherLoading(),
          const WeatherLoadingFailed('Failed'),
        ]
    );

}