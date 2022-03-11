import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:path/path.dart' as Path ;
import 'package:womensafety/api/getUser.dart';
import 'package:womensafety/functions/UserData.dart';
import 'package:womensafety/layouts/AboutUs.dart';
import 'package:womensafety/layouts/Freelancer.dart';
import 'package:womensafety/layouts/GetStarted.dart';
import 'package:womensafety/layouts/PrivacyPolicy.dart';
import 'package:womensafety/layouts/TermsAndConditions.dart';
import 'AddContacts.dart';
import 'ECommerce.dart';
import 'HomeDashboard.dart';
import 'LiveChat.dart';
import 'NewFeeds.dart';
import 'Profile.dart';


const skyblue = Color(0xff70d0f6);
const navyblue = Color(0xff3b3f81);
const pink = Color(0xffc7297e);


class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  TextEditingController _numberCtrl = new TextEditingController();
  /*
  File picturePath =File();
*/
  // store the picturePath in SharedPreference (key='picture')
  // check shar

  final ImagePicker _picker = ImagePicker();
  // late XFile _photo ;
  bool image =false;
  bool login = false;
  int selectedIndext =0;
  String uname="";
  String uemail="";
  String id ="";
  File? picture;
  void setBottomBarIndex(int index){
    setState(() {
      selectedIndext = index;
    });
  }
  Future pickImage() async {
    final image = await  ImagePicker().pickImage(source: ImageSource.gallery);
    if(image== null)return;
    final imagePermannet = await saveImagePermanently(image.path);
    setState(() {
      this.picture = imagePermannet;

    });
  }
  Future<File> saveImagePermanently(String imagePath) async{
    final directory = await getApplicationDocumentsDirectory();
    final name = Path.basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  @override
  void initState() {
    super.initState();
    _getUserDetails();
  }
  _logout() {
    removeData("USER").then((value) {
      removeData("USER_DATA").then((value) {
        setState(() {
          login = false;
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              GetStarted()), (Route<dynamic> route) => false);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            InkWell(
              child: UserAccountsDrawerHeader(
                accountName:  Text(uname,style: TextStyle(color: Colors.white),) ,
                accountEmail: Text(uemail,style: TextStyle(color: Colors.white),),
                currentAccountPicture: GestureDetector(
                  onTap: () {
                    pickImage();
                  },
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50.0,
                      child: picture != null?
                      ClipOval(
                          child:Image.file(
                            picture!,
                            width:100.0 ,
                            height: 100.0,
                            fit: BoxFit.cover,
                          )
                      ):Icon(Icons.person, color:navyblue,)
                  ),
                ),
                decoration: BoxDecoration(
                    color:skyblue
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              child: ListTile(
                title: Text('My account'),
                leading: Icon(
                  Icons.person,
                  color: navyblue,
                ),
              ),
            ),
            Divider(color: Colors.black,),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));
              },
              child: ListTile(
                title: Text('About Us'),
                leading: Icon(Icons.help, color:navyblue),
              ),
            ),
            Divider(color: Colors.black,),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TermsAndConditions()));
              },
              child: ListTile(
                title: Text('Terms And Conditions'),
                leading: Icon(Icons.warning, color:navyblue),
              ),
            ),
            Divider(color: Colors.black,),

            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PrivacyPolicy()));
              },
              child: ListTile(
                title: Text('Privacy Policy'),
                leading: Icon(Icons.privacy_tip, color:navyblue),
              ),
            ),
            Divider(color: Colors.black,),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FreeLancer()));

              },
              child: ListTile(
                title: Text('Register for Freelancing'),
                leading: Icon(Icons.workspaces_outline, color:navyblue),
              ),
            ),
            Divider(color: Colors.black,),
            InkWell(
              onTap: () {
                _logout();
              },
              child: ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.exit_to_app, color:pink),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title:
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 2.0,right: 5.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image(
                      image: AssetImage("assets/image/mehfooztm.png") ,
                    ),
                  ),
                ),
                Text('M',style: TextStyle(color:navyblue),),
                Text('E',style: TextStyle(color: navyblue),),
                Text('H',style: TextStyle(color: navyblue),),
                Text('F',style: TextStyle(color: navyblue),),
                Text('O',style: TextStyle(color: pink),),
                Text('O',style: TextStyle(color: pink),),
                Text('Z',style: TextStyle(color: navyblue),),
                SizedBox(width: 50,),
                GestureDetector(
                  onTap:() async{
                    FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);
                  },
                  child: Column(
                    children: const [
                      Icon(Icons.call,color:navyblue,),
                      Text("Women's Counselling",style: TextStyle(fontSize: 10,color: pink),)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor:skyblue,
      ),
      bottomNavigationBar: BottomBar(selectedindex: selectedIndext, setBottomBarIndex:setBottomBarIndex),
      body: SingleChildScrollView(
        child: Container(
          child: selectedIndext == 0
              ? HomeDashboard()
              : selectedIndext == 1
              ? LiveChat()
              : selectedIndext == 2
              ? ECommerce()
              : selectedIndext == 3
              ? NewFeeds()
              : Container(),
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
        getUser(id).then((value) {
          var response = value;
          if(response.statusCode == 200){
            setState(() {
              var data = response.data['data'];
              uname =data["first_name"];
              uemail =data["email"];
            });
          }
        });
      });

    });

  }
}
class BottomBar extends StatelessWidget {
  final int selectedindex ;
  final void Function(int index) setBottomBarIndex;
  const BottomBar({Key? key, required this.selectedindex, required this.setBottomBarIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      BottomAppBar(
        color:skyblue,
        child: Container(
          height: 65,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      size: 35,
                      color: selectedindex == 0 ? Colors.white : Colors.black,
                    ),
                    onPressed: () {
                      setBottomBarIndex(0);
                    },
                    //splashColor: Colors.white,
                  ),
                  Text("Home",style: TextStyle(fontWeight:FontWeight.bold),),
                ],
              ),
              Column(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.chat,
                        size: 35,
                        color: selectedindex == 1 ? Colors.white: Colors.black,
                      ),
                      onPressed: () {
                        setBottomBarIndex(1);
                      }),
                  Text("chat",style: TextStyle(fontWeight:FontWeight.bold),),
                ],
              ),
              // SizedBox.shrink(),
              Column(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 35,
                        color: selectedindex == 2? Colors.white : Colors.black,
                      ),
                      onPressed: () {
                        setBottomBarIndex(2);
                      }),
                  Text("Shop",style: TextStyle(fontWeight:FontWeight.bold),),
                ],
              ),
              Column(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.send,
                        size: 35,
                        color: selectedindex == 3 ? Colors.white : Colors.black,
                      ),
                      onPressed: () {
                        setBottomBarIndex(3);
                      }),
                  Text("Feed",style: TextStyle(fontWeight:FontWeight.bold),),
                ],
              ),
            ],
          ),
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

