import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setUpWorldTime()async{
    WorldTime egypt =  WorldTime(location: 'Egypt', flag: 'Egypt.png', url: 'Africa/Cairo');
    await egypt.getTime();
    setState(() {
      Navigator.pushReplacementNamed(context,'/home' , arguments: {
        'location' : egypt.location,
        'time' : egypt.time,
        'flag' : egypt.flag,
        'isDayTime' : egypt.isDayTime,
      });
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
          child: SpinKitFadingCircle(
            color:  Colors.white,
            size: 70,
          ),
      ),
    );
  }
}
