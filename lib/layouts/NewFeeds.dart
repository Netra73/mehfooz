import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:womensafety/api/getNewsFeedList.dart';
import 'package:womensafety/layouts/NewFeedsMoreInfo.dart';
import 'dart:core';

import 'package:womensafety/modules/NewsFeedList.dart';


const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);
class NewFeeds extends StatefulWidget {
  @override
  _NewFeedsPage createState() => _NewFeedsPage();
}

class _NewFeedsPage extends State<NewFeeds> {
  List<NewsFeedList>nList = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 670,
      child: nList.length == 0 ? FutureBuilder<List<NewsFeedList>>(
        future: getNewsFeedList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SpinKitCircle(
              color: skyblue,
              size: 50,
            );
          }
          if (snapshot.hasData) {
            nList = snapshot.data!;
            return newfeedList();
          }
          return Container(
            child: Text('No news feed',style: TextStyle(fontSize: 20),),
          );
        },
      ) : newfeedList(),
    );
  }

  ListView newfeedList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: nList.length,
        itemBuilder: (cc, i) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) =>  NewFeedsMoreInfo(image:nList[i].image,title:nList[i].title,description:nList[i].description),
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
                            future:getNewsFeedList(),
                            builder: (cc,snap){
                              if(snap.hasData){
                                return Center(
                                  child: Container(
                                      height: 150,
                                      width: 320,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 10.0,bottom: 5.0),
                                        child: Image.network(nList[i].image),
                                      )
                                  ),
                                );
                              }
                              return SizedBox();
                            }),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text(nList[i].title,style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold),),
                    SizedBox(height: 5,),
                  //  DescriptionTextWidget(text: nList[i].description),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>  NewFeedsMoreInfo(image:nList[i].image,title:nList[i].title,description:nList[i].description),
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
