import 'package:firebaseapp/getdata.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Homepage extends StatefulWidget {



  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  String name;
  String address;
  String mobile;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Name"
              ),

              onChanged: (input){
                name = input;
              },

            ),

          ),


          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Adress"
              ),

              onChanged: (input){
                address = input;
              },

            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Mobile"
              ),

              onChanged: (input){
                mobile = input;
              },

            ),
          ),

          FlatButton(
            color: Colors.green,
            onPressed: (){
              Firestore.instance.collection("profile").add({
                "name": name,
                "Address": address,
                "Mobile": mobile,
              });
            },
            child: Text("Send"),
          ),

          FlatButton(
            color: Colors.green,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Getdata()));
            },
            child: Text("Get data"),
          ),

          FlatButton(
              onPressed: (){
                Navigator.pop(context);
              },

              child: Text("LogOut")
          ),


        ],
      ),
    );
  }
}
