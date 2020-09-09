import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double z=10;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(title: Text('x'),),
        body: Center(
          child: Container(
            child: FlatButton(
              child: Text(
                "${log(z)}",
              ),
              onPressed: (){
                  setState(() {
                    z=z*10;
                  });
              },
            ),
          ),
        ),
      ),
    );
  }
}
