import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weatherApp/services/City.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myController = TextEditingController();
  Map data = {};
  Map datanew;
  http.Response response;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  String value;
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    List<City> citylist = data['citylist'];
    print(citylist.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cloud'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: TextFormField(
              controller: myController,
              decoration: InputDecoration(
                labelText: 'Enter an area name',
              ),
            ),
          ),
          FlatButton.icon(
            onPressed: () async {
              value = myController.text;
              print(value);
              response = await http.get(
                  'http://api.openweathermap.org/data/2.5/weather?q=$value&units=metric&appid=your-app-id');
              datanew = jsonDecode(response.body);
              Navigator.pushNamed(
                context,
                '/display',
                arguments: {
                  'datanew': datanew,
                },
              );
            },
            icon: Icon(Icons.search),
            label: Text('Get results'),
          ),
        ],
      ),
    );
  }
}
//TypeAheadFormField(
//textFieldConfiguration: TextFieldConfiguration(
//controller: this._typeAheadController,
//decoration: InputDecoration(labelText: 'City')),
//suggestionsCallback: (pattern) {
//return CitiesService.getSuggestions(pattern);
//},
//itemBuilder: (context, suggestion) {
//return ListTile(
//title: Text(suggestion),
//);
//},
//transitionBuilder: (context, suggestionsBox, controller) {
//return suggestionsBox;
//},
//onSuggestionSelected: (suggestion) {
//this._typeAheadController.text = suggestion;
//},
//validator: (value) {
//if (value.isEmpty) {
//return 'Please select a city';
//}
//},
//onSaved: (value) => this._selectedCity = value,
//),
