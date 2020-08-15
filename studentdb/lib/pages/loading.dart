import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:hexcolor/hexcolor.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void waitForIt() async {
    bool isOnline = await DataConnectionChecker().hasConnection;
//    bool isOnline = false; // to check loading page
    if (isOnline) {
      Navigator.pushReplacementNamed(context, '/home');
    } else
      print(DataConnectionChecker().lastTryResults);
  }

  @override
  void initState() {
    super.initState();
    waitForIt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#4F6F8F'),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SpinKitDoubleBounce(
                color: Colors.black,
                size: 35.0,
              ),
              DelayedDisplay(
                delay: Duration(seconds: 3),
                child: Text(
                  "Check your internet connection",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
