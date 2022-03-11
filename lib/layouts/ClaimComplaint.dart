import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:url_launcher/url_launcher.dart';

class ClaimComplaint extends StatefulWidget {
  @override
  _ClaimComplaintState createState() => _ClaimComplaintState();
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _ClaimComplaintState extends State<ClaimComplaint> {
  TextEditingController _numberCtrl = new TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  String message = "This is a test message!";
  List<String> recipents = ["9742637042"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Claim Complaint"),
        backgroundColor: skyblue,
      ),
      body:   SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40.0,left: 50.0,right: 50.0,bottom: 20.0),
          child: IconTheme(
            data: IconThemeData(size: 10, color: Colors.white),
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing:6,
              mainAxisSpacing: 6,
              shrinkWrap: true,
              children: [
                GestureDetector(
                  onTap: (){
                    FlutterPhoneDirectCaller.callNumber('112');
                  },
                  child: FeatureIconButton(
                      image: Expanded(child: Image.asset("assets/image/accident.png"))
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    FlutterPhoneDirectCaller.callNumber('112');

                  },
                  child: FeatureIconButton(
                      image: Expanded(child: Image.asset("assets/image/kidnap.png"))
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    FlutterPhoneDirectCaller.callNumber('112');
                    },
                  child: FeatureIconButton(
                      image: Expanded(child: Image.asset("assets/image/harrasment.png"))
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    FlutterPhoneDirectCaller.callNumber('112');
                  },
                  child: FeatureIconButton(
                      image: Expanded(child: Image.asset("assets/image/tease.png"))
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    FlutterPhoneDirectCaller.callNumber('112');
                  },
                  child: FeatureIconButton(
                      image: Expanded(child: Image.asset("assets/image/robbery.png"))
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    FlutterPhoneDirectCaller.callNumber('112');
                  },
                  child: FeatureIconButton(
                      image: Expanded(child: Image.asset("assets/image/snatch.png"))
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    FlutterPhoneDirectCaller.callNumber('1098');
                  },
                  child: FeatureIconButton(
                      image: Expanded(child: Image.asset("assets/image/studentabuse.png"))
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    FlutterPhoneDirectCaller.callNumber('181');
                  },
                  child: FeatureIconButton(
                      image: Expanded(child: Image.asset("assets/image/domesticabuse.png"))
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    FlutterPhoneDirectCaller.callNumber('108');
                  },
                  child: FeatureIconButton(
                      image: Expanded(child: Image.asset("assets/image/ambulance.png"))
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class FeatureIconButton extends StatelessWidget {
  final Widget image;

  const FeatureIconButton({Key? key, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
          bottomRight: Radius.circular(32.0),
          bottomLeft: Radius.circular(32.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
        ],
      ),
    );
  }
}

void _sendSMS(String message, List<String> recipents) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}