
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:womensafety/api/getUser.dart';
import 'package:womensafety/functions/UserData.dart';
import 'package:womensafety/layouts/EditProfile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _ProfileState extends State<Profile> {
  String id="";
  String uname="";
  String uemail="";
  String phone="";

  @override
  void initState() {
    super.initState();
    _getUserDetails();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: mainStyle.bgColor,
      appBar: AppBar(
        title: Container(
          child: Row(
            children: [
              Icon(
                Icons.person,
                color: Colors.black,
                size: 25,
              ),
              SizedBox(width: 5.0,),
              Text('Profile', style: TextStyle(color:Colors.white,fontSize: 18),),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close,size: 25,color: Colors.black87,),
                  ),
                ),
              )
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: skyblue,
        elevation: 2.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 5.0,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.person,color: Colors.black,),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                      child: Text("Name :",style: TextStyle(fontSize: 17),)
                                  ) ,
                                  Container(
                                      margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: Text(uname,style: TextStyle(fontSize: 17),)
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 7,),
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.phone_android,color: Colors.black,),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                      child: Text('+91 ',style: TextStyle(fontSize: 17),)
                                  ),
                                  Text(phone,style: TextStyle(fontSize: 17),)
                                ],
                              ),
                            ),
                            SizedBox(height: 7,),
                            Container(
                              child: Row(
                                children: [
                                  Icon(Icons.email, size: 20.0,color: Colors.black,),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                      child: Text("Mail :",style: TextStyle(fontSize: 17),)
                                  ),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: Text(uemail,style: TextStyle(fontSize: 17),)
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 15,),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RaisedButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context)=>EditProfile()
                                    )).then((value){
                                      if(value!=null){
                                        setState(() {

                                        });
                                      }
                                    });
                                  },
                                  color: Colors.grey[200],
                                  padding: EdgeInsets.all(12.0),
                                  child: (Text('Edit Profile')),
                                ),
                                /* RaisedButton(
                                  onPressed: (){
                                  },
                                  color: Colors.grey[200],
                                  padding: EdgeInsets.all(12.0),
                                  child: (Text('Change Password',)),
                                */
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  _getUserDetails(){
    checkData("USER").then((value) {
      getData("USER_DATA").then((value) {
        print(getData("USER_DATA"));
        if (value != null) {
          var data = jsonDecode(value);
          setState(() {
            id = data['id'];
          });
        }
        getUser(id).then((value) {
          var response = value;
          if(response.statusCode == 200){
            setState(() {
              var data = response.data['data'];
              id = data['id'];
              uname = data['first_name'];
              uemail = data['email'];
              phone = data['phone'];

            });
          }
        });
      });

    });

  }
}