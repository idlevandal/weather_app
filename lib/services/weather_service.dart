import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart';
import 'package:weather_app/models/weather_model.dart';

Future<Weather> getWeather() async {
  String cityId = '7839581'; // gold coast
//  String cityId = '5549222'; // washington
  String key = 'my secret key';
  Response res = await get('https://api.openweathermap.org/data/2.5/weather?id=$cityId&units=metric&APPID=$key');
  var response = jsonDecode(res.body);
  print(response);
  Weather x;
  try {
    x = Weather.fromJson(response);
  } catch (err) {
    print(err.toString());
  }
//  print(x);
  return x;
}