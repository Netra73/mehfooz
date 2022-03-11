import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:womensafety/functions/UserData.dart';
import 'package:womensafety/layouts/GetStarted.dart';
import 'package:womensafety/layouts/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String user="";
  @override
  void initState() {
    checkData("USER").then((value) {
      getData("USER").then((value) {
        if (value != null) {
          var data = jsonDecode(value);
        }
      });
      if (value) {
        setState(() {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              HomePage()), (Route<dynamic> route) => false);
        });
      }
      else {
        setState(() {
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              GetStarted()), (Route<dynamic> route) => false);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120.0,
        width: 120.0,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left:20.0,right: 20.0),
          child: Image(
            image: AssetImage("assets/image/screenlogo.jpg") ,
          ),
        )
    );
  }
}
