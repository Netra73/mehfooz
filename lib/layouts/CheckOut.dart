import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:womensafety/layouts/OrderFetails.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _CheckOutState extends State<CheckOut> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Out"),
        backgroundColor: skyblue,
      ),
      body:Container(
        child: SingleChildScrollView(
          child: Column(
              children: [
                Container(
                    padding: EdgeInsets.all(10.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                        child: Text(
                                          'Total items : ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                        )
                                    )
                                ),
                                Container(
                                    alignment: Alignment.centerRight,
                                    child: Text("2",)),
                                SizedBox(
                                  width: 10.0,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                        child: Text(
                                          'Total Item Amount : ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                        ))),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                    children: [
                                      Text("200".toString() + ".0",),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10.0,)
                              ],
                            ),
                            SizedBox(height: 5.0,),
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                        child: Text(
                                          'Shipping Charge : ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                        ))),
                                Container(
                                    alignment: Alignment.centerRight,
                                    child: Text("10".toString() + '.0',)),
                                SizedBox(width: 10.0,)
                              ],
                            ),
                            SizedBox(height: 5.0,),

                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                        child: Text(
                                            'Total Amount : ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)))),
                                Container(
                                    alignment: Alignment.centerRight,
                                    child: Text("210".toString() + '.0',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                              ],
                            ),

                            SizedBox(height: 5.0,),

                          ],
                        ),
                      ),
                    )
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shipping Address',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              child: Text("Name"
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Container(
                              child: Text(
                                  "Email"
                              ),
                            ),
                            SizedBox(
                              height: 17,
                            ),
                            Container(
                              child: Row(
                                children: const [
                                  Expanded(
                                      child: Text(
                                          "Address"
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Container(
                              child: Row(
                                children: const [
                                  Text(
                                      "City,"
                                  ),
                                  Text(
                                      "State,"
                                  ),
                                  Text(
                                      "Pincode"
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Container(
                              child: Row(
                                children: const [
                                  Text(
                                    'India',
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),

                      )),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Payment Type',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Cash on delivery',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20,),
                Center(
                  child: SizedBox(
                      width: 180.0,
                      height: 50.0,
                      child: ElevatedButton(
                        child: Text('Done',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          primary: skyblue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>OrderDetails()
                          ));
                          // _checkValidate();
                        },
                      )
                  ),
                ),

              ]
          ),
        ),
      ),
    );
  }
}



/*import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'HomeDashboard.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  String cartString = '';
  String paymentMethod = 'Online';
  String totalItem = '';
  String paymentstatus = '';
  String paymentId = '';
  String promocode = '';
  String prodname = '';
  String promobtntext = 'APPLY';
  int totalAmt = 0;
  int initialtotalAmt = 0;
  String cashbackamt = '';
  String cashbackapply = '';
  String cashbackamtmax = '';
  String walletbalance = '0';
  String sendpromocode = '';
  String sendpromorate = '';
  String sendcashback = '0';
  String sendcashbackapplied = '0';
  String errormsg = '';
  String clr = '';

  int loyalty_points = 2000;
  int deducted_amount = 0;
  int rwdAply = 0;
  int rwdAmt = 0;
  int shipAmt = 0;
  int blncPnts = 0;
  int grandTotal = 0;
  int grandTotalPayable = 0;
  bool ready = false;
  bool loading = false;
  bool applycode = false;
  var productMap = Map<String, Map<String, String>>();
  var address;
  bool user = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: mainStyle.bgColor,
      appBar: AppBar(
       // backgroundColor: mainStyle.mainColor,
        title: Container(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'Checkout',
                style: TextStyle(color: Colors.amber, fontSize: 18),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0.0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //color: mainStyle.mainColor,
                padding: EdgeInsets.all(10.0),
                child: ready
                    ? Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                    child: Text(
                                      'Total items : ',
                                   //   style: mainStyle.text16,
                                    ))),
                            Container(
                                alignment: Alignment.centerRight,
                                child: Text("10",
                                    //style: mainStyle.text16
                                )
                            ),
                            SizedBox(
                              width: 10.0,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                    child: Text(
                                      'Total Item Amount : ',
                                    ))),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Row(
                                children: [
                                  Text("200".toString() + ".0",
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                    child: Text(
                                      'Shipping Charge : ',
                                    ))),
                            Container(
                                alignment: Alignment.centerRight,
                                child: Text("10".toString() + '.0',
                                )
                            ),
                            SizedBox(
                              width: 10.0,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),

                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                    child: Text(
                                      'Total Amount : ',
                                     // style: mainStyle.text20,
                                    ))),
                            Container(
                                alignment: Alignment.centerRight,
                                child: Text(grandTotal.toString() + '.0',
                                   // style: mainStyle.text20Bold
                                )
                            ),
                            SizedBox(
                              width: 10.0,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 1.0,
                        ),

                        SizedBox(
                          height: 5.0,
                        ),

                        SizedBox(
                          height: 5.0,
                        ),

                      ],
                    ),
                  ),
                )
                    : SpinKitThreeBounce(
                  color: Colors.amber,
                  size: 20,
                ),
              ),
             /* Container(
                padding: EdgeInsets.all(10.0),
                child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FutureBuilder<String?>(
                        future: getData("SHIPPING_ADDRESS"),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            address = jsonDecode(snapshot.data!);
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shipping Address',
                                //  style: mainStyle.text14Gray,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  child: Text(
                                    address['name'],
                                    style: mainStyle.text16,
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  child: Text(
                                    address['email'],
                                    style: mainStyle.text16,
                                  ),
                                ),
                                SizedBox(
                                  height: 17,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                            address['address'],
                                            style: mainStyle.text16,
                                          ))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        address['city'] + ', ',
                                        style: mainStyle.text16,
                                      ),
                                      Text(
                                        address['state'] + ' ',
                                        style: mainStyle.text16,
                                      ),
                                      Text(
                                        address['pincode'],
                                        style: mainStyle.text16,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        'India',
                                        style: mainStyle.text16,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: RaisedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ShippingAddress()));
                                        },
                                        color: Colors.grey[200],
                                        padding: EdgeInsets.all(12.0),
                                        child: (Text(
                                          'Change Address',
                                          style: mainStyle.text16,
                                        )),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            );
                          }
                          return SizedBox(
                            height: 10,
                          );
                        },
                      ),
                    )),
              ),*/
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Select Payment Type',
                              //  style: mainStyle.text14Gray,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                             /* Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black26),
                                    )),
                                child: RadioListTile(
                                  groupValue: paymentMethod,
                                  value: 'Online',
                                  activeColor: Colors.amber,
                                  title: Text(
                                    'Pay now',
                                    style: paymentMethod == 'Online'
                                        ? mainStyle.text20
                                        : mainStyle.text20gray,
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      paymentMethod = val.toString();
                                    });
                                  },
                                ),
                              ),*/
                             /* RadioListTile(
                                groupValue: paymentMethod,
                                value: 'COD',
                                activeColor: Colors.amber,
                                title: Text(
                                  'Pay on delivery',
                                  style: paymentMethod == 'COD'
                                      ? mainStyle.text20
                                      : mainStyle.text20gray,
                                ),
                                onChanged: (val) {
                                  setState(() {
                                    paymentMethod = val.toString();
                                  });
                                },
                              ),*/
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ready
                        ? RaisedButton(
                      onPressed: () {
                        // _placeOrder();
                        if (paymentMethod == 'COD') {
                          paymentId = '0';
                          paymentstatus = '0';
                         // _placeOrder();
                        } else {
                         // openCheckout();
                        }
                      },
                     // color: mainStyle.secColor,
                      padding: EdgeInsets.fromLTRB(20, 13, 23, 10),
                      child: (Text(
                        'Confirm Order',
                        //style: mainStyle.text20White,
                      )),
                    )
                        : Container(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  /*  _placeOrder() {
    _showLoading();
    getData("USER_DATA").then((value) {
      String uid = "";
      bool cashback = false;
      if (value != null) {
        var data = jsonDecode(value);
        uid = data['id'];
      }
      var orderData = {
        'uid': uid,
        'totalItems': totalItem,
        'subTotal': totalAmt,
        'shipping': shipAmt,
        'trnCharge': '0',
        'codCharge': '0',
        'loyalty_points': loyalty_points,
        'deducted_amount': rwdAmt,
        'totalAmount': grandTotal,
        'paymentType': paymentMethod,
        'paymentStatus': paymentstatus,
        'paymentId': paymentId,
        'name': address['name'],
        'mobile': address['mobile'],
        'email': address['email'],
        'city': address['city'],
        'state': address['state'],
        'pincode': address['pincode'],
        'address': address['address'],
        'items': jsonEncode(productMap),
        'promoCode': sendpromocode,
        'promoRate': sendpromorate,
        'cashBack': sendcashback,
        'cashBackApply': sendcashbackapplied,
      };
      print("see order");
      print(orderData);
      print(orderData);

      PlaceOrder(orderData).then((value) {
        print("See Order response" + value!);

        Navigator.pop(context);
        var response = jsonDecode(value);
        if (response['status'] == 422) {
          setState(() {
            _errorDialog();
          });
        }
        if (response['status'] == 200) {
          var data = response['data'];
          clearCart().then((value) {
            print(value);
            removeData("SHIPPING_ADDRESS").then((value) {
              /* if(grandTotal >= int.parse(cashbackamt))
                {
                  cashback = true;
                }
              else
                {
                  cashback = false;
                }*/
              _successDialog(data['orderId'], cashback);
              // openCheckout();
            });
          });
        }
      });
    });
  }*/
}*/
