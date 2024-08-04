import 'dart:convert';
import 'package:flutter_basics/data/models/weather_model.dart';
import 'package:flutter_basics/domain/entities/weather.dart';
import 'package:flutter_test/flutter_test.dart';
import '';
import '../../helpers/read_json.dart';
void main(){

  const WeatherDataModel weatherDataModel = WeatherDataModel(
    cityName:	"London",
    main:	"Rain",
    description:	"few clouds",
    iconCode:	"02d",
    temperature:	35.63,
    pressure:	995,
    humidity:	96,
  );

  test('The data model must be subclass of WeatherEntity', (){
    /// expect
    expect(weatherDataModel, isA<WeatherEntity>());
  });


  test('Should return valid model from a json file', (){
    /// arrange
    Map<String, dynamic> jsonMap = json.decode(
      readJson("helpers/testing_datas/json_test_data.json")
    );
    /// act
    final result = WeatherDataModel.fromJson(jsonMap);

    /// expect

    expect(result, equals(weatherDataModel));
  });


  test('should return model into valid json file', (){
    /// arrange
    final test_json = {
      "cityName":	"London",
      "main":	"Rain",
      "description":	"few clouds",
      "iconCode":	"02d",
      "temperature":	35.63,
      "pressure":	995,
      "humidity":	96,
    };
    /// act
    final result = weatherDataModel.toJson();

    /// expect

    expect(result, equals(test_json));
  });


}