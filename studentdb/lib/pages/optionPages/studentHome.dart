import 'dart:convert';
import 'package:hexcolor/hexcolor.dart';

import 'package:StudentProject/model/Student.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class studentHome extends StatefulWidget {
  @override
  _studentHomeState createState() => _studentHomeState();
}

class _studentHomeState extends State<studentHome> {
  List<Student> items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#4F6F8F'),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Hexcolor('#1B3B59'),
        title: Text('student home page'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                splashColor: Hexcolor('#4F6F8F'),
                onPressed: () async {
                  var client = new http.Client();
                  final res = await client
                      .get('http://34.224.4.55:8080/getAllStudents');
                  print(res.body);
                  final parsed =
                  await json.decode(res.body).cast<Map<String, dynamic>>();
                  items = await parsed
                      .map<Student>((json) => Student.fromJson(json))
                      .toList();
                  print(items);
                  Navigator.pushNamed(context, '/getAllstudents',
                      arguments: {'items': items});
                },

                textColor: Colors.white,
                color: Colors.transparent,
                padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.black38,
                        Hexcolor('#132A40'),
                        Hexcolor('#1B3B59'),
                        Hexcolor('#224C73'),
                        Hexcolor('#4F6F8F'),
                        Hexcolor('#7B93AB'),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: const Text('obtain', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                splashColor: Hexcolor('#4F6F8F'),
                onPressed: () {
                  Navigator.pushNamed(context, '/studentInsert');
                },
                textColor: Colors.white,
                color: Colors.transparent,
                padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.black38,
                        Hexcolor('#132A40'),
                        Hexcolor('#1B3B59'),
                        Hexcolor('#224C73'),
                        Hexcolor('#4F6F8F'),
                        Hexcolor('#7B93AB'),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: const Text('insert', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                splashColor: Hexcolor('#4F6F8F'),
                onPressed: () {
                  Navigator.pushNamed(context, '/updateStudent');
                },
                textColor: Colors.white,
                color: Colors.transparent,
                padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.black38,
                        Hexcolor('#132A40'),
                        Hexcolor('#1B3B59'),
                        Hexcolor('#224C73'),
                        Hexcolor('#4F6F8F'),
                        Hexcolor('#7B93AB'),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: const Text('update', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                splashColor: Hexcolor('#4F6F8F'),
                onPressed: () {
                  Navigator.pushNamed(context, '/deleteStudent');
                },
                textColor: Colors.white,
                color: Colors.transparent,
                padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.black38,
                        Hexcolor('#132A40'),
                        Hexcolor('#1B3B59'),
                        Hexcolor('#224C73'),
                        Hexcolor('#4F6F8F'),
                        Hexcolor('#7B93AB'),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: const Text('delete', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
