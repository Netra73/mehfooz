import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _OrderDetailsState extends State<OrderDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
                width: 5.0,
              ),
              Text(
                'Order Details',
              )
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: skyblue,
        elevation: 0.0,
      ),
      body:SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        // border: mainStyle.grayBorder,
                          borderRadius: BorderRadius.circular(3.0),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 150.0,
                                  child: Text(
                                      "Order Date ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
                                    // style: mainStyle.text16,
                                  )),
                              Text(
                                "25/02/2022",
                                // style: mainStyle.text16,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 150.0,
                                  child: Text(
                                      "Order ID # ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
                                    //style: mainStyle.text16,
                                  )),
                              Text(
                                "112",
                                // style: mainStyle.text16,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 150.0,
                                  child: Text(
                                    "Order Total",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                    // style: mainStyle.text16,
                                  )),
                              Text(
                                "210",
                                // style: mainStyle.text16,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "Order Status ",
                // style: mainStyle.text16Bold,
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          //border: mainStyle.grayBorder,
                            borderRadius: BorderRadius.circular(3.0),
                            color: Colors.white),
                        child: Text("Your order has been placed successfully",
                            style: TextStyle(color: Colors.green, fontSize: 16.0))),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "Items ",
                // style: mainStyle.text16Bold,
              ),
              SizedBox(
                height: 5.0,
              ),
              /* Row(
            children: [
              Expanded(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        //border: mainStyle.grayBorder,
                        borderRadius: BorderRadius.circular(3.0),
                        color: Colors.white),
                    child: itemsView()),
              )
            ],
          ),*/
              SizedBox(
                height: 15.0,
              ),
              Text(
                "Shipping Address ",
                // style: mainStyle.text16Bold,
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        // border: mainStyle.grayBorder,
                          borderRadius: BorderRadius.circular(3.0),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Name" + ' , ' + "Mobile",
                              //style: mainStyle.text16,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            child: Text(
                              "Email",
                              // style: mainStyle.text16,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              children: const [
                                Expanded(
                                    child: Text(
                                      "Address",
                                      //style: mainStyle.text16,
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: const [
                              Text(
                                "city" + ', ',
                              ),
                              Text(
                                "State" + ' ',

                              ),
                              Text(
                                "Pincode",

                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3,
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
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "Order Summary ",
                // style: mainStyle.text16Bold,
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        //  border: mainStyle.grayBorder,
                          borderRadius: BorderRadius.circular(3.0),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Item's Total : 2",
                                //style: mainStyle.text16,
                              ),
                              Text(
                                "210" + ".0",
                                // style: mainStyle.text16,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Shipping : ",
                                // style: mainStyle.text16,
                              ),
                              Text(
                                "10"+ ".0",

                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Order Total : ",
                                //style: mainStyle.text18Bold,
                              ),
                              Text(
                                '\u20B9' + "210" + ".0",

                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),

                          Row(
                            children: [
                              Container(
                                  width: 150.0,
                                  child: Text(
                                    "Payment Status : ",
                                    //style: mainStyle.text16,
                                  )),
                              Text(
                                "Cash on delivery",
                                // style: mainStyle.text16,
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              )
            ]
        ),
      ),
    );
  }
}



