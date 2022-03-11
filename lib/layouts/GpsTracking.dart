import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:womensafety/api/getContacts.dart';
import 'package:womensafety/functions/UserData.dart';
const skyblue = Color(0xff70d0f6);
const navyblue = Color(0xff3b3f81);
const pink = Color(0xffc7297e);
List<String > newValue = [];

class GpsTracking extends StatefulWidget {
  @override
  _GpsTrackingState createState() => _GpsTrackingState();
}

class _GpsTrackingState extends State<GpsTracking> {
  TextEditingController _numberCtrl = new TextEditingController();
  final String API_URL ="https://www.google.com/maps/search/?api=1&query=";
  bool isValid = false;
  bool autovalidate = false;
  final _GpsForm  = GlobalKey<FormState>();
  String currentLocation="";
  String destination="";
  String vehicleNumber="";
  bool containsData = false;
  bool noData = false;
  String id ="";

  @override
  void initState() {
    super.initState();
    _getUserDetails();
  }

  void _sendSMS(String message, List<String> newValue) async {
    String _result = await sendSMS(message: message, recipients: newValue)
        .catchError((onError) {
    });
    print(_result);
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
        getContacts(id).then((value) {
          Map response = jsonDecode(value);
          if (response["status"] == 200) {
            if(response.containsKey("data")){
              setState(() {
                containsData = true;
                var data = response['data'];
                int i=1;
                for(var details in data){
                  newValue.add(details['cp$i']);
                  i++;
                }
              });
            }else{
              setState(() {
                noData= true;
              });
            }
          }
        });
      });
    });
  }

  _checkValidate() {
    isValid = _GpsForm.currentState!.validate();
    if (isValid) {
      _GpsForm.currentState!.save();
      final url = API_URL+currentLocation;
      final url2 = API_URL+destination;
      final vN = vehicleNumber;
      _sendSMS('Current Location: $url. Destination: $url2. Vehicle Number: $vN', newValue);
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GPS Tracking"),
        backgroundColor: skyblue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _GpsForm,
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Current Location';
                            }
                            else{
                              return null;
                            }
                          },
                          onSaved: (value){
                            currentLocation = value!;
                          },
                          onChanged:(val){
                            setState(() {
                            });
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.red,
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                              hintText: "Current Location ",
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Destination';
                            }
                            else{
                              return null;
                            }
                          },
                          onSaved: (value){
                            destination =value!;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                              hintText: 'Destination',
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                          ),
                          onChanged:(val){
                            setState(() {
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Vehicle Number';
                            }
                            else{
                              return null;
                            }
                          },
                          onSaved: (value){
                            vehicleNumber =value!;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                              hintText: 'Vehicle Number',
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                          ),
                          onChanged:(val){
                            setState(() {

                            });
                          },
                        ),
                      ),
                      SizedBox(height: 40,),
                      Container(
                          width: 180.0,
                          height: 50.0,
                          child: ElevatedButton(
                            child: Text('Submit',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              primary: skyblue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              _checkValidate();
                            },
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

