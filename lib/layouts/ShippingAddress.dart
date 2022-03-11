import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:womensafety/functions/validations.dart';
import 'package:womensafety/layouts/CheckOut.dart';

class ShippingAddress extends StatefulWidget {
  @override
  _ShippingAddressState createState() => _ShippingAddressState();
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _ShippingAddressState extends State<ShippingAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shipping Address"),
        backgroundColor: skyblue,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              Form(
                autovalidateMode: AutovalidateMode.disabled,
                //key: _signUpForm,
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
                        },
                        decoration: InputDecoration(
                          //  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "First Name",
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
                        },
                        onChanged:(val){
                          setState(() {
                          });
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.red,
                            // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "Mobile Number",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        validator: (value){
                          return mobileRequired(value!, "Pincode");
                        },
                        onSaved: (value){
                        },
                        onChanged:(val){
                          setState(() {
                          });
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.red,
                            // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "Pincode",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        validator: (value){
                          if (value==null||value.isEmpty) {
                            return 'Enter your Land name';
                          }
                          else{
                            return null;
                          }
                        },
                        onSaved: (value){
                        },
                        decoration: InputDecoration(
                          //  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "Land Name",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        validator: (value){
                          return mobileRequired(value!, "Flat Number");
                        },
                        onSaved: (value){
                        },
                        onChanged:(val){
                          setState(() {
                          });
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.red,
                            // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "Flat Number",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        validator: (value){
                          if (value==null||value.isEmpty) {
                            return 'Enter your Street';
                          }
                          else{
                            return null;
                          }
                        },
                        onSaved: (value){
                        },
                        decoration: InputDecoration(
                          //  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "Street",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        validator: (value){
                          if (value==null||value.isEmpty) {
                            return 'Enter your landmark';
                          }
                          else{
                            return null;
                          }
                        },
                        onSaved: (value){
                        },
                        decoration: InputDecoration(
                          //  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "landmark",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        validator: (value){
                          if (value==null||value.isEmpty) {
                            return 'Enter your city';
                          }
                          else{
                            return null;
                          }
                        },
                        onSaved: (value){
                        },
                        decoration: InputDecoration(
                          //  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "city",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        validator: (value){
                          if (value==null||value.isEmpty) {
                            return 'Enter your state';
                          }
                          else{
                            return null;
                          }
                        },
                        onSaved: (value){
                        },
                        decoration: InputDecoration(
                          //  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "state",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                      child: TextFormField(
                        validator: (value){
                          if (value==null||value.isEmpty) {
                            return 'Enter your place';
                          }
                          else{
                            return null;
                          }
                        },
                        onSaved: (value){
                        },
                        decoration: InputDecoration(
                          //  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),),
                            hintText: "place",
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: SizedBox(
                          width: 180.0,
                          height: 50.0,
                          child: ElevatedButton(
                            child: Text('Continue',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                              primary: skyblue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) =>CheckOut()
                              ));
                              // _checkValidate();
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
    );
  }
}
