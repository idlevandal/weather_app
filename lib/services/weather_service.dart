import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart';
import 'package:weather_app/models/weather_model.dart';

Future<Weather> getWeather() async {
  String cityId = '7839581';
  String key = 'ea043012b4277abbb36687d895f26469';
  Response res = await get('https://api.openweathermap.org/data/2.5/weather?id=$cityId&units=metric&APPID=$key');
  var response = jsonDecode(res.body);
  return Weather.fromJson(response);
}