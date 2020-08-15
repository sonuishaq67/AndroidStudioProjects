import 'dart:convert';
import 'package:StudentProject/model/Student.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:validators/validators.dart';

class getStudentById extends StatefulWidget {
  @override
  _getStudentByIdState createState() => _getStudentByIdState();
}

class _getStudentByIdState extends State<getStudentById> {
  Map items = {};
  final _studentIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#4F6F8F'),
      appBar: AppBar(
        backgroundColor: Hexcolor('#1B3B59'),
        title: Text('Insert the ID'),
      ),
      body: Builder(
        builder: (context) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                obscureText: false,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller: _studentIdController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the ID',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                validator: (value) {
                  if (isAlpha(value)) return "true";
                  return "false";
                },
              ),
            ),
            RaisedButton(
              color: Hexcolor('#224C73'),
              onPressed: () async {
                var client = http.Client();
                final res = await client.get(
                    'http://34.224.4.55:8080/getstudentbyid/${_studentIdController.text}');
                print(res.body);
                List<dynamic> user = jsonDecode(res.body);
                items = user.asMap();
                final snack = SnackBar(
                  backgroundColor: Hexcolor('#1B3B59'),
                  content:
                      Text('${_studentIdController.text} is being fetched.'),
//                  action: SnackBarAction(
//                    label: 'Undo',
//                    onPressed: () {
//                      // Code that is to be added later
//                    },
//                  ),
                );
                Scaffold.of(context).showSnackBar(snack);

                Navigator.pushNamed(context, '/showStudentdata',
                    arguments: {'items': items});
              },
              child: Text(
                'get results',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
