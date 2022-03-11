import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:womensafety/api/getDoctorstalk.dart';
import 'package:womensafety/layouts/VideoPage.dart';
import 'dart:async';
import 'dart:core';

import 'package:womensafety/modules/DoctalkList.dart';

import 'BusinessProfile.dart';

class  DoctorsTalk extends StatefulWidget {
  @override
  _DoctorsTalk createState() => _DoctorsTalk();
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _DoctorsTalk extends State<DoctorsTalk> {
  List<DoctalkList>vList = [];
  var formatted;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor's talk"),
        backgroundColor: skyblue,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: vList.length == 0 ? FutureBuilder<List<DoctalkList>>(
          future: getDoctorstalk(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SpinKitThreeBounce(
                color: Colors.amber,
                size: 20,
              );
            }
            if (snapshot.hasData) {
              vList = snapshot.data!;
              return videoList();
            }
            return Container(
              child: Text('No videos'),
            );
          },
        ) : videoList(),

      ),
    );
  }

  ListView videoList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: vList.length,
        itemBuilder: (cc, i) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 15,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => VideoPage(mediaUrl: vList[i].video),
                  ));
                },
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          FutureBuilder(
                              future:getDoctorstalk(),
                              builder: (cc,snap){
                                print(snap.data.toString());
                                if(snap.hasData){
                                  return Container(
                                      height: 150,
                                      width: 320,
                                      child: Image.network(vList[i].thumb)
                                  );
                                }
                                return SizedBox();
                              }),
                          SizedBox(width: 5.0),
                          Padding(
                            padding: EdgeInsets.only(top: 20.0,left: 100.0),
                            child: Container(
                                width: 100,
                                height: 100,
                                child: Center(child: Icon(
                                  Icons.play_circle_outline, size: 50.0,)
                                )
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}