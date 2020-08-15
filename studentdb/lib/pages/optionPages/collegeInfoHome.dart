import 'package:hexcolor/hexcolor.dart';
import 'package:StudentProject/model/Branch.dart';
import 'package:flutter/material.dart';

class collegeInfo extends StatefulWidget {
  @override
  _collegeInfoState createState() => _collegeInfoState();
}

class _collegeInfoState extends State<collegeInfo> {
  List<Branch> items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#4F6F8F'),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Hexcolor('#1B3B59'),
        title: Text('college info page'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                splashColor: Hexcolor('#4F6F8F'),
                onPressed: () {
                  Navigator.pushNamed(context, '/getStudentById');
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
                  child: const Text('get student by ID', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                splashColor: Hexcolor('#4F6F8F'),
                onPressed: () {
                  Navigator.pushNamed(context, '/getExamsById');
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
                  child: const Text('get exams by ID', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
