import 'package:http/http.dart';
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
      //make request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // print(datetime);
      // print(offset);

      //create a date time object
      DateTime currentDate = DateTime.parse(datetime);
      currentDate = currentDate.add(Duration(hours: int.parse(offset)));

      //set time property
      isDayTime = currentDate.hour > 6 && currentDate.hour < 20 ? true : false;
      time = DateFormat.jm().format(currentDate);
    }
    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }
  }
}


