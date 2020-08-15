import 'dart:convert';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:validators/validators.dart';

// ignore: camel_case_types
class examUpdate extends StatefulWidget {
  @override
  _examUpdateState createState() => _examUpdateState();
}

class _examUpdateState extends State<examUpdate> {
  final _subjectIdController = TextEditingController();
  final _idNoController = TextEditingController();
  final _typeController = TextEditingController();
  final _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#4F6F8F'),
      appBar: AppBar(
        backgroundColor: Hexcolor('#1B3B59'),
        title: Text('Update the Exam'),
      ),
      body: Builder(
        builder: (context) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                obscureText: false,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller: _subjectIdController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the subjectId',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                validator: (value) {
                  if (isAlphanumeric(value)) return "true";
                  return "false";
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                obscureText: false,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller: _idNoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the branch ID',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                validator: (value) {
                  if (isAlpha(value)) return "true";
                  return "false";
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                obscureText: false,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller: _typeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the type',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                validator: (value) {
                  if (isAlphanumeric(value)) return "true";
                  return "false";
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                obscureText: false,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller: _dateController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the date',
                  labelStyle: TextStyle(color: Colors.white),
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
                  content: Text(
                      '${_subjectIdController.text} on ${_dateController.text} has been updated.'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      //Code that is to be added later
                    },
                  ),
                );
                Scaffold.of(context).showSnackBar(snackbar);
              },
              child: Text(
                'Update',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _performInsert() async {
    String subjectID = _subjectIdController.text;
    String branchId = _idNoController.text;
    String type = _typeController.text;
    String date = _dateController.text;
    Map data = {
      'subjectId': subjectID,
      'id_No': branchId,
      'type': type,
      'date': date,
    };
    String body = json.encode(data);
    var client = http.Client();
    var uriResponse = await client.put('http://34.224.4.55:8080/updateExam',
        headers: {"Content-Type": "application/json"}, body: body);
    print(uriResponse.body);
  }
}
