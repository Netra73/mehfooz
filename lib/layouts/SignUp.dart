import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:womensafety/api/PostSignUp.dart';
import 'package:womensafety/functions/UserData.dart';
import 'package:womensafety/functions/validations.dart';
import 'package:womensafety/layouts/HomePage.dart';
import 'package:womensafety/layouts/LoginPage.dart';
import 'package:womensafety/modules/SignUpForm.dart';
import 'package:womensafety/modules/UserForm.dart';
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class SignUp extends StatefulWidget {
  @override
  _SignUp createState() => _SignUp();
}
class _SignUp extends State<SignUp> {
  final _signUpForm  = GlobalKey<FormState>();
  bool isError = false;
  String errorMsg ="";
  bool autovalidate = false;
  bool isValid = false;
  bool mblError= false;
  bool emailError=false;
  bool signUpError = false;
  SignUpForm signUpForm = SignUpForm();
  UserForm userForm = UserForm();
  String uid ="";

  _checkValidate() {
    isValid = _signUpForm.currentState!.validate();
    if (isValid) {
      _signUpForm.currentState!.save();
      _signUp();
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
        backgroundColor: pink,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              Form(
                autovalidateMode: AutovalidateMode.disabled,
                key: _signUpForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        validator: (value){
                          if (value==null||value.isEmpty) {
                            return 'Enter your first name';
                          }
                          else{
                            return null;
                          }
                        },
                        onSaved: (value){
                          userForm.fname = value;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "First Name",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        validator: (value){
                          if (value==null||value.isEmpty) {
                            return 'Enter your second name';
                          }
                          else{
                            return null;
                          }
                        },
                        onSaved: (value){
                          userForm.lname = value;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "Second Name",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        validator: (value){
                          return mobileRequired(value!, "Enter valid mobile number");
                        },
                        onSaved: (value){
                          userForm.mobile = value!;
                        },
                        onChanged:(val){
                          setState(() {
                            mblError=false;
                          });
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.red,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "Mobile Number",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    if(mblError)
                      Padding(
                        padding: EdgeInsets.only(right:80.0,left: 20.0),
                        child: Text(errorMsg,style: TextStyle(fontSize: 16,color: Colors.red),),
                      ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        validator: (value){
                          return emailRequired(value!, "Enter valid email id");
                        },
                        onSaved: (value){
                          userForm.email = value;
                        },
                        onChanged:(val){
                          setState(() {
                            emailError=false;
                          });
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.red,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "EmailId ",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                        keyboardType: TextInputType.emailAddress,

                      ),
                    ),
                    if(emailError)
                      Padding(
                        padding: EdgeInsets.only(right:80.0,left: 20.0),
                        child: Text(errorMsg,style: TextStyle(fontSize: 16,color: Colors.red),),
                      ),
                    Container(
                      child:Padding(
                        padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Password';
                            }
                            else{
                              return null;
                            }
                          },
                          obscureText: true,
                          onSaved: (value){
                            userForm.password=value;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                              hintText: 'Password',
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                      child: Center(
                        child: Text("Enter 5 contact numbers to get sms alert",style: TextStyle(fontSize: 18,color:pink,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        validator: (value){
                          return mobileRequired(value!, "Enter valid mobile number");
                        },
                        onSaved: (value){
                          userForm.cp1 = value!;
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.red,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "Contact person 1",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        validator: (value){
                          return mobileRequired(value!, "Enter valid mobile number");
                        },
                        onSaved: (value){
                          userForm.cp2 = value!;
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.red,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "Contact person 2",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        validator: (value){
                          return mobileRequired(value!, "Enter valid mobile number");
                        },
                        onSaved: (value){
                          userForm.cp3 = value!;
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.red,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "Contact person 3",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        validator: (value){
                          return mobileRequired(value!, "Enter valid mobile number");
                        },
                        onSaved: (value){
                          userForm.cp4 = value!;
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.red,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "Contact person 4",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        validator: (value){
                          return mobileRequired(value!, "Enter valid mobile number");
                        },
                        onSaved: (value){
                          userForm.cp5 = value!;
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.red,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "Contact person 5",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: Container(
                          width: 180.0,
                          height: 50.0,
                          child: ElevatedButton(
                            child: Text('Create Account',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              primary: pink,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              _checkValidate();
                            },
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left:40.0),
                          child: Text("Already have an account ? ",style: TextStyle(fontSize: 18),),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                              //  LoginPage(user)), (Route<dynamic> route) => false);
                              LoginPage()), (Route<dynamic> route) => false);
                            });
                          },
                          child: Text("Login",style: TextStyle(fontSize: 18,color:pink,decoration:TextDecoration.underline),),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _signUp(){
    _showLoading();
    PostSignUp(userForm).then((value){
      var response = value;
      Navigator.pop(context);
      if(response.statusCode == 200){
        setState(() {
          String id = response.data['id'];
          var data = response.data['data'];
          setData("USER",id ).then((value){
            setData("USER_DATA", jsonEncode(data)).then((value){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  HomePage()), (Route<dynamic> route) => false);
            });
          });
        });
      }
    }).catchError((error){
      if(error is DioError){
        Navigator.pop(context);
        if(error.response?.statusCode == 400){
          setState(() {
            errorMsg = error.response!.data['message'];
            if(errorMsg== 'The given Mobile number already exists.'){
              mblError= true;
            }else{
              emailError =true;
            }
          });
        }
      }
    });
  }
}
