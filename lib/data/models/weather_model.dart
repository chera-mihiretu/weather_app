import 'dart:convert';

import 'package:flutter_basics/domain/entities/weather.dart';

class WeatherDataModel extends WeatherEntity {
  const WeatherDataModel(
      {required super.cityName,
      required super.description,
      required super.humidity,
      required super.iconCode,
      required super.main,
      required super.pressure,
      required super.temperature});

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) {
    return WeatherDataModel(
      cityName: json['cityName'],
      description: json['description'],
      humidity: json['humidity'],
      iconCode: json['iconCode'],
      main: json['main'],
      pressure: json['pressure'],
      temperature: json['temperature'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "cityName": cityName,
      "description": description,
      "humidity": humidity,
      "iconCode": iconCode,
      "main": main,
      "pressure": pressure,
      "temperature": temperature,
    };
  }

  WeatherEntity toEntity() {
    return WeatherEntity(
      cityName: cityName,
      main: main,
      description: description,
      iconCode: iconCode,
      temperature: temperature,
      pressure: pressure,
      humidity: humidity,
    );
  }
}
