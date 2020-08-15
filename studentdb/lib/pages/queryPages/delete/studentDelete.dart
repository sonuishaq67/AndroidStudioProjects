import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:validators/validators.dart';

// ignore: camel_case_types
class studentDelete extends StatefulWidget {
  @override
  _studentDeleteState createState() => _studentDeleteState();
}

// ignore: camel_case_types
class _studentDeleteState extends State<studentDelete> {
  final _studentIDController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#4F6F8F'),
      appBar: AppBar(
        backgroundColor: Hexcolor('#1B3B59'),
        title: Text('Deletion'),
      ),
      body: Builder(
        builder: (context) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                controller: _studentIDController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the Student ID',
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
                _performDelete();
                final snackbar = SnackBar(
                  backgroundColor: Hexcolor('#1B3B59'),
                  content:
                      Text('${_studentIDController.text} has been deleted.'),
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
                  'submit',
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

  void _performDelete() async {
    String studentID = _studentIDController.text;
    String body = studentID;
    var client = http.Client();
    var response = await client.send(http.Request(
        "DELETE", Uri.parse("http://34.224.4.55:8080/deleteStudent/"))
      ..body = "$studentID");
    print(response.statusCode);
  }
}
