import 'dart:convert';
import 'Student.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  var client = new http.Client();
  final res = await client.get('http://192.168.0.107:8080/getAllStudents');
  final parsed = json.decode(res.body).cast<Map<String, dynamic>>();
  var temp = parsed.map<Student>((json) => Student.fromJson(json)).toList();
  runApp(MyApp(items: temp));
}

class MyApp extends StatelessWidget {
  final List<Student> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Long List new ';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${items[index].Name}'),
            );
          },
        ),
      ),
    );
  }
}
