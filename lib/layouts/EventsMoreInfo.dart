import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_plus/share_plus.dart';
import 'package:womensafety/api/getHealthTipList.dart';
import 'package:womensafety/modules/HealthTipList.dart';

class EventsMoreInfo extends StatefulWidget {
  final String  image,title,description;
  const EventsMoreInfo({Key? key, required this.image,required this.title,required this.description,});

  @override
  _EventsMoreInfoState createState() => _EventsMoreInfoState(image,title,description);
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _EventsMoreInfoState extends State<EventsMoreInfo> {
  _EventsMoreInfoState(this.image,this.title,this.description);
  String image="";
  String title="";
  String description="";

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events"),
        backgroundColor: skyblue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                FutureBuilder(
                    future:getHealthTipList(),
                    builder: (cc,snap){
                      print(snap.data.toString());
                      if(snap.hasData){
                        return Container(
                            height: 150,
                            width: 320,
                            child: Padding(
                              padding: EdgeInsets.only(top: 20.0,bottom: 15.0,left: 10.0,right: 10.0),
                              child: Image.network(image),
                            )
                        );
                      }
                      return SizedBox();
                    }),
              ],
            ),
            SizedBox(height: 5,),
            Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text(title,style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold),)
            ),
            SizedBox(height: 10,),
            Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text(description,style: TextStyle(fontWeight: FontWeight.bold),)
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

}

