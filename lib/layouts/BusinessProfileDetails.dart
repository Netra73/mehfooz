import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:womensafety/api/getBusinessMoreInfo.dart';

class  BusinessProfileDetails extends StatefulWidget {
  final String  id;
  const BusinessProfileDetails({Key? key, required this.id,});

  @override
  _BusinessProfileDetailsState createState() => _BusinessProfileDetailsState(id);
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _BusinessProfileDetailsState extends State<BusinessProfileDetails> {
  final String loactions ="https://www.google.com/maps/search/?api=1&query=";
  String business_name="";
  String contact_number="";
  String email="";
  String website="";
  String location="";
  String description="";
  String image="";
  String id;

  _BusinessProfileDetailsState(this.id);

  @override
  void initState() {
    super.initState();
    _getBusinessMoreInfo();
  }
  _launchURL() async {
    const url = 'https://graceinfotech.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(business_name),
        backgroundColor: skyblue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Banner()
          ),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () async{
                      FlutterPhoneDirectCaller.callNumber(contact_number);
                    },
                    child: CircleAvatar(
                        child:Icon(Icons.call)
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text("Call",style: TextStyle(fontSize: 18),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: ()async{
                      final url = loactions+location;
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: CircleAvatar(
                        child:Icon(Icons.location_on_outlined)
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text("Map",style: TextStyle(fontSize: 18),)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap:(){
                      _launchURL();
                    } ,
                    child: CircleAvatar(
                        child:Icon(Icons.menu_book_outlined)
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text("Website",style: TextStyle(fontSize: 18),)
                ],
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          Row(
            children: const [
              SizedBox(width: 10.0,),
              Text("Description",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),)
            ],
          ),
          SizedBox(height: 10.0,),
          Padding(
            padding: EdgeInsets.only(left: 10.0,right: 10.0),
            child: Text(description,
              style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400),),
          ),
        ],
      ),
    );
  }


  _getBusinessMoreInfo(){
    //_showLoading();
    getBusinessMoreInfo(id).then((value){
      var response = value;
      if(response.statusCode == 200){
        setState(() {
          var data = response.data['data'];
          String id = data["id"];
          business_name = data["business_name"];
          contact_number = data["contact_number"];
          email = data["email"];
          website = data["website"];
          location = data["location"];
          description = data["description"];
          image = data["image"];
        });
      }
    }).catchError((error){
      if(error is DioError){
        Navigator.pop(context);
      }
    });
  }

}

class Banner extends StatelessWidget {
  const Banner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCarousel(
      widgets: const [
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
      padding: EdgeInsets.symmetric(horizontal: 1),
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
                    )
                )
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
}