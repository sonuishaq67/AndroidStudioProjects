import 'package:flutter/material.dart';
import 'package:weatherApp/pages/loading.dart';
import 'home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_icons/flutter_icons.dart';

class Display extends StatefulWidget {
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  var temp;
  var humidity;
  var description;
  var currently;
  var pressure;
  var feelslike;
  var visibility;
  var tempmin;
  var tempmax;
  String value;
  String name;
  Map data = {};
  Map datanew;

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    datanew = data['datanew'];
    setState(() {
      this.name = datanew['name'];
      this.temp = datanew['main']['temp'];
      this.description = datanew['weather'][0]['description'];
      this.humidity = datanew['main']['humidity'];
      this.currently = datanew['weather'][0]['main'];
      this.pressure = datanew['main']['pressure'];
      this.feelslike = datanew['main']['feels_like'];
      this.visibility = datanew['visibility'];
      this.visibility /= 1000;
      this.tempmin = datanew['main']['temp_min'];
      this.tempmax = datanew['main']['temp_max'];

    });
    print(datanew);
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            color: Colors.cyan,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    name != null ? name.toString() : "Loading",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  temp != null ? temp.toString() + '\u00B0' : "Loading",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 36,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(FontAwesome.thermometer_three_quarters),
                    trailing: Text(
                        temp != null ? temp.toString() + '\u00B0' + "/" + feelslike.toString() + '\u00B0' : "Loading"),
                    title: Text("Temp/Feels like"),
                  ),
                  ListTile(
                    leading: Icon(FontAwesome.thermometer_three_quarters),
                    trailing: Text(
                        tempmin != null ? tempmin.toString() + '\u00B0' + "/" + tempmax.toString() + '\u00B0' : "Loading"),
                    title: Text("Lo/Hi"),
                  ),
                  ListTile(
                    leading: Icon(FontAwesome.sun_o),
                    trailing: Text(
                        humidity != null ? humidity.toString() + "%" : "Loading"),
                    title: Text('Humidity'),
                  ),
                  ListTile(
                    leading: Icon(FontAwesome.cloud),
                    trailing: Text(description != null
                        ? description.toString()
                        : "Loading"),
                    title: Text("Weather"),
                  ),
                  ListTile(
                    leading: Icon(FontAwesome.compress),
                    trailing: Text(pressure != null
                        ? pressure.toString() + " mb"
                        : "Loading"),
                    title: Text("Pressure"),
                  ),
                  ListTile(
                    leading: Icon(FontAwesome.low_vision),
                    trailing: Text(visibility!= null
                        ? visibility.toString() + " km"
                        : "Loading"),
                    title: Text("Visibility"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
