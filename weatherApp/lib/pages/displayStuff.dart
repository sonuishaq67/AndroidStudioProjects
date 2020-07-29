import 'package:flutter/material.dart';
import 'package:weatherApp/pages/loading.dart';
import 'home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Display extends StatefulWidget {
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  var temp;
  var humidity;
  var description;
  var currently;
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
    });
    print(datanew);
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            color: Colors.blueAccent,
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
                    leading: Icon(Icons.ac_unit),
                    trailing: Text(
                        temp != null ? temp.toString() + '\u00B0' : "Loading"),
                    title: Text("Temperature"),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    trailing: Text(
                        humidity != null ? humidity.toString() : "Loading"),
                    title: Text('humidity'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_cloudy),
                    trailing: Text(description != null
                        ? description.toString()
                        : "Loading"),
                    title: Text("Weather"),
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
