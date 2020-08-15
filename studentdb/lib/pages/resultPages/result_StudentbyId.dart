import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class showStudent extends StatefulWidget {
  @override
  _showStudentState createState() => _showStudentState();
}

class _showStudentState extends State<showStudent> {
  Map items;
  Map data;
  String id;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    items = data['items'];
    id = data['id'];
    return Scaffold(
      backgroundColor: Hexcolor('#4F6F8F'),
      appBar: AppBar(
        backgroundColor: Hexcolor('#1B3B59'),
        title: Text('Welcome, ${items[0]['id_No'].toUpperCase()}'),
      ),
      body: Builder(
          builder: (context) => Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    color: Hexcolor('#224c73'),
                    elevation: 10,
                    child: Center(
                      child: Container(
                        width: 350,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Name: ${items[0]['name']}',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Roll No: ${items[0]['roll_no']}',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Branch: ${items[0]['branch']}',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Section: ${items[0]['section']}',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
    );
  }
}
