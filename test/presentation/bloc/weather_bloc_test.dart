import 'package:flutter_basics/presentation/bloc/weather_block.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_helpers.mocks.dart';

void main (){
    late MockGetWeatherUseCase getWeatherUseCase;
    late WeatherBloc weatherBloc;

    setUp((){
      getWeatherUseCase = MockGetWeatherUseCase();
    });


    group('This is for bloc testing', (){

    });
}