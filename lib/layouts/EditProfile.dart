import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:womensafety/api/getUser.dart';
import 'package:womensafety/functions/UserData.dart';
import 'package:womensafety/functions/validations.dart';
import 'package:womensafety/modules/User.dart';
import 'package:womensafety/modules/UserForm.dart';

const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);


class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();

}

class _EditProfileState extends State<EditProfile> {
  User user = User();
  UserForm userForm= UserForm();
  final _signupForm  = GlobalKey<FormState>();
  final controller = TextEditingController();
  final _editprofileform  = GlobalKey<FormState>();
  bool autovalidate = false;
  String errorMsg ="";
  String name="";
  String mobile="";
  String email="";
  String id="";

  _checkValidate() {
    final isValid = _editprofileform.currentState!.validate();
    if (isValid) {
      _editprofileform.currentState!.save();
      //_EditProfile();

    } else {
      setState(() {
        autovalidate = true;
      });
    }

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
  void initState() {
    _getUser();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor:skyblue,
      ),
      body:  SingleChildScrollView(
        child: FutureBuilder(
          builder: (context,snapshot) {
            return Container(
              padding: EdgeInsets.all(20.0),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _editprofileform,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 2.0,left: 25.0,right: 20.0),
                      child: Text("Name :",style: TextStyle(color:pink),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        controller: TextEditingController(text: user.name),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          else{
                            return null;
                          }
                        },
                        onSaved: (value){
                          user.name = value;
                          //  userForm.name = value;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "Name",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0,left: 25.0,right: 20.0),
                      child: Text("Mobile Number :",style: TextStyle(color:pink),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        controller: TextEditingController(text: user.mobile),
                        validator: (value){
                          return mobileRequired(value!, "Enter valid mobile number");
                        },
                        onSaved: (value){
                          user.mobile = value;
                          // userForm.mobile = value;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "Mobile Number",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))

                        ),
                        keyboardType: TextInputType.phone,
                      ),

                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 10.0,left: 25.0,right: 20.0),
                      child: Text("Email Id :",style: TextStyle(color:pink),),
                    ),

                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0),
                        child: TextFormField(
                          controller: TextEditingController(text: user.email),
                          validator: (value){
                            return emailRequired(value!, "Enter valid email id");
                          },
                          onSaved: (value){
                            user.email = value;
                            // userForm.email = value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                              hintText: "Email Id",
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))

                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Container(
                        width: 180.0,
                        height: 50.0,
                        child: ElevatedButton(
                          child: Text('Update',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 18),),
                          style: ElevatedButton.styleFrom(
                            primary: skyblue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          /* onPressed: () {
                            _checkValidate();
                          },*/
                          onPressed: (){
                            if(_editprofileform.currentState!.validate()){
                              _editprofileform.currentState!.save();
                              _checkValidate();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  _getUser() {
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
              user.name =data["first_name"];
              user.email =data["email"];
              user.mobile =data["phone"];
            });
          }
        });
      });

    });

  }
/* _EditProfile() {
    _showLoading();
    UserUpdate(userForm,token).then((value){
      Navigator.pop(context);
      var response = jsonDecode(value);
      print (response);
      if(response['status'] == 409){
        setState(() {

        });
      }
      if(response['status']==200){
        var data = response['data'];
        Navigator.pop(context);
      }
    });

  }*/

}
