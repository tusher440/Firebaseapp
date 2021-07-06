
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Getdata extends StatefulWidget {
  @override
  _GetdataState createState() => _GetdataState();
}

class _GetdataState extends State<Getdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get data"),
      ),

      body: StreamBuilder(
        stream: Firestore.instance.collection('profile').snapshots(),

        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Text("No Value");
          }
          return ListView(
            children: snapshot.data.documents.map((document) {
              return Column(
                children: [
                  Text(document['Name']??" "),
                  Text(document['address']??" "),
                  Text(document['Mobile']??" "),

                ],
              );
            }).toList(),
          );
        },

      ),

    );
  }
}
























//
//
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class Getdata extends StatefulWidget {
//   @override
//   _GetdataState createState() => _GetdataState();
// }
//
// class _GetdataState extends State<Getdata> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("All data"),
//       ),
//
//       body: StreamBuilder(
//         stream: Firestore.instance.collection('profile').snapshots(),
//
//         builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
//           if(!snapshot.hasData){
//             return Text("No Value");
//           }
//           return ListView(
//             children: snapshot.data.documents.map((document) {
//               return Column(
//                 children: [
//                   Text(document['Name']??" "),
//                   Text(document['Address']??" "),
//                   Text(document['Mobile']??" "),
//
//                 ],
//               );
//             }).toList(),
//           );
//         },
//
//       ),
//
//
//     //
//     // );
//   }
// }
