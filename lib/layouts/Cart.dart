import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:womensafety/layouts/ShippingAddress.dart';

const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.red,
      appBar: AppBar(
        title: Container(
          child: Row(
            children: [
              Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 25,
              ),
              SizedBox(width: 5.0,),
              Text('Your Cart', style: TextStyle(color: Colors.amber,fontSize: 18),),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close,size: 25,color: Colors.black87,),
                  ),
                ),
              )
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (cc, i) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 15,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /*  GestureDetector(
                            onTap: () {
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(2.0),
                              child: Image(
                                  image: NetworkImage(thumb),
                                  width: 80,
                                  height: 80),
                            ),
                          ),*/

                            SizedBox(width: 15,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "fogg",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  //Text("2",),
                                  SizedBox(height: 10,),
                                  Row(
                                    children:  [
                                      Text('\u20B9 ' +"200" , style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18),),
                                      SizedBox(width: 10.0,),
                                      RaisedButton(
                                        onPressed: () async {
                                        },
                                        child: Text('Remove',),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
          SizedBox(height: 5.0,),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10.0),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap:(){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ShippingAddress()));
                            },
                            child: Center(child: Text('<< Continue Shopping >>',style: TextStyle(fontSize: 16.0),))),],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                    child: Text("Total Amount:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                ),
                Text("200",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
              ],
            ),
          )
        ],
      ),

      /*Container(
        padding: EdgeInsets.all(10.0),
        child: hList.length == 0 ? FutureBuilder<List<HealthTipList>>(
          future: getHealthTipList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SpinKitCircle(
                color: skyblue,
                size: 50,
              );
            }
            if (snapshot.hasData) {
              hList = snapshot.data!;
              return healthtipList();
            }
            return Container(
              child: Text('No health Tips',style: TextStyle(fontSize: 20),),
            );
          },
        ) : healthtipList(),
      ),*/
    );
  }

/* Column productList() {
    double total = 0.0;
    var buffer = StringBuffer();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: product.length,
              itemBuilder: (context,i){
                var item = product[i];
                int offer = 0;
                String mrp = item.mrp;
                if(item.offer_price!='0'){
                  offer = int.parse(item.offer_price);
                  double offRate = (offer/100)*int.parse(mrp);
                  double price = int.parse(mrp) - offRate;
                  mrp = price.toStringAsFixed(0);
                }

                total = total+double.parse(mrp);
                print(total);
                buffer.write(total.toString());

                var thumb = jsonDecode(item.thumb);
                String thumbImg = thumb[0];

                return FutureBuilder<int>(
                  future: cartQnt(item.size_id),
                  builder: (context,val) {
                    if(val.hasData){
                      int qnt = val.data!;

                      return Column(
                        children: [
                          Card(
                            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
//                                        Navigator.push(context, MaterialPageRoute(
//                                            builder: (context) =>imageView(widget.item.thumb)
//                                        ));
                                          },
                                          child: Hero(
                                            tag : item,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(2.0),
                                              child: Image(
                                                image: NetworkImage(thumbImg),
                                                width: 80,
                                                height: 80,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 5,),
                                                Text(item.product_name,),

                                                Text('Size : '+item.size),
                                                SizedBox(height: 5,),

                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10.0),
                                      child: Row (
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(2.0)
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: GestureDetector(
                                                    onTap: (){
                                                      if(qnt>1){
                                                        qnt--;
                                                        setCart(item.size_id, qnt.toString()).then((value){
                                                          setState(() {

                                                          });
                                                        });
                                                      }
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
                                                  child: Center(child: Text(qnt.toString(),)),
                                                ),
                                                Container(
                                                  child: GestureDetector(
                                                    onTap: (){
                                                      qnt++;
                                                      setCart(item.size_id, qnt.toString()).then((value){
                                                        setState(() {

                                                        });
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
                                          OutlineButton.icon(
                                            onPressed: (){
                                              removeCart(item.size_id).then((value){
                                                cartCount().then((cc){
                                                  if(cc==0){
                                                    clearCart().then((value){
                                                      setState(() {
                                                        product.removeWhere((element) => element.size_id==item.size_id);
                                                        cartString = "";
                                                      });
                                                    });
                                                  } else {
                                                    setState(() {
                                                      product.removeWhere((element) => element.size_id==item.size_id);
                                                    });
                                                  }
                                                });
                                              });
                                            },
                                            color: Colors.pink,
                                            icon: Icon(Icons.delete_forever,size: 20,),
                                            label: Text('Remove',),
                                            borderSide: BorderSide(color:Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return SizedBox(height: 10.0,);
                  },
                );
              }),
        ),

        SizedBox(height: 5.0,),
        Container(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10.0),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap:(){
                            Navigator.pop(context);
                          },
                          child: Center(child: Text('<< Continue Shopping >>',style: TextStyle(fontSize: 16.0,color: Colors.black,decoration: TextDecoration.underline),))),],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            color: Colors.green,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cart Total'),
                        FutureBuilder<String?>(
                          future: getTotal(product),
                          builder: (context,snapshot){
                            if(snapshot.hasData){
                              return Text('\u20B9'+snapshot.data!+'.00',style: TextStyle(fontSize: 20,color: Colors.white),);
                            }
                            return SizedBox(width: 10,);
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      _showLoading();
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>ShippingAddress()
                      ));
                    },
                    child: Container(
                      height: 60.0,
                      child: Center(child: Text('Checkout'),),
                    ),
                  ),
                )
              ],
            )
        ),

      ],
    );
  }*/
}















