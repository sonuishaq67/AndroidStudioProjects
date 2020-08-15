import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:StudentProject/model/Student.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class getAllStudent extends StatefulWidget {
  @override
  _getAllStudentState createState() => _getAllStudentState();
}

class _getAllStudentState extends State<getAllStudent> {
  List<Student> items;
  Map data;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    final title = 'Students';
    items = data['items'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Hexcolor('#1B3B59'),
        title: Text(title),
      ),
      body: Scaffold(
        backgroundColor: Hexcolor('#4F6F8F'),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 3.0),
              child: ListTile(
                tileColor: Hexcolor('#224C73'),
                leading: Icon(
                  Icons.broken_image,
                  color: Colors.grey[400],
                ),
//              title: Text('${items[index].Name}'),
                subtitle: Text(
                  '${items[index].Roll_no}',
                  style: TextStyle(color: Colors.grey[400]),
                ),
                trailing: FlatButton(
                    onPressed: () {
                      print('${items[index].Section}'.toUpperCase());
                    },
                    child: Icon(
                      Icons.arrow_right,
                      color: Colors.grey[400],
                      size: 30,
                    )),
                title: Text(
                  '${items[index].Name}'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
