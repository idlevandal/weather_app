class Weather {
  double longitude;
  double latitude;
  int weatherTypeId;
  String shortDesc;
  String longDesc;
  String icon;
  double temp;
  int pressure;
  int humidity;
  double tempMin;
  double tempMax;
  num visibility;
  double windSpeed;
  int windDegrees;
  int cityId;
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
    this.pressure,
    this.humidity,
    this.tempMin,
    this.tempMax,
    this.visibility,
    this.windSpeed,
    this.windDegrees,
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
      pressure: jsonData['main']['pressure'],
      humidity: jsonData['main']['humidity'],
      tempMin: jsonData['main']['temp_min'],
      tempMax: jsonData['main']['temp_max'],
      visibility: jsonData['visibility'],
      windSpeed: jsonData['wind']['speed'],
      windDegrees: jsonData['wind']['deg'],
      cityId: jsonData['id'],
      cityName: jsonData['name'],
      countryCode: jsonData['sys']['country'],
      sunrise: jsonData['sys']['sunrise'],
      sunset: jsonData['sys']['sunset'],
    );
  }

}