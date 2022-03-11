import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:womensafety/api/PostLogin.dart';
import 'package:womensafety/functions/UserData.dart';
import 'package:womensafety/functions/validations.dart';
import 'package:womensafety/layouts/SignUp.dart';
import 'package:womensafety/modules/LoginForm.dart';
import 'HomePage.dart';

const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class LoginPage extends StatefulWidget {
  @override
  _Login createState() => _Login();

}
class _Login extends State<LoginPage> {
  final _loginForm  = GlobalKey<FormState>();
  bool isError = false;
  String username="";
  String password="";
  bool wrngemailError = false;
  bool wrngpaswdError = false;
  String errorMsg ="";
  bool autovalidate = false;
  bool isValid = false;
  LoginForm loginForm = LoginForm();
  bool login = false;
  String id ="";

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
  _checkValidate() {
    isValid = _loginForm.currentState!.validate();
    if (isValid) {
      _loginForm.currentState!.save();
      _login();
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70.0),
              child: Container(
                height: 200,
                width: 230,
                child: Image(
                  image: AssetImage("assets/image/mehfooztm.png") ,
                ),
              ),
            ),
            Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: _loginForm,
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        validator: (value){
                          return emailRequired(value!, "Enter valid email id");
                        },
                        onSaved: (value){
                          loginForm.username = value!;
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.red,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "Email-Id ",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                        onChanged:(val){
                          setState(() {
                            wrngemailError=false;
                          });
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    if(wrngemailError)
                      Padding(
                        padding: EdgeInsets.only(right:250.0),
                        child: Text(errorMsg,style: TextStyle(fontSize: 16,color: Colors.red),),
                      ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Password';
                          }
                          else{
                            return null;
                          }
                        },
                        onSaved: (value){
                          loginForm.password=value!;
                        },

                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: 'Password',
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                        onChanged:(val){
                          setState(() {
                            wrngpaswdError=false;
                          });
                        },
                      ),
                    ),
                    if(wrngpaswdError)
                      Padding(
                        padding: EdgeInsets.only(right:220.0),
                        child:Text(errorMsg,style: TextStyle(fontSize:16,color: Colors.red),),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    /*Padding(
                        padding: EdgeInsets.only(left: 200.0),
                        child: Text('Forgot password?',style: TextStyle(color:pink,fontSize: 18),
                        )),*/

                    SizedBox(
                      height: 40,
                    ),
                    Container(
                        width: 180.0,
                        height: 50.0,
                        child: ElevatedButton(
                          child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
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
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('New User? ',style: TextStyle(fontSize:18),),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>  SignUp(),
                            ));
                          },
                          child: Text('Create Account',style: TextStyle(color:pink,fontSize: 18,decoration: TextDecoration.underline,
                          ),),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  _login() {
    _showLoading();
    PostLogin(loginForm).then((value){
      var response = value;
      Navigator.pop(context);
      if(response.statusCode == 200){
        setState(() {
          var data = response.data['data'];
          String id = data['id'];
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
            print(errorMsg);
            if(errorMsg=='Wrong email.'){
              wrngemailError= true;
            }else{
              wrngpaswdError =true;
            }
          });
        }
      }
    });
  }
}
