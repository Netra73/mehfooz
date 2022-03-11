import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';

const skyblue = Color(0xff70d0f6);
const pink = Color(0xffc7297e);


class AddContacts extends StatefulWidget {
  @override
  _AddContactsState createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  final FlutterContactPicker _contactPicker = new FlutterContactPicker();
  Contact? _contact;
  String name="";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return



      Scaffold(
        appBar: AppBar(
          title: Text("Claim Complaint"),
          backgroundColor: skyblue,
        ),
        body: Column(
          children: [
            SizedBox(height: 10.0,),
            Center(
              child: Container(
                  width: 180.0,
                  height: 50.0,
                  child: ElevatedButton(
                    child: Text('Select Contact',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      primary: pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      Contact? contact = await _contactPicker.selectContact();
                      setState(() {
                        _contact = contact;
                        //print(_contact);
                        var name = _contact!.phoneNumbers;
                        print(name);
                      });
                    },
                  )
              ),
            ),


            new Text(
              _contact == null ? 'No contact selected.' : _contact.toString(),
            ),
          ],
        ),
      );
  }
/* @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text("Claim Complaint"),
          //backgroundColor: skyblue,
        ),
        body: new Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new MaterialButton(
                color: Colors.blue,
                child: new Text("Add Contacts"),
                onPressed: () async {
                  Contact? contact = await _contactPicker.selectContact();
                  setState(() {
                    _contact = contact;
                  });
                },
              ),
              new Text(
                _contact == null ? 'No contact selected.' : _contact.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }*/
}
