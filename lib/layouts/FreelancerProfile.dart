import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:womensafety/api/getFreelancerDetails.dart';

class FreelancerProfile extends StatefulWidget {
  final String  id;
  const FreelancerProfile({Key? key, required this.id,});

  @override
  _FreelancerProfileState createState() => _FreelancerProfileState(id);
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _FreelancerProfileState extends State<FreelancerProfile> {
  String id;
  String first_name="";
  String last_name="";
  String phone="";
  String website="";
  String email="";
  String about_me="";
  String profession="";
  String skills="";
  String profile_photo="";
  _FreelancerProfileState(this.id);

  @override
  void initState() {
    super.initState();
    _getFreelancerDetails();
  }

  _showLoading() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                SizedBox(
                  child: CircularProgressIndicator(),
                  height: 40.0,
                  width: 40.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My profile"),
        backgroundColor: skyblue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,
              width: 400,
              color: Colors.black26,
              child: Center(
                child: Text(first_name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0,right: 20.0),
                      child: CircleAvatar(
                        backgroundImage:NetworkImage(profile_photo) ,
                        radius: 50.0,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(profession,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.perm_identity_rounded,size: 20,color: skyblue,),
                          SizedBox(width: 5,),
                          Text(first_name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
                        ],
                      ),
                      SizedBox(height:10),
                      Row(
                        children: [
                          Icon(Icons.mail_outline,size: 20,color: skyblue,),
                          SizedBox(width: 5,),
                          Text(email,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
                        ],
                      ),
                      SizedBox(height:10),
                      Row(
                        children: [
                          Icon(Icons.autorenew_rounded,size: 20,color: skyblue,),
                          SizedBox(width: 5,),
                          Text(website,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
                        ],
                      ),
                      SizedBox(height:10),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height:20),
            Center(
              child: Container(
                  width: 180.0,
                  height: 50.0,
                  child: ElevatedButton(
                    child: Text('HIRE ME',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      primary: skyblue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      FlutterPhoneDirectCaller.callNumber(phone);
                    },
                  )
              ),
            ),
            SizedBox(height:20),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Hello,I am "+first_name,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Divider(color: Colors.black,thickness: 3,),
            SizedBox(height:20),
            Padding(
              padding: EdgeInsets.only(left: 10.0,right: 10.0),
              child: Text(about_me),
            ),
            SizedBox(height:20),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("Skills",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Divider(color: Colors.black,thickness: 3,),
            Padding(
              padding: EdgeInsets.only(left: 10.0,right: 10.0),
              child: Text(skills),
            ),           SizedBox(height:20),
          ],
        ),
      ),
    );
  }
  _getFreelancerDetails(){
    // _showLoading();
    getfDetails(id).then((value){
      var response = value;
      if(response.statusCode == 200){
        setState(() {
          var data = response.data['data'];
          String id = data["id"];
          first_name = data["first_name"];
          last_name = data["last_name"];
          phone = data["phone"];
          website = data["website"];
          email = data["email"];
          about_me = data["about_me"];
          profession = data["profession"];
          skills = data["skills"];
          profile_photo = data["profile_photo"];
        });
      }
    }).catchError((error){
      if(error is DioError){
        Navigator.pop(context);
      }
    });
  }
}
