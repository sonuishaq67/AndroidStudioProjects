import 'dart:convert';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:validators/validators.dart';

// ignore: camel_case_types
class subjectInsert extends StatefulWidget {
  @override
  _subjectInsertState createState() => _subjectInsertState();
}

class _subjectInsertState extends State<subjectInsert> {
  final _subjectController = TextEditingController();
  final _subjectIDController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#4F6F8F'),
      appBar: AppBar(
        backgroundColor: Hexcolor('#1B3B59'),
        title: Text('Insert the Subject'),
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
                controller: _subjectController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the Subject',
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
                obscureText: false,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller: _subjectIDController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the Subject ID',
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
                  content: Text('${_subjectController.text} has been added.'),
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
                  'Insert',
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
    String subject = _subjectController.text;
    String subjectID = _subjectIDController.text;
    Map data = {'subjectName': subject, 'subjectId': subjectID};
    String body = json.encode(data);
    var client = http.Client();
    var uriResponse = await client.post('http://34.224.4.55:8080/addSubject',
        headers: {"Content-Type": "application/json"}, body: body);
    print(uriResponse.body);
  }
}
