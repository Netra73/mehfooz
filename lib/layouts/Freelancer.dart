import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:womensafety/api/PostFreelancer.dart';
import 'package:womensafety/api/getUser.dart';
import 'package:womensafety/functions/UserData.dart';
import 'package:womensafety/functions/validations.dart';
import 'package:womensafety/layouts/HomePage.dart';
import 'package:womensafety/modules/FreelancerForm.dart';

const skyblue = Color(0xff70d0f6);
const navyblue = Color(0xff3b3f81);
const pink = Color(0xffc7297e);

class FreeLancer extends StatefulWidget {
  const FreeLancer({Key? key}) : super(key: key);

  @override
  _FreeLancerState createState() => _FreeLancerState();
}

class _FreeLancerState extends State<FreeLancer> {
  late Razorpay _razorpay;
  TextEditingController textEditingController = new TextEditingController();
  final _freelancerForm  = GlobalKey<FormState>();
  FreelancerForm freelancerForm = FreelancerForm();
  bool mblError= false;
  bool emailError=false;
  String errorMsg ="";
  bool image =false;

  bool autovalidate = false;
  bool isValid = false;
  File? _image;
  String? base64Image;
  Future<File>? file;
  late XFile _photo ;
  late final path;
  String? photoBase64;
  File? imageResized;
  bool success = false;
  String id ="";
  String uname ="";
  String uemail ="";
  String phone ="";


  // late File imageFile;
  final ImagePicker _picker = ImagePicker();

  _checkValidate() {
    isValid = _freelancerForm.currentState!.validate();
    if (isValid) {
      _freelancerForm.currentState!.save();
      _freelancer();
    } else {
      setState(() {
        autovalidate = true;
      });
    }

  }

  Future getImage(ImageSource source) async {
    var photo = await _picker.pickImage(source: source);
    setState(() {
      _photo =photo!;
      print(_photo);
      image= true;
    });
  }
  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          var tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data!.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data!,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
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
        title: Text("PROFILE INFO"),
        backgroundColor: skyblue,
      ),
      body:SingleChildScrollView(
        child: Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            color: Colors.white,
            elevation: 10,
            margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom:40.0, top: 20.0),
            child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Form(
                    autovalidateMode: AutovalidateMode.disabled,
                    key: _freelancerForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                          child: TextFormField(
                            validator: (value){
                              if (value==null||value.isEmpty) {
                                return 'Enter your name';
                              }
                              else{
                                return null;
                              }
                            },
                            onSaved: (value){
                              freelancerForm.first_name = value;
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
                                return 'Enter your Last name';
                              }
                              else{
                                return null;
                              }
                            },
                            onSaved: (value){
                              freelancerForm.last_name = value;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                                hintText: "Last Name",
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                          child: TextFormField(
                            controller: TextEditingController(text: freelancerForm.phone),
                            validator: (value){
                              if (value==null||value.isEmpty) {
                                return 'Enter Contact Number';
                              }
                              else{
                                return null;
                              }
                            },
                            onSaved: (value){
                              freelancerForm.phone = value;
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.red,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                                hintText: "Contact",
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
                            controller: TextEditingController(text: freelancerForm.email),
                            validator: (value){
                              return emailRequired(value!, "Enter valid email id");
                            },
                            onSaved: (value){
                              freelancerForm.email = value;
                            },
                            decoration: InputDecoration(
                                fillColor: Colors.red,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                                hintText: "Email-Id ",
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
                        Padding(
                          padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                          child: TextFormField(
                            validator: (value){
                              if (value==null||value.isEmpty) {
                                return 'Enter website';
                              }
                              else{
                                return null;
                              }
                            },
                            onSaved: (value){
                              freelancerForm.website = value;
                            },

                            decoration: InputDecoration(
                                fillColor: Colors.red,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                                hintText: "Web ",
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                            ),

                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field Required';
                              }
                              else{
                                return null;
                              }
                            },
                            onSaved: (value){
                              freelancerForm.about_me = value;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                                hintText: 'About me',
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                          child: TextFormField(
                            validator: (value){
                              if (value==null||value.isEmpty) {
                                return 'Enter your profession';
                              }
                              else{
                                return null;
                              }
                            },
                            onSaved: (value){
                              freelancerForm.profession = value;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                                hintText: "Profession",
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                          child: TextFormField(
                            validator: (value){
                              if (value==null||value.isEmpty) {
                                return 'Field Required';
                              }
                              else{
                                return null;
                              }
                            },
                            onSaved: (value){
                              freelancerForm.skills = value;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                                hintText: "Skills",
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        /* Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: GestureDetector(
                              onTap: () {
                                getImage(ImageSource.gallery);
                                //galleyImage();
                               // freelancerForm.profile_photo= path;
                              },

                              child: Text("Upload Image",style: TextStyle(color: Colors.red),)
                          ),
                        ),*/
                        /* Padding(
                          padding: EdgeInsets.only(left: 20.0,right: 20.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Select Image',
                            ),
                            onTap: () {
                              getImage(ImageSource.gallery);
                            },
                            onSaved: (value){
                              freelancerForm.profile_photo= _photo;
                            },
                          ),
                        ),*/

                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: ElevatedButton(
                            child: Text('Pick Image',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              primary: skyblue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () async {
                              await getImage(ImageSource.gallery);
                              if(_photo!=null){
                                freelancerForm.profile_photo=_photo;
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20.0,right: 20.0),
                              child: Text("Pay Rs499 For Registration",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            ElevatedButton(
                              child: Text('pay',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                              style: ElevatedButton.styleFrom(
                                primary: skyblue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                //startPayment();
                                openCheckout();
                                /*
                                if(path!=null){

                                }
                                * */

                              },
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Center(
                          child: Container(
                              width: 180.0,
                              height: 50.0,
                              child: ElevatedButton(
                                child: Text('Submit',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                                style: ElevatedButton.styleFrom(
                                  primary: skyblue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  if(success==true)
                                  {
                                    _checkValidate();
                                  }
                                },

                              )
                          ),
                        ),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    _getUserDetails();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_6nq1I5DpaJVEk9',
      'amount': 100,
      'name': uname,
      'description': 'Freelancer Register',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': phone, 'email':uemail},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    setState(() {
      success=true;
    });
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }


  _freelancer(){
    _showLoading();
    PostFreelancer(freelancerForm).then((value){
      var response = value;
      Navigator.pop(context);
      if(response.statusCode == 200){
        setState(() {
          String id = response.data['id'];
          var data = response.data['data'];
          Fluttertoast.showToast(
              msg: "Registered successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1
          );
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              HomePage()), (Route<dynamic> route) => false);

        });
      }
    }).catchError((error){
      if(error is DioError){
        Navigator.pop(context);
        if(error.response?.statusCode == 400){
          setState(() {
            errorMsg = error.response!.data['message'];
            print(errorMsg);
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
  _getUserDetails(){
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
              id = data['id'];
              uname = data['first_name'];
              uemail = data['email'];
              phone = data['phone'];

            });
          }
        });
      });
    });
  }
}



