import 'dart:convert';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:validators/validators.dart';

class branchUpdate extends StatefulWidget {
  @override
  _branchUpdateState createState() => _branchUpdateState();
}

class _branchUpdateState extends State<branchUpdate> {
  final _courseController = TextEditingController();
  final _courseIDController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#4F6F8F'),
      appBar: AppBar(
        backgroundColor: Hexcolor('#1B3B59'),
        title: Text('Update the Course'),
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
                controller: _courseController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the Course',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                validator: (value) {
                  if (isAlpha(value)) return "true";
                  return "false";
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                autofillHints: null,
                obscureText: false,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller: _courseIDController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the Course ID',
                  labelStyle: TextStyle(color: Colors.white),
//                helperText: 'enter your course id',
//                helperStyle: TextStyle(color: Colors.white),
                ),
                validator: (value) {
                  if (isAlphanumeric(value)) return "true";
                  return "false";
                },
              ),
            ),
            RaisedButton(
              color: Hexcolor('#224C73'),
              onPressed: () {
                _performInsert();
                final snackbar = SnackBar(
                  backgroundColor: Hexcolor('#1B3B59'),
                  content: Text('${_courseController.text} has been added.'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      // Code that is to be added later
                    },
                  ),
                );
                Scaffold.of(context).showSnackBar(snackbar);
              },
              child: Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _performInsert() async {
    String course = _courseController.text;
    String courseId = _courseIDController.text;
    Map data = {'course': course, 'courseId': courseId};
    String body = json.encode(data);
    var client = http.Client();
    var uriResponse = await client.put('http://34.224.4.55:8080/updateBranch',
        headers: {"Content-Type": "application/json"}, body: body);
    print(uriResponse.body);
  }
}
