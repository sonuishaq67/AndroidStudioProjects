import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class showExams extends StatefulWidget {
  @override
  _showExamsState createState() => _showExamsState();
}

class _showExamsState extends State<showExams> {
  Map items;
  Map data;
  int i = 0;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    items = data['items'];
    print(items);
    print(items.length);
    return Scaffold(
      backgroundColor: Hexcolor('#4F6F8F'),
      appBar: AppBar(
        backgroundColor: Hexcolor('#1B3B59'),
        title: Text('Welcome, ${data['id']}'),
      ),
      body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return new Column(
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
                              'Subject Name: ${items[index]['subjectName']}',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Date: ${items[index]['examDate']}',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Type: ${items[index]['examName']}',
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
            );
          }),
    );
  }
}
