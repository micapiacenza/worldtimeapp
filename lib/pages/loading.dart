import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime_app/services/world_time.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String timeText = 'Loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Australia', flag: 'australia.png', url: 'Australia/Brisbane');
    await instance.getTime();
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location' : instance.location,
        'flag' : instance.flag,
        'time' : instance.time,
        'isDayTime': instance.isDayTime,
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: SpinKitRipple(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
