import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;
  WorldTime({this.location, this.flag, this.url});
  Future<void> getTime() async {
    try {
      http.Response response =
          await http.get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset1 = data['utc_offset'].substring(1, 3);
      String offset2 = data['utc_offset'].substring(4, 6);
      DateTime now = DateTime.parse(datetime);
      print(data);
      if (data['utc_offset'][0] == '+')
        now = now.add(
            Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));
      else
        now = now.subtract(
            Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error this ishaq: ' + e.toString());
      time = "could not get time";
    }
  }
}
