
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:womensafety/api/getBusinessCatList.dart';
import 'package:womensafety/layouts/BusinessProfile.dart';
import 'package:womensafety/modules/BusinessCat.dart';

class  PromoteYourBusiness extends StatefulWidget {
  @override
  _PromoteYourBusinessState createState() => _PromoteYourBusinessState();
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _PromoteYourBusinessState extends State<PromoteYourBusiness> {
  List<BusinessCat>bList = [];

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
      body:  Container(
        padding: EdgeInsets.all(10.0),
        height: 610,
        child: bList.length == 0 ? FutureBuilder<List<BusinessCat>>(
          future: getBusinessCatList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SpinKitCircle(
                color: skyblue,
                size: 50,
              );
            }
            if (snapshot.hasData) {
              bList = snapshot.data!;
              return businessList();
            }
            return Container(
              child: Text('No category'),
            );
          },
        ) : businessList(),

      ),

      /*Container(
        child:ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (cc, i) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>  BusinessProfile(),
                  ));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 2,
                  margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                              height: 80,
                              width: 40,
                              child: Padding(
                                padding: EdgeInsets.only(top: 10.0,bottom: 5.0),
                                child:  Image(
                                  image: AssetImage("assets/image/mehfooztm.png") ,
                                ),
                              )
                          ),
                          SizedBox(width: 20,),
                          Text("Graceinfotech",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),*/
      /* Center(
        child: Container(
          child: Text("Coming Soon",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
      ),*/
    );
  }
  ListView businessList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: bList.length,
        itemBuilder: (cc, i) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) =>  BusinessProfile(id:bList[i].b_cat_id),
              ));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 2,
              margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  child: Row(
                    children: [
                      /* Container(
                          height: 80,
                          width: 40,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.0,bottom: 5.0),
                            child:  Image(
                              image: AssetImage("assets/image/mehfooztm.png") ,
                            ),
                          )
                      ),*/
                      Stack(
                        children: [
                          FutureBuilder(
                              future:getBusinessCatList(),
                              builder: (cc,snap){
                                print(snap.data.toString());
                                if(snap.hasData){
                                  return Center(
                                    child: Container(
                                        height: 80,
                                        width: 40,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 10.0,bottom: 5.0),
                                          child: Image.network(bList[i].icon),
                                        )
                                    ),
                                  );
                                }
                                return SizedBox();
                              }),
                        ],
                      ),
                      SizedBox(width: 20,),
                      Text(bList[i].business_category,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

