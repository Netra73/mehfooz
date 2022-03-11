import 'dart:convert';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

import 'package:video_player/video_player.dart';
import 'package:womensafety/api/getAddsBanner.dart';
import 'package:womensafety/api/getContacts.dart';
import 'package:womensafety/api/getSliderimage.dart';
import 'package:womensafety/functions/UserData.dart';
import 'package:womensafety/layouts/ClaimComplaint.dart';
import 'package:womensafety/layouts/DoctorsTalk.dart';
import 'package:womensafety/layouts/Events.dart';
import 'package:womensafety/layouts/GpsTracking.dart';
import 'package:womensafety/layouts/HealthTip.dart';
import 'package:womensafety/layouts/JobAlert.dart';
import 'package:womensafety/layouts/NearByLocations.dart';
import 'package:womensafety/layouts/PromoteYourBusiness.dart';
import 'package:womensafety/layouts/ShareYourStories.dart';
import 'package:womensafety/modules/AddsBanner.dart';
import 'package:womensafety/modules/Contacts.dart';

const skyblue = Color(0xff70d0f6);
const navyblue = Color(0xff3b3f81);
const pink = Color(0xffc7297e);

class HomeDashboard extends StatefulWidget {
  @override
  _HomeDashboardState createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {

  TextEditingController _numberCtrl = new TextEditingController();
  List<AddsBanner>sList = [];
  late File videoFile;
  late VideoPlayerController videoPlayerController;
  final ImagePicker _picker = ImagePicker();
  String id="";
  String cp1="";
  bool containsData = false;
  bool noData = false;
  List<Contacts>cList = [];
  var cData;
  List<String> newValue=[];
  final String API_URL ="https://www.google.com/maps/search/?api=1&query=";
  @override
  void initState() {
    super.initState();
    _getUserDetails();
  }
  _record()async{
    var theVid = await _picker.pickVideo(
        source: ImageSource.camera);
    if(theVid!=null){
      setState(() {
        videoFile = File(theVid.path) ;
        print(videoFile);
        GallerySaver.saveVideo(videoFile.path);
      });
    }
  }
  String message = "HI, THIS IS AN EMERGENCY MESSAGE, I am in Danger, Please Help & Save Me. Mehfooz is concerned about you.Thank you.";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Container(
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: FutureBuilder<List>(
                  future: getSliderImage(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List simage = snapshot.data!;
                      List<Widget> imageSliders = simage
                          .map((e) => Container(
                           clipBehavior: Clip.hardEdge,
                           height: 156,
                           decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(40),
                            ),
                           child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Image(
                            image: NetworkImage(e),
                          ),
                        ),
                      )
                      )
                          .toList();
                      return CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 0.90,
                          aspectRatio: 16 / 6,
                          enableInfiniteScroll: false,
                        ),
                        items: imageSliders,
                      );
                    }
                    return SpinKitCircle(
                      color: skyblue,
                      size: 50,
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Features',
                  style: TextStyle(fontSize: 24, color: skyblue),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: IconTheme(
                  data: IconThemeData(size: 35, color: Colors.white),
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    crossAxisSpacing:6,
                    mainAxisSpacing: 6,
                    shrinkWrap: true,
                    children: [
                      GestureDetector(
                        onTap:() async{
                          FlutterPhoneDirectCaller.callNumber('100');
                        },
                        child: FeatureIconButton(
                            image: Expanded(
                                child: Image.asset("assets/image/sos.png",)
                            )
                        ),
                      ),
                      GestureDetector(
                        onTap:()=>{
                          _record(),
                        },
                        child: FeatureIconButton(
                            image: Expanded(
                                child: Image.asset("assets/image/videopanic.png",)
                            )
                        ),
                      ),
                      GestureDetector(
                        onTap:() {
                          _sendSMS(message,newValue);
                        },
                        child: FeatureIconButton(
                            image: Expanded(
                                child: Image.asset("assets/image/smsalert.png",)
                            )
                        ),
                      ),
                      GestureDetector(
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>  GpsTracking(),
                          ));
                        },
                        child: FeatureIconButton(
                            image: Expanded(
                                child: Image.asset("assets/image/travelinfo.png",)
                            )
                        ),
                      ),
                      GestureDetector(
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>  HealthTip(),
                          ));
                        },
                        child: FeatureIconButton(
                            image: Expanded(
                                child: Image.asset("assets/image/healthtip.png",)
                            )
                        ),
                      ),
                      GestureDetector(
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>  NearByLocations(),
                          ));
                        },
                        child: FeatureIconButton(
                            image: Expanded(
                                child: Image.asset("assets/image/nearbylocations.png",)
                            )
                        ),
                      ),
                      GestureDetector(
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>  JobAlert(),
                          ));
                        },
                        child: FeatureIconButton(
                            image: Expanded(
                                child: Image.asset("assets/image/freelancer.png",)
                            )
                        ),
                      ),
                      GestureDetector(
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>  ClaimComplaint(),
                          ));
                        },
                        child: FeatureIconButton(
                            image: Expanded(
                                child: Image.asset("assets/image/claimcomplaint.png",)
                            )
                        ),
                      ),
                      GestureDetector(
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>  DoctorsTalk(),
                          ));
                        },
                        child: FeatureIconButton(
                            image: Expanded(
                                child: Image.asset("assets/image/doctorstalk.png",)
                            )
                        ),
                      ),
                      GestureDetector(
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>  Events(),
                          ));
                        },
                        child: FeatureIconButton(
                            image: Expanded(
                                child: Image.asset("assets/image/events.png",)
                            )
                        ),
                      ),
                      GestureDetector(
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>  ShareYourStories(),
                          ));
                        },
                        child: FeatureIconButton(
                            image: Expanded(
                                child: Image.asset("assets/image/sharestory.png",)
                            )
                        ),
                      ),
                      GestureDetector(
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>  PromoteYourBusiness(),
                          ));
                        },
                        child: FeatureIconButton(
                            image: Expanded(
                                child: Image.asset("assets/image/promotebusiness.png",)
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: FutureBuilder<List>(
                  future: getAddsBanner(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List simage = snapshot.data!;
                      List<Widget> imageSliders = simage
                          .map((e) => Container(
                           clipBehavior: Clip.hardEdge,
                           height: 156,
                            decoration: BoxDecoration(
                          //  color: Colors.red,
                          borderRadius: BorderRadius.circular(40),
                        ),
                             child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                               child: Image(
                              image: NetworkImage(e),
                          ),
                        ),
                      ))
                          .toList();
                      return CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 0.90,
                          aspectRatio: 16 / 6,
                          enableInfiniteScroll: false,
                        ),
                        items: imageSliders,
                      );
                    }
                    return SpinKitCircle(
                      color: skyblue,
                      size: 50,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _getUserDetails(){
    checkData("USER").then((value) {
      getData("USER_DATA").then((value) {
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
}
class FeatureIconButton extends StatelessWidget {
  final Widget image;
  const FeatureIconButton({Key? key, required this.image})
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
          image,
        ],
      ),
    );
  }
}
class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

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
void _sendSMS(String message, List<String> newValue) async {
  String _result = await sendSMS(message: message, recipients: newValue)
      .catchError((onError) {
  });
  print(_result);
}