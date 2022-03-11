
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NearByLocations extends StatefulWidget {
  @override
  _NearByLocationsState createState() => _NearByLocationsState();
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _NearByLocationsState extends State<NearByLocations> {
  final String loactions ="https://www.google.com/maps/search/?api=1&query=";
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: mainStyle.bgColor,
      appBar: AppBar(
        title: Text("Near By Locations"),
        backgroundColor: skyblue,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 40.0,left: 40.0,right: 40.0,bottom: 20.0),
            child: IconTheme(
              data: IconThemeData(size:80, color: Colors.white),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing:20,
                mainAxisSpacing: 20,
                shrinkWrap: true,
                children: [
                  GestureDetector(
                    onTap: ()async{
                      final url = loactions+'PoliceStation';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: FeatureIconButton(
                        image: Expanded(child: Image.asset("assets/image/policestation.png"))),
                    // icon: Icon(Icons.home), label: 'Police Station'),
                  ),
                  GestureDetector(
                    onTap: ()async{
                      final url = loactions+'Pharmacy';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: FeatureIconButton(
                        image: Expanded(child: Image.asset("assets/image/pharmacy.png"))),
                    // icon: Icon(Icons.home), label: 'Police Station'),
                  ),
                  GestureDetector(
                    onTap: ()async{
                      final url = loactions+'Clinic';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: FeatureIconButton(
                        image: Expanded(child: Image.asset("assets/image/clinic.png"))),
                    // icon: Icon(Icons.home), label: 'Police Station'),
                  ),
                  GestureDetector(
                    onTap: ()async{
                      final url = loactions+'BloodBank';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: FeatureIconButton(
                        image: Expanded(child: Image.asset("assets/image/bloodbank.png"))),
                    // icon: Icon(Icons.home), label: 'Police Station'),
                  ),
                  GestureDetector(
                    onTap: ()async{
                      final url = loactions+'Hospital';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: FeatureIconButton(
                        image: Expanded(child: Image.asset("assets/image/hospital.png"))),
                    // icon: Icon(Icons.home), label: 'Police Station'),
                  ),
                  GestureDetector(
                    onTap: ()async{
                      final url = loactions+'Mall';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: FeatureIconButton(
                        image: Expanded(child: Image.asset("assets/image/malls.png"))),
                    // icon: Icon(Icons.home), label: 'Police Station'),
                  ),
                  GestureDetector(
                    onTap: ()async{
                      final url = loactions+'Bank';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: FeatureIconButton(
                        image: Expanded(child: Image.asset("assets/image/bank.png"))),
                    // icon: Icon(Icons.home), label: 'Police Station'),
                  ),
                  GestureDetector(
                    onTap: ()async{
                      final url = loactions+'ATM';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: FeatureIconButton(
                        image: Expanded(child: Image.asset("assets/image/atm.png"))),
                    // icon: Icon(Icons.home), label: 'Police Station'),
                  ),
                  GestureDetector(
                    onTap: ()async{
                      final url = loactions+'Beautyparlour';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: FeatureIconButton(
                        image: Expanded(child: Image.asset("assets/image/beauty.png"))),
                    // icon: Icon(Icons.home), label: 'Police Station'),
                  ),
                  GestureDetector(
                    onTap: ()async{
                      final url = loactions+'Gym';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: FeatureIconButton(
                        image: Expanded(child: Image.asset("assets/image/gym.png"))),
                    // icon: Icon(Icons.home), label: 'Police Station'),
                  ),
                  GestureDetector(
                    onTap: ()async{
                      final url = 'https://www.google.com/maps/search/?api=1&query=Restaurant';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: FeatureIconButton(
                        image: Expanded(child: Image.asset("assets/image/restaurant.png"))),
                    // icon: Icon(Icons.home), label: 'Police Station'),
                  ),
                  /*GestureDetector(
                   onTap: ()async{
                     //final url = 'https://www.google.com/maps/search/?api=1&query=Hospital';
                     final url = API_URL+'Hospital';
                     if (await canLaunch(url)) {
                       await launch(url);
                     } else {
                       throw 'Could not launch $url';
                     }
                   },
                   child: FeatureIconButton(
                       icon: Icon(Icons.local_hospital), label: 'Hospital'),
                 ),*/
                  /*GestureDetector(
                   onTap: ()async{
                  //   final url = 'https://www.google.com/maps/search/?api=1&query=ATM';
                     final url = API_URL+'ATM';

                     if (await canLaunch(url)) {
                       await launch(url);
                     } else {
                       throw 'Could not launch $url';
                     }
                   },
                   child: FeatureIconButton(
                       icon: Icon(Icons.atm_sharp), label: 'ATM'),
                 ),*/
                  /*GestureDetector(
                   onTap: ()async{
                     //final url = 'https://www.google.com/maps/search/?api=1&query=Bank';
                     final url = API_URL+'Bank';
                     if (await canLaunch(url)) {
                       await launch(url);
                     } else {
                       throw 'Could not launch $url';
                     }
                   },
                   child: FeatureIconButton(
                       icon: Icon(Icons.money_rounded), label: 'Bank'),
                 ),*/
                  /*  GestureDetector(
                   onTap: ()async{
                    // final url = 'https://www.google.com/maps/search/?api=1&query=Pharmacy';
                     final url = API_URL+'Pharmacy';
                     if (await canLaunch(url)) {
                       await launch(url);
                     } else {
                       throw 'Could not launch $url';
                     }
                   },
                   child: FeatureIconButton(
                       icon: Icon(Icons.healing), label: 'Pharmacy'),
                 ),*/
                  /* GestureDetector(
                   onTap: ()async{
                     final url = 'https://www.google.com/maps/search/?api=1&query=Restaurant';
                     if (await canLaunch(url)) {
                       await launch(url);
                     } else {
                       throw 'Could not launch $url';
                     }
                   },
                   child: FeatureIconButton(
                       icon: Icon(Icons.fastfood), label: 'Restaurant'),
                 ),*/
                  /*   GestureDetector(
                   onTap: ()async{
                     final url = 'https://www.google.com/maps/search/?api=1&query=Restaurant';
                     if (await canLaunch(url)) {
                       await launch(url);
                     } else {
                       throw 'Could not launch $url';
                     }
                   },
                   child: FeatureIconButton(
                       icon: Icon(Icons.fastfood), label: 'Beauty'),
                 ),*/
                  /* GestureDetector(
                   onTap: ()async{
                     final url = 'https://www.google.com/maps/search/?api=1&query=Restaurant';
                     if (await canLaunch(url)) {
                       await launch(url);
                     } else {
                       throw 'Could not launch $url';
                     }
                   },
                   child: FeatureIconButton(
                       icon: Icon(Icons.fastfood), label: 'malls'),
                 ),*/
                  /*GestureDetector(
                   onTap: ()async{
                     final url = 'https://www.google.com/maps/search/?api=1&query=Restaurant';
                     if (await canLaunch(url)) {
                       await launch(url);
                     } else {
                       throw 'Could not launch $url';
                     }
                   },
                   child: FeatureIconButton(
                       icon: Icon(Icons.fastfood), label: 'Clinic'),
                 ),*/
                  /* GestureDetector(
                   onTap: ()async{
                     final url = 'https://www.google.com/maps/search/?api=1&query=Restaurant';
                     if (await canLaunch(url)) {
                       await launch(url);
                     } else {
                       throw 'Could not launch $url';
                     }
                   },
                   child: FeatureIconButton(
                       icon: Icon(Icons.fastfood), label: 'Blood Bank'),
                 ),*/
                  /*  GestureDetector(
                   onTap: ()async{
                     final url = 'https://www.google.com/maps/search/?api=1&query=Restaurant';
                     if (await canLaunch(url)) {
                       await launch(url);
                     } else {
                       throw 'Could not launch $url';
                     }
                   },
                   child: FeatureIconButton(
                       icon: Icon(Icons.fastfood), label: 'Gym'),
                 ),*/
                ],
              ),
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
        color: skyblue,
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
