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

class TermsAndConditions extends StatefulWidget {
  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Terms And Conditions"),
          backgroundColor: skyblue,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Welcome to Mehfooz, a women's safety app. A woman can sign up for this app by registering once. In addition to the registration fees, you also receive additional benefits if you choose the paid service (Premium Service). In this app, a woman can ask questions, find help, and report incidents. It is free to use Mehfooz for women's safety, but we charge for services. You can take advantage of our services by paying Rs 129. After you complete the payment process and pay the fees, you will have the authority to access all features.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("The application even offers freelancers the possibility to register themselves to tender their services to the users. With this app, freelancers can register themselves and earn money by promoting their services. The app gives freelancers the ability to make money according to the number of actions they perform. The registration fee for freelancers is Rs 499. Women can use this app to earn extra income by offering their services to other users. No matter where they live, women can use this app.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("As soon as you download or use the app, these terms will apply automatically to you - you should read them carefully before you use them. Our trademarks and our app are proprietary, and you may not copy or modify them in any way. You should not extract the source code of the app, translate it or alter it in any way. Mehfooz still owns the app itself in addition to all trademarks, copyrights, database rights, and other intellectual property rights of it.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Mehfooz is committed to ensuring that the app is as utile and efficient as possible. We reserve the right to alter the app anytime and for any reason or to charge for its services. In no case will we charge you for the app or its services unless we explicitly disclose in detail what you're paying.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("At some point, we may wish to update the app. If you want to use the app, you'll have to download updates if you intend to keep it up-to-date on both iOS & Android. Operating system requirements may change for both platforms (plus any other systems we decide to make available in the future) so, you'll have to download updates regularly.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Changes to This Terms and Conditions",
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("We may update our Terms and Conditions from time to time. For this reason, we encourage you to check this page periodically for changes. We will notify you of any changes by posting the new Terms and Conditions on this page.These terms and conditions are viable as of 2022-01-02",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("Contact Us!",
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Text("If you have any questions or suggestions about our Terms and Conditions, do not hesitate to contact us at 9886655534.",
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 10.0,),
            ],
          ),
        )
    );
  }

}

