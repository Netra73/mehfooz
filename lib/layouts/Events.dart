import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:womensafety/api/getEvents.dart';
import 'package:womensafety/layouts/EventsMoreInfo.dart';
import 'package:womensafety/modules/EventsList.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _EventsState extends State<Events> {
  List<EventsList>eList = [];
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
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: eList.length == 0 ? FutureBuilder<List<EventsList>>(
          future: getEventsList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SpinKitCircle(
                color: skyblue,
                size: 50,
              );
            }
            if (snapshot.hasData) {
              eList = snapshot.data!;
              return healthtipList();
            }
            return Container(
              child: Text('No events',style: TextStyle(fontSize: 20),),
            );
          },
        ) : healthtipList(),

      ),
    );
  }

  ListView healthtipList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: eList.length,
        itemBuilder: (cc, i) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) =>  EventsMoreInfo(image:eList[i].image,title:eList[i].title,description:eList[i].description),
              ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 15,
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        FutureBuilder(
                            future:getEventsList(),
                            builder: (cc,snap){
                              print(snap.data.toString());
                              if(snap.hasData){
                                return Container(
                                    height: 150,
                                    width: 320,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10.0,bottom: 5.0),
                                      child: Image.network(eList[i].image),
                                    )
                                );
                              }
                              return SizedBox();
                            }),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text(eList[i].title,style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold),),
                    SizedBox(height: 5,),
                    //DescriptionTextWidget(text: eList[i].description),
                    GestureDetector(
                       onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>  EventsMoreInfo(image:eList[i].image,title:eList[i].title,description:eList[i].description),
                          ),
                          );
                        },
                        child: Text("More Info",style: TextStyle(fontWeight: FontWeight.bold,color:skyblue),)
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({required this.text});

  @override
  _DescriptionTextWidgetState createState() => new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String firstHalf="";
  String secondHalf="";
  bool flag = true;
  @override
  void initState() {
    super.initState();

    if (widget.text.length > 50) {
      firstHalf = widget.text.substring(0, 50);
      secondHalf = widget.text.substring(50, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? new Text(firstHalf)
          : Column(
        children: <Widget>[
          new Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf)),
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  flag ? "show more" : "show less",
                  style: new TextStyle(color: Colors.blue),
                ),
              ],
            ),
            onTap: () {
              setState(() {
                flag = !flag;
              });
            },
          ),
        ],
      ),
    );
  }
}
