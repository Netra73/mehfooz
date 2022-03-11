
/*import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mehfooz_two/functions/Userdata.dart';
import 'package:mehfooz_two/layouts/EditProfile.dart';
import 'package:mehfooz_two/models/ChatUsers.dart';

import 'ChatDetails.dart';

class LiveChat extends StatefulWidget {
  @override
  _LiveChatState createState() => _LiveChatState();
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _LiveChatState extends State<LiveChat> {

  List<ChatUsers> chatUsers = [
    ChatUsers(name: "John Wick", messageText: "How are you?", time: "18 Feb"),
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) =>  ChatDetails(),
        ));

      },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(""),
                    maxRadius: 30,
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Netra", style: TextStyle(fontSize: 16),),
                          SizedBox(height: 6,),
                          Text("Hello",style: TextStyle(fontSize: 13,color: Colors.grey.shade600,),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text("Feb 25",style: TextStyle(fontSize: 12),),
          ],
        ),
      ),
    );
  }
}*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiveChat extends StatefulWidget {
  @override
  _LiveChatState createState() => _LiveChatState();
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _LiveChatState extends State<LiveChat> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Center(
          child: Text("Coming Soon",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
      ),
    );
  }
}
