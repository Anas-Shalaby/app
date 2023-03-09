import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {

  late String location; // location name for the UI
  late String time ; // time in that location
  late String flag; // url to an assets flag icon
  late String url; // endPoint in the api
  late bool isDayTime ;

  WorldTime({required this.location , required this.flag , required this.url});

  Future<void> getTime() async {
    try {
      // make the request to the api
      Response  response =  await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data =jsonDecode( response.body);

      // get properties from data
      String dateTime = data['datetime'];
      String offSet = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours : int.parse(offSet)));


      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      // set the time property
      time = DateFormat.jm().format(now); // it's to make the time looking so good

    }catch(e){
      print('caught error: $e');
      time= "Couldn't get time ";
    }
  }
}

