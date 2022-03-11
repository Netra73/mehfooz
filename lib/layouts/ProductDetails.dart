
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:womensafety/api/PostAddCart.dart';
import 'package:womensafety/api/getProductDetails.dart';
import 'package:womensafety/api/getUser.dart';
import 'package:womensafety/functions/UserData.dart';
import 'package:womensafety/layouts/Cart.dart';

const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class ProductDetails extends StatefulWidget {
  final String pid;

  const ProductDetails({Key? key,required this.pid});

  @override
  _ProductDetailsState createState() => _ProductDetailsState(pid);
}

class _ProductDetailsState extends State<ProductDetails> {
  String pid;
  _ProductDetailsState(this.pid);
  String category_id="";
  String product_name="";
  String stock="";
  String size="";
  String size_id="";
  String mrp="";
  String offer_price="";
  String thumb="";
  String vendor_id="";
  String product_description="";
  int qnt = 1;
  String uid="";

  @override
  void initState() {
    super.initState();
    _getProductDetails();
    _getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Details',
              style: TextStyle(color: skyblue, fontSize: 18),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                size: 25,
                color: Colors.black87,
              ),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body:
      Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            //Navigator.push(context, MaterialPageRoute(
                            //builder: (context) =>imageView(widget.item.thumb)
                            // ));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2.0),
                            child: Image(
                                image: NetworkImage(thumb),
                                width: 80,
                                height: 80),
                          ),
                        ),

                        SizedBox(width: 15,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                product_name,
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(size,),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text('\u20B9 ' +mrp , style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18),),
                                  SizedBox(width: 10.0,),
                                ],
                              ),
                              Text(
                                'In stock',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 14),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      width: 1.0, color: Colors.grey),
                                  left: BorderSide(
                                      width: 1.0, color: Colors.grey),
                                  right: BorderSide(
                                      width: 1.0, color: Colors.grey),
                                  bottom: BorderSide(
                                      width: 1.0, color: Colors.grey),
                                ),
                                borderRadius: BorderRadius.circular(2.0)),
                            child: Row(
                              children: [
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (qnt > 1) {
                                          qnt--;
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.black38,
                                      size: 20,
                                    ),
                                  ),
                                  width: 40,
                                  height: 32,
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  color: Colors.amber[100],
                                  width: 50.0,
                                  height: 32.0,
                                  child: Center(
                                      child: Text(
                                        qnt.toString(),
                                      )),
                                ),
                                Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        qnt++;
                                      });
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.black38,
                                      size: 20,
                                    ),
                                  ),
                                  width: 40,
                                  height: 32,
                                ),
                              ],
                            ),
                          ),
                          RaisedButton(
                            onPressed: () {
                              _addtoCart();
                            },
                            child: Text('Add to Cart',),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Text("Description:",style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: Text(product_description,style: TextStyle(fontSize: 18),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Cart()));
            },
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.amber[600],
                    padding: EdgeInsets.all(15.0),
                    child: Center(
                        child: Text(
                          'BUY NOW',style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                )
              ],
            ),
          )
        ],
      ),      /*Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //Navigator.push(context, MaterialPageRoute(
                                  //builder: (context) =>imageView(widget.item.thumb)
                                  // ));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(2.0),
                                  child: Image(
                                      image: NetworkImage(thumb),
                                      width: 80,
                                      height: 80),
                                ),
                              ),

                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product_name,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(size,),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Text('\u20B9 ' +mrp , style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18),),
                                          SizedBox(width: 10.0,),
                                        ],
                                      ),
                                      Text(
                                        'In stock',
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                        top: BorderSide(
                                            width: 1.0, color: Colors.grey),
                                        left: BorderSide(
                                            width: 1.0, color: Colors.grey),
                                        right: BorderSide(
                                            width: 1.0, color: Colors.grey),
                                        bottom: BorderSide(
                                            width: 1.0, color: Colors.grey),
                                      ),
                                      borderRadius: BorderRadius.circular(2.0)),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (qnt > 1) {
                                                qnt--;
                                              }
                                            });
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.black38,
                                            size: 20,
                                          ),
                                        ),
                                        width: 40,
                                        height: 32,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        color: Colors.amber[100],
                                        width: 50.0,
                                        height: 32.0,
                                        child: Center(
                                            child: Text(
                                              qnt.toString(),
                                            )),
                                      ),
                                      Container(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              qnt++;
                                            });
                                          },
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.black38,
                                            size: 20,
                                          ),
                                        ),
                                        width: 40,
                                        height: 32,
                                      ),
                                    ],
                                  ),
                                ),
                                FutureBuilder(
                                  future: checkCart(size_id),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data == true) {
                                        return Text(
                                          'In Cart',
                                        );
                                      } else {
                                        return RaisedButton(
                                          onPressed: () {
                                            /*setCart(size_id, qnt.toString(),)
                                                .then((value) {
                                              setState(() {});
                                            });*/
                                            //_addtocart();
                                          },
                                          child: Text(
                                            'Add to Cart',
                                          ),
                                        );
                                      }
                                    } else {
                                      return SizedBox(
                                        width: 10,
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 100.0,
                                      height: 32.0,
                                      child: Text("Description:",style: TextStyle(fontSize: 18,color: Colors.red,),),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            child: Container(
                              child: Text(product_description,style: TextStyle(fontSize: 18),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                cartQnt(size_id).then((value) {
                  if (value == 0) {
                    setCart(size_id, qnt.toString())
                        .then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cart()));
                    });
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cart()));
                  }
                });
              },
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.amber[600],
                      padding: EdgeInsets.all(15.0),
                      child: Center(
                          child: Text(
                            'BUY NOW',
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),*/
    );
  }
  _getProductDetails(){
    getProductDetails(pid).then((value){
      var response = value;
      if(response.statusCode == 200){
        setState(() {
          var data = response.data['data'];
          print(data);
          String product_id = data["product_id"];
          category_id = data["category_id"];
          product_name = data["product_name"];
          stock = data["stock"];
          size = data["size"];
          size_id = data["size_id"];
          mrp = data["mrp"];
          offer_price = data["offer_price"];
          product_description = data["product_description"];
          thumb = data["thumb"];
          vendor_id = data["vendor_id"];
        });
      }
    }).catchError((error){
      if(error is DioError){
        Navigator.pop(context);
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
            uid = data['id'];
          });
        }
        getUser(uid).then((value) {
          var response = value;
          if(response.statusCode == 200){
            setState(() {
              var data = response.data['data'];

            });
          }
        });
      });

    });

  }

  _addtoCart(){
    var cartData = {
      'size_id': size_id,
      'user_id':uid ,
      'vendor_id': vendor_id,
      'product_id': pid,
      'product_name': product_name,
      'mrp': mrp,
      'offer_price': offer_price,

    };

    PostAddCart(cartData).then((value){
      var response = value;
      Navigator.pop(context);
      if(response.statusCode == 200) {

      }

    }).catchError((error){
      if(error is DioError){
        Navigator.pop(context);
        if(error.response?.statusCode == 400){
          setState(() {

          });
        }
      }
    });
  }

}


