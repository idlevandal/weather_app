import 'package:flutter/material.dart';

import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.blueGrey, accentColor: Colors.blueGrey[200]),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle myStyle = TextStyle(fontSize: 30.0, color: Colors.grey[800]);

  Future<Weather> getWeatherFromApi(BuildContext context) async {
    return await getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
          color: Theme.of(context).accentColor,
          padding: EdgeInsets.all(30.0),
          child: FutureBuilder(
            future: getWeatherFromApi(context),
            builder: (context, data) {
              if (data.hasData) {
                Weather weather = data.data;
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 80.0,
                      ),
                      Text(
                        '${weather.cityName.toUpperCase()}',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${weather.longDesc.toUpperCase()}',
                        style: TextStyle(fontSize: 20.0, color: Colors.grey[800]),
                      ),
                      Image.network(
                          'http://openweathermap.org/img/wn/${weather.icon}@2x.png'),
                      Text(
                        '${weather.temp.round()}°',
                        style: TextStyle(
                            fontSize: 80.0, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        'Feels like ${weather.feelsLike}°',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        'Humidity: ${weather.humidity}%',
                        style: myStyle,
                      ),
                    ],
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}
