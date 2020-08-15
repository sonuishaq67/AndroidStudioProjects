import 'package:StudentProject/model/Subjects.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class getAllSubject extends StatefulWidget {
  @override
  _getAllSubjectState createState() => _getAllSubjectState();
}

class _getAllSubjectState extends State<getAllSubject> {
  List<Subjects> items;
  Map data;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    final title = 'Subjects';
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
                title: Text(
                  '${items[index].subject}'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  '${items[index].subjectID}',
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
