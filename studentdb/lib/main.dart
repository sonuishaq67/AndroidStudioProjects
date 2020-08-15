import 'package:StudentProject/pages/optionPages/branchHome.dart';
import 'package:StudentProject/pages/optionPages/collegeInfoHome.dart';
import 'package:StudentProject/pages/optionPages/examHome.dart';
import 'package:StudentProject/pages/optionPages/studentHome.dart';
import 'package:StudentProject/pages/optionPages/subjectHome.dart';
import 'package:StudentProject/pages/queryPages/delete/branchDelete.dart';
import 'package:StudentProject/pages/queryPages/delete/examDelete.dart';
import 'package:StudentProject/pages/queryPages/delete/studentDelete.dart';
import 'package:StudentProject/pages/queryPages/delete/subjectDelete.dart';
import 'package:StudentProject/pages/queryPages/getByQuery/getExamsById.dart';
import 'package:StudentProject/pages/queryPages/getByQuery/getStudentById.dart';
import 'package:StudentProject/pages/queryPages/insert/branchInsert.dart';
import 'package:StudentProject/pages/queryPages/insert/examInsert.dart';
import 'package:StudentProject/pages/queryPages/insert/studentInsert.dart';
import 'package:StudentProject/pages/queryPages/insert/subjectInsert.dart';
import 'package:StudentProject/pages/queryPages/update/branchUpdate.dart';
import 'package:StudentProject/pages/queryPages/update/examUpdate.dart';
import 'package:StudentProject/pages/queryPages/update/studentUpdate.dart';
import 'package:StudentProject/pages/queryPages/update/subjectUpdate.dart';
import 'package:StudentProject/pages/resultPages/getAllExams.dart';
import 'package:StudentProject/pages/resultPages/getAllStudent.dart';
import 'package:StudentProject/pages/resultPages/getAllBranch.dart';
import 'package:StudentProject/pages/resultPages/getAllSubject.dart';
import 'package:StudentProject/pages/resultPages/result_ExamsbyId.dart';
import 'package:StudentProject/pages/resultPages/result_StudentbyId.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/studentHome': (context) => studentHome(),
      '/branchHome': (context) => branchHome(),
      '/subjectHome': (context) => subjectHome(),
      '/examHome': (context) => examHome(),
      '/collegeInfoHome': (context) => collegeInfo(),
      '/getAllstudents': (context) => getAllStudent(),
      '/getAllBranch': (context) => getAllBranch(),
      '/getAllsubjects': (context) => getAllSubject(),
      '/getAllExams': (context) => getAllExams(),
      '/insertExam': (context) => examInsert(),
      '/insertBranch': (context) => branchInsert(),
      '/insertSubject': (context) => subjectInsert(),
      '/studentInsert': (context) => studentInsert(),
      '/updateExam': (context) => examUpdate(),
      '/updateStudent': (context) => studentUpdate(),
      '/updateBranch': (context) => branchUpdate(),
      '/updateSubject': (context) => subjectUpdate(),
      '/deleteSubject': (context) => subjectDelete(),
      '/deleteBranch': (context) => branchDelete(),
      '/deleteExam': (context) => examDelete(),
      '/deleteStudent': (context) => studentDelete(),
      '/getStudentById': (context) => getStudentById(),
      '/getExamsById': (context) => getExamsById(),
      '/showStudentdata': (context) => showStudent(),
      '/showExamdata': (context) => showExams(),
    },
  ));
}
