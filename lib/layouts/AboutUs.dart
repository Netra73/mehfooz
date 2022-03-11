import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
const skyblue = Color(0xff70d0f6);
const navyblue = Color(0xff3b3f81);
const pink = Color(0xffc7297e);

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("About Us"),
          backgroundColor: skyblue,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 10.0,),
              Center(child: Text("Welcome to Mehfooz",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Our tagline reads “Jiyo Befikar“ which means every woman has the right to live without fear.“The Mehfooz” app is software that helps women's safety. With it, you can know the safety in your area for the women. It is safe, reliable, and can be easily accessible by women. We want to empower women by building a supportive network that will give them the power to speak out. Mehfooz focuses on women's safety.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("We developed the application with more than 15 years of sales and marketing experience. You will also find all the information you need within reach, making it easy to use.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Women who are concerned about safety and feel vulnerable when out on the town should take advantage of this app. Apps like this one help them know where safe areas are and what to do in an emergency. “The Mehfooz” app provides women safety. Moreover, it teaches you what to do in an emergency and how to respond in case of a crisis. The application is especially suitable for women who sense any danger because it provides the following functions: Safe Area Location, What to do when something happens, Response to an emergency, How to contact the police, How to associate friends or family, How to consociate the hospital, etc. The application is also handy in situations where you feel uncomfortable when you go out.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("The Mehfooz app is especially suitable for women who feel vulnerable & want to protect themselves. Women's safety is the focal point of this application. Its top priority is safety. The Mehfooz application provides the following features:",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("You can get in touch with local police or the police commissioner with the SOS feature at your fingertips.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Using Video Panic, you can record video clips quickly in an emergency and share them with family and authorities.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("We send an SMS Alert notification to the default numbers of the woman's family, friends, and acquaintances. The application has two modes: one is automatic, you can install it on your phone. The other is to set it manually as a call-back function.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Live tracking features give you real-time access to your current location, car number, and destination address.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Pregnant women can get expert advice on health issues by visiting the Health Tip section.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("The nearby location is a feature that helps you find the nearest police station and hospital. The service is a big help if you are in the middle of nowhere. Your search will be less time-consuming. This app directs you directly to the location you need. Default settings will take care of the location.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Freelancers feature provide opportunities for the women community to find a job for themselves. It's an effective way to search for jobs online. You know some people are willing to pay freelancers for completing small jobs. You can work and also get paid.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Claim Complaint when there is an incident of robbery, sexual harassment in public places, and even when you want to report a crime, you can directly make a report in the application. The authorities will track your location and reach you as soon as possible.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Additionally, you can use this app to purchase goods and services and to read the news feed. To use the application, you have to register, and it is a paid application. Furthermore, this app can also be a great way to find freelancers near you if you are looking for freelancers. There are various kinds of services and jobs available. All these things will be helpful for you to find something you can do.You can also find the app in the PlayStore. Furthermore, we anticipate that women of a broad range will find the app helpful. We wish you a happy Mehfooz experience. “The Mehfooz” app is a great women’s safety app. Don’t worry about any situation because Jiyo Befikar, when Mehfooz is here.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
            ],
          ),
        )
    );
  }

}

