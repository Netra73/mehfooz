/*import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

import 'NearByLocations.dart';
const skyblue = Color(0xff70d0f6);
const navyblue = Color(0xff3b3f81);
const pink = Color(0xffc7297e);

class HomeDashboard extends StatelessWidget{
  TextEditingController _numberCtrl = new TextEditingController();
  late Position currentPosition;
  var geoLoactor = Geolocator();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Container(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Banner(),
            SizedBox(height: 32),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Features',
                style: TextStyle(fontSize: 24, color: skyblue),
              ),
            ),
            SizedBox(height: 30),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: IconTheme(
                data: IconThemeData(size: 45, color: Colors.white),
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  crossAxisSpacing:6,
                  mainAxisSpacing: 6,
                  shrinkWrap: true,
                  children: [
                    GestureDetector(
                      onTap:() async{
                        FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);
                        // launch("tel:9353248401");
                        // launch(('tel://${9353248401}'));
                      },
                      child: FeatureIconButton(
                          icon: Icon(Icons.notifications), label: 'SOS'),
                    ),
                    FeatureIconButton(
                        icon: Icon(Icons.video_settings_sharp), label: 'Video Panic'),
                    GestureDetector(
                      onTap:() async{
                        launch('sms:+919742637042?body= hello Netra');

                      },

                      child: FeatureIconButton(
                          icon: Icon(Icons.mobile_screen_share_rounded), label: 'SMS Alert'),
                    ),
                    FeatureIconButton(
                        icon: Icon(Icons.location_on_outlined), label: 'Gps Tracking'),
                    FeatureIconButton(
                        icon: Icon(Icons.healing), label: 'Health Tip'),
                    GestureDetector(
                      /*onTap: ()async{
                        final url = 'https://www.google.com/maps/search/?api=1&query';
                        if (await canLaunch(url)) {
                        await launch(url);
                        } else {
                        throw 'Could not launch $url';
                        }
                      },*/
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>  NearByLocations(),
                        ));
                      },
                      child: FeatureIconButton(
                          icon: Icon(Icons.my_location), label: 'Near By location'),
                    ),
                    FeatureIconButton(
                        icon: Icon(Icons.traffic), label: 'Job Alert'),
                    FeatureIconButton(
                        icon: Icon(Icons.view_compact_outlined), label: 'Claim Complaint'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                clipBehavior: Clip.hardEdge,
                height: 156,
                decoration: BoxDecoration(
                  //  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child:Image.asset("assets/image/launchtwo.jpg"),
              ),
            )
          ],
        ),
      ),
    );
  }

}
class FeatureIconButton extends StatelessWidget {
  final Widget icon;
  final String label;

  const FeatureIconButton({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: skyblue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          bottomRight: Radius.circular(32.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}


class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: skyblue,
            radius: 24,
            child: GestureDetector(
              onTap: () {
              },
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                fillColor: skyblue,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(64),
                  borderSide: BorderSide(color: skyblue),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(64),
                  borderSide: BorderSide(color: skyblue),
                ),
                contentPadding: EdgeInsets.zero,
                isDense: true,
                prefixIcon: Icon(
                  Icons.search,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyCarousel(
      widgets: [
        CarouselItem(),
        CarouselItem(),
        CarouselItem(),
        CarouselItem(),
      ],
    );
  }
}

class CarouselItem extends StatelessWidget {
  const CarouselItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 156,
        decoration: BoxDecoration(
          //  color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child:Image.asset("assets/image/launchtwo.jpg"),
      ),
    );
  }
}

class MyCarousel extends StatefulWidget {
  final List<Widget> widgets;
  final double? height;

  const MyCarousel({
    Key? key,
    required this.widgets,
    this.height,
  }) : super(key: key);

  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  int _current = 0;
  _MyCarouselState();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CarouselSlider(
          items: widget.widgets,
          options: CarouselOptions(
            height: widget.height,
            viewportFraction: 0.92,
            aspectRatio: 16 / 6,
            enableInfiniteScroll: false,
            onPageChanged: (index, CarouselPageChangedReason reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        if (widget.widgets.length > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < widget.widgets.length; i++)
                Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == i ? Colors.black : Colors.black12,
                    ))
            ],
          )
        else
          SizedBox(height: 12)
      ],
    );
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }
}*/
/*constraints: BoxConstraints.expand(),
decoration: BoxDecoration(
image: DecorationImage(
image: AssetImage("assets/image/gpstracking.jpg"),
fit: BoxFit.cover)),
//   child: TextField(decoration: InputDecoration(fillColor: Colors.amber,filled: true),)
*/

import 'dart:convert';


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
const skyblue = Color(0xff70d0f6);
const navyblue = Color(0xff3b3f81);
const pink = Color(0xffc7297e);

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Privacy Policy"),
          backgroundColor: skyblue,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("We value privacy and understand the importance of keeping personal information safe. Our app privacy policy explains what information we gather from you, how we use it, and how it is protected. Our technical and organisational measures protect your information, and we never disclose it to anyone.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Using our Service means you consent to our collecting and using information regarding this policy. We will not use or share your information with anyone except as described in this Privacy Policy. This policy sets forth how we collect, process, and store your data. We may update this policy from time to time.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("What type of personal information do we collect when you visit our app?",
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information.We collect the information you provide us when you register on our app, including, * Full name. * E-mail address. * Phone number. * Gender. * Age.We will retain the information you provide to us and use it according to this privacy statement.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("How do we collect your information?",
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("As a user of the app, you consent to us collecting data and information from you whenever you register with us, make a purchase, or visit our app.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("How do we use your information?",
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("We may use your information to:",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("– Provide and improve our app.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("– Provide you with Safety and security features.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("– Make our app better for you.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("– Measure the success rate of our app.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("How can you access, correct, or delete your data?",
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Our app allows you to access and modify your data. Our customer service department can assist you with deleting your account. Our team will remove all of your information from our records upon request.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Security",
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Since we appreciate your trust in providing us with your Personal Information, we make every effort to ensure its protection is as secure as possible using commercially acceptable means.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Links to Other Sites",
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("You may find links to other websites of this portal. The links will likely lead to third-party products and services. When you click on those links, you will navigate to that website. Note that we are not in charge of these external websites. We, therefore, urge you to review the privacy policies of these external websites. Any third-party site or platform is independent, and we have no control over its content, privacy policies, or practices.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
            ],
          ),
        )
    );
  }

}

