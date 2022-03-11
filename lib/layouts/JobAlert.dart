import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:womensafety/api/getFreelancerList.dart';
import 'package:womensafety/layouts/FreelancerProfile.dart';
import 'package:womensafety/modules/FreelancerList.dart';

class JobAlert extends StatefulWidget {
  @override
  _JobAlertState createState() => _JobAlertState();
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _JobAlertState extends State<JobAlert> {
  List<FreelancerList>fList = [];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Freelancer"),
        backgroundColor: skyblue,
      ),
      body: Container(
        padding: EdgeInsets.all(1.0),
        child: fList.length == 0 ? FutureBuilder<List<FreelancerList>>(
          future: getFreelancerList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SpinKitCircle(
                color: skyblue,
                size: 50,
              );
            }
            if (snapshot.hasData) {
              fList = snapshot.data!;
              return freelancerList();
            }
            return Text('No FreelancerList');
          },
        ) : freelancerList(),

      ),
    );
  }

  ListView freelancerList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: fList.length,
        itemBuilder: (cc, i) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 15,
            margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Padding(
                padding: EdgeInsets.only(top: 20.0,bottom: 20.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:NetworkImage(fList[i].profile_photo) ,
                      radius: 40.0,
                      backgroundColor: Colors.grey,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(fList[i].profession,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          SizedBox(height:5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(fList[i].first_name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              ElevatedButton(
                                child: Text('More Info',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                                style: ElevatedButton.styleFrom(
                                  primary: skyblue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) =>  FreelancerProfile(id:fList[i].id),
                                  ));
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

}
