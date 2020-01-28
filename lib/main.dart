import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.blueGrey,
          accentColor: Colors.blueGrey[200]),
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
                      Spacer(flex: 5,),
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
                      Text('Updated: ${formatTimeFromUnix(weather.dateTimeOfData)}'),
                      Image.network(
                          'http://openweathermap.org/img/wn/${weather.icon}@2x.png'),
                      Text(
                        '${weather.temp.toStringAsFixed(1)}°',
                        style: TextStyle(
                            fontSize: 70.0, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        'Feels like ${weather.feelsLike.toStringAsFixed(1)}°',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Spacer(flex: 5,),
                      Text(
                        'Humidity: ${weather.humidity}%',
                        style: myStyle,
                      ),
                      Spacer(flex: 5,),
                      MySunriseSunset(descText: 'Sunrise: ${formatTimeFromUnix(weather.sunrise)}', iconData: Icons.wb_sunny,),
                      MySunriseSunset(descText: 'Sunset: ${formatTimeFromUnix(weather.sunset)}', iconData: Icons.mood_bad,),
                      Spacer(flex: 3,),
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

  String formatTimeFromUnix(int unixDateTime) {
    var unixToDateTime = DateTime.fromMillisecondsSinceEpoch(unixDateTime * 1000);
    return DateFormat.jm().format(unixToDateTime);
  }
}

class MySunriseSunset extends StatelessWidget {
  final String descText;
  final IconData iconData;

  MySunriseSunset({this.descText, this.iconData});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(iconData, size: 24.0,),
          SizedBox(width: 16.0,),
          Text(
              descText,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black87
            ),
          ),
        ],
      ),
    );
  }
}

