import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_plus/share_plus.dart';
import 'package:womensafety/api/getHealthTipList.dart';
import 'package:womensafety/layouts/HealthTipMoreInfo.dart';
import 'package:womensafety/modules/HealthTipList.dart';

class HealthTip extends StatefulWidget {
  @override
  _HealthTipState createState() => _HealthTipState();
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _HealthTipState extends State<HealthTip> {
  List<HealthTipList>hList = [];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Health Tip"),
        backgroundColor: skyblue,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: hList.length == 0 ? FutureBuilder<List<HealthTipList>>(
          future: getHealthTipList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SpinKitCircle(
                color: skyblue,
                size: 50,
              );
            }
            if (snapshot.hasData) {
              hList = snapshot.data!;
              return healthtipList();
            }
            return Container(
              child: Text('No health Tips',style: TextStyle(fontSize: 20),),
            );
          },
        ) : healthtipList(),
      ),
    );
  }

  ListView healthtipList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: hList.length,
        itemBuilder: (cc, i) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) =>  HealthTipMoreInfo(image:hList[i].image,title:hList[i].title,description:hList[i].description),
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
                child: Container(
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
                                        padding: EdgeInsets.only(top: 20.0,bottom: 15.0),
                                        child: Image.network(hList[i].image),
                                      )
                                  );
                                }
                                return SizedBox();
                              }),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Text(hList[i].title,style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold),),
                     /* SizedBox(height: 5,),
                      DescriptionTextWidget(text: hList[i].description),
                      SizedBox(height: 10,),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:
                          [
                            Text("Share",style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(width: 5.0,),
                            GestureDetector(
                              onTap:()=>{
                                hList[i].image,
                                Share.share('Please visit https://www.mehfooz.in to learn more about programming',)
                              },
                              child:Icon(Icons.share,color:pink,),
                            ),
                            SizedBox(width: 10,),
                          ],
                        ),
                      )*/
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>  HealthTipMoreInfo(image:hList[i].image,title:hList[i].title,description:hList[i].description),
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
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? Text(firstHalf)
          : Column(
        children: <Widget>[
          Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf)),
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  flag ? "show more" : "show less",
                  style: TextStyle(color: Colors.blue),
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
