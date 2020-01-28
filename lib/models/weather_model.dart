class Weather {
//  double longitude;
//  double latitude;
//  int weatherTypeId;
//  String shortDesc;
//  String longDesc;
//  String icon;
//  double temp;
//  double feelsLike;
//  int pressure;
//  int humidity;
//  num visibility;
//  double windSpeed;
//  int windDegrees;
//  int cityId;
//  String cityName;
//  String countryCode;
//  int sunrise;
//  int sunset;
  double longitude;
  double latitude;
  var weatherTypeId;
  String shortDesc;
  String longDesc;
  String icon;
  var temp;
  var feelsLike;
  var pressure;
  var humidity;
  var visibility;
  var windSpeed;
  var windDegrees;
  int dateTimeOfData;
  var cityId;
  String cityName;
  String countryCode;
  int sunrise;
  int sunset;

  Weather({
    this.longitude,
    this.latitude,
    this.weatherTypeId,
    this.shortDesc,
    this.longDesc,
    this.icon,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.visibility,
    this.windSpeed,
    this.windDegrees,
    this.dateTimeOfData,
    this.cityId,
    this.cityName,
    this.countryCode,
    this.sunrise,
    this.sunset,
});

  factory Weather.fromJson(Map<String, dynamic> jsonData) {
    return Weather(
      longitude: jsonData['coord']['lon'],
      latitude: jsonData['coord']['lat'],
      weatherTypeId: jsonData['weather'][0]['id'],
      shortDesc: jsonData['weather'][0]['main'],
      longDesc: jsonData['weather'][0]['description'],
      icon: jsonData['weather'][0]['icon'],
      temp: jsonData['main']['temp'],
      feelsLike: jsonData['main']['feels_like'],
      pressure: jsonData['main']['pressure'],
      humidity: jsonData['main']['humidity'],
      visibility: jsonData['visibility'],
      windSpeed: jsonData['wind']['speed'],
      windDegrees: jsonData['wind']['deg'],
      dateTimeOfData: jsonData['dt'],
      cityId: jsonData['id'],
      cityName: jsonData['name'],
      countryCode: jsonData['sys']['country'],
      sunrise: jsonData['sys']['sunrise'],
      sunset: jsonData['sys']['sunset'],
    );
  }

}