import 'package:StudentProject/model/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final fixing = MediaQuery.of(context);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//    AssetImage image = AssetImage('${slides[index].img}');
    return Scaffold(
//      resizeToAvoidBottomPadding: false,
      backgroundColor: Hexcolor('#4F6F8F'),
      appBar: AppBar(
          backgroundColor: Hexcolor('#1B3B59'),
          centerTitle: true,
          title: Text(
            'Welcome to the Lobby',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 26,
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          height: 570,
          padding: const EdgeInsets.only(left: 15),
          child: Swiper(
              itemCount: slides.length,
//          itemHeight: MediaQuery.of(context).size.height - 64,
              itemWidth: fixing.size.width - 64,
              layout: SwiperLayout.STACK,
              pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  activeSize: 12,
                  activeColor: Hexcolor('#224c73'),
                  color: Colors.grey[300],
                  space: 6,
                ),
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed<dynamic>(context, slides[index].url);
                  },
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                          ),
                          Card(
                            color: Hexcolor('#224c73'),
                            elevation: 10,
                            shadowColor: Hexcolor('#1b3b59'),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(60.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Image(
                                    image: AssetImage(
                                     "${slides[index].img}",
                                    ),
                                    height: 200,
                                    width: 200,
                                  ),
                                  Text(
                                    slides[index].name,
                                    style: TextStyle(
                                        fontSize: 32, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    slides[index].desc,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Know more",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        size: 18.0,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
//                                SizedBox(height: 10,),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
