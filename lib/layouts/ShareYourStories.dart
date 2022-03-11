
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class  ShareYourStories extends StatefulWidget {
  @override
  _ShareYourStoriesState createState() => _ShareYourStoriesState();
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _ShareYourStoriesState extends State<ShareYourStories> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Share Your Stories"),
        backgroundColor: skyblue,
      ),
      body:  Center(
        child: Container(
          child: Text("Coming Soon",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }

}

