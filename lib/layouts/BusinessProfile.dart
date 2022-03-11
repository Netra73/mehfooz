import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:womensafety/api/getBusinessPro.dart';
import 'package:womensafety/layouts/BusinessProfileDetails.dart';
import 'package:womensafety/modules/BusinessPro.dart';

class  BusinessProfile extends StatefulWidget {
  final String id;
  const BusinessProfile({Key? key,required this.id});

  @override
  _BusinessProfileState createState() => _BusinessProfileState(id);
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _BusinessProfileState extends State<BusinessProfile> {
  List<BusinessPro>bpList = [];
  String id;
  _BusinessProfileState(this.id);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Promote Your Business"),
        backgroundColor: skyblue,
      ),
      body:
      Container(
        padding: EdgeInsets.all(10.0),
        height: 610,
        child: bpList.length == 0 ? FutureBuilder<List<BusinessPro>>(
          future: getBusinessProfile(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SpinKitCircle(
                color: skyblue,
                size: 50,
              );
            }
            if (snapshot.hasData) {
              bpList = snapshot.data!;
              return businessProfileList();
            }
            return Center(
                child: Text('No companies',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
            );
          },
        ) : businessProfileList(),
      ),
    );
  }
  ListView businessProfileList() {
    return  ListView.builder(
        shrinkWrap: true,
        itemCount: bpList.length,
        itemBuilder: (cc, i) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 15,
            margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
            child: Padding(
              padding: EdgeInsets.only(top: 20.0,bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      FutureBuilder(
                          future:getBusinessProfile(id),
                          builder: (cc,snap){
                            if(snap.hasData){
                              return Center(
                                child: Container(
                                    height: 80,
                                    width: 40,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10.0,bottom: 5.0),
                                      child: Image.network(bpList[i].logo),
                                    )
                                ),
                              );
                            }
                            return SizedBox();
                          }),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(bpList[i].business_name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10.0,),
                          Text(bpList[i].location,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),),
                          SizedBox(height: 20.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FlatButton(
                                onPressed: () => {
                                  FlutterPhoneDirectCaller.callNumber(bpList[i].contact_number),
                                },
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  children: const <Widget>[
                                    Icon(Icons.call),
                                    SizedBox(width: 2.0,),
                                    Text("Call Now",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(color:skyblue)
                                ),
                              ),
                              SizedBox(width: 2.0,),
                              FlatButton(
                                onPressed: () => {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) =>  BusinessProfileDetails(id:bpList[i].id),
                                  )),
                                },
                                padding: EdgeInsets.all(10.0),
                                child:Text("More Info",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(color:skyblue)
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

