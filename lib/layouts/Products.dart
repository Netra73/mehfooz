import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:womensafety/api/getProducts.dart';
import 'package:womensafety/layouts/ProductDetails.dart';
import 'package:womensafety/modules/ProductList.dart';
class Products extends StatefulWidget {
  final String cid;
  const Products({Key? key,required this.cid});

  @override
  _ProductsState createState() => _ProductsState(cid);
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _ProductsState extends State<Products> {
  List<ProductList>pList = [];
  String cid;
  _ProductsState(this.cid);

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(pList.length);
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        backgroundColor: skyblue,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: pList.length == 0 ? FutureBuilder<List<ProductList>>(
          future: getProducts(cid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SpinKitCircle(
                color: skyblue,
                size: 50,
              );
            }
            if (snapshot.hasData) {
              pList = snapshot.data!;
              return productList();
            }
            return Center(
              child: Text('No Products',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            );
          },
        ) : productList(),

      ),
    );
  }

  ListView productList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: pList.length,
        itemBuilder: (cc, i) {
          return Card(
            margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder(
                            future:getProducts(cid),
                            builder: (cc,snap){
                              print(snap.data.toString());
                              if(snap.hasData){
                                return Container(
                                    height: 100,
                                    width: 60,
                                    child: Image.network(pList[i].thumb)
                                );
                              }
                              return SizedBox();
                            }),

                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5,),
                                Text(pList[i].product_name,
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                    pList[i].size
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '\u20B9' + pList[i].mrp,
                                          style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    RaisedButton(
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>  ProductDetails(pid:pList[i].product_id,),
                                        ));
                                      },
                                      color: skyblue,
                                      child: Text(
                                        'BUY',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
