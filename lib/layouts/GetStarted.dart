import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);


class GetStarted extends StatefulWidget {

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Expanded(
            child: Container(
              child:Image.asset("assets/image/logo_gif.gif",fit:BoxFit.fill,),
            ),
          ),
          Container(
            height: 50,
            width: 500,
            child: ElevatedButton(
              child: Text('Get Started',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
              style: ElevatedButton.styleFrom(
                primary: pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>  LoginPage(),
                ),
                );
              },
            ),
          ),
        ],
      );
  }
}