import 'dart:convert';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:validators/validators.dart';

// ignore: camel_case_types
class studentUpdate extends StatefulWidget {
  @override
  _studentUpdateState createState() => _studentUpdateState();
}

class _studentUpdateState extends State<studentUpdate> {
  final _nameController = TextEditingController();
  final _branchController = TextEditingController();
  final _iDController = TextEditingController();
  final _sectionController = TextEditingController();
  final _rollNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#4F6F8F'),
      appBar: AppBar(
        backgroundColor: Hexcolor('#1B3B59'),
        title: Text('Update the Student'),
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
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the Name',
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
                controller: _branchController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the Branch',
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
                controller: _iDController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter USN/ID',
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
                controller: _sectionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the Section',
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
                controller: _rollNumberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the roll number',
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
                  content: Text('${_nameController.text} has been updated.'),
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
    String name = _nameController.text;
    String branch = _branchController.text;
    String iDNO = _iDController.text;
    String section = _sectionController.text;
    int rollno = int.parse(_rollNumberController.text);
    Map data = {
      'name': name,
      'branch': branch,
      'iDNO': iDNO,
      'section': section,
      'rollno': rollno
    };
    String body = json.encode(data);
    var client = http.Client();
    var uriResponse = await client.put('http://34.224.4.55:8080/updateStudent',
        headers: {"Content-Type": "application/json"}, body: body);
    print(uriResponse.body);
  }
}
