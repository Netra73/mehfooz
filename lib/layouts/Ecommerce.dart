import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:womensafety/api/getCategory.dart';
import 'package:womensafety/layouts/Products.dart';
import 'package:womensafety/modules/Category.dart';

class ECommerce extends StatefulWidget {
  @override
  _ECommerceState createState() => _ECommerceState();
}
const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);

class _ECommerceState extends State<ECommerce> {
  List<Category>cList = [];

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.0,left: 20.0),
          child: Text("Shop",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          height: 610,
          child: cList.length == 0 ? FutureBuilder<List<Category>>(
            future: geCategory(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SpinKitCircle(
                  color: skyblue,
                  size: 50,
                );
              }
              if (snapshot.hasData) {
                cList = snapshot.data!;
                return categoryList();
              }
              return Container(
                child: Text('No category',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              );
            },
          ) : categoryList(),

        ),
      ],
    );

  }

  ListView categoryList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: cList.length,
        itemBuilder: (cc, i) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) =>  Products(cid:cList[i].id),
              ));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 2,
              margin: EdgeInsets.fromLTRB(10, 2, 10, 10),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          FutureBuilder(
                              future:geCategory(),
                              builder: (cc,snap){
                                print(snap.data.toString());
                                if(snap.hasData){
                                  return Center(
                                    child: Container(
                                        height: 80,
                                        width: 40,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 10.0,bottom: 5.0),
                                          child: Image.network(cList[i].icon),
                                        )
                                    ),
                                  );
                                }
                                return SizedBox();
                              }),
                        ],
                      ),
                      SizedBox(width: 20,),
                      Text(cList[i].title,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

}
