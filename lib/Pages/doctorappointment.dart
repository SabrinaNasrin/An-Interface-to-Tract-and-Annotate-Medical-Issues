import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:paintracker/Pages/painlevel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';
import 'package:firebase_core/firebase_core.dart';
class DoctorAppointment extends StatefulWidget {
  const DoctorAppointment({Key? key}) : super(key: key);

  @override
  _DoctorAppointmentState createState() => _DoctorAppointmentState();
}

class _DoctorAppointmentState extends State<DoctorAppointment> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final CollectionReference ref =  FirebaseFirestore.instance.collection("users");
  String textnote= '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: Text('Pain Tracker'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.white), onPressed: () { Navigator.pop(context); },
        ),
      ),
      body:Container(
        padding: EdgeInsets.all(10),
        child: Column(

          children: const [
            Text('Take Two Tablets of Paracetamol.\nTake Rest For Two Days.', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            //Text('',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          ],
        ),
      ),


      // StreamBuilder<QuerySnapshot>(
      //     stream:FirebaseFirestore.instance.collection('users').snapshots(),
      //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //       return ListView.builder (
      //         itemCount: snapshot.data!.docs.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           DocumentSnapshot users = snapshot.data!.docs[index];
      //           return ListTile(
      //             title: Text(users['Thyroid']),
      //             //subtitle: Text(users['Blood Group']),
      //
      //           );
      //         },
      //       );
      //     }
      // ),






    //             SingleChildScrollView(
    //               physics: AlwaysScrollableScrollPhysics(),
    //               child: Column(
    //                 children: [
    //                   Container(
    //                     padding: EdgeInsets.all(30),
    //                     child: Form(
    //                       key: _formkey ,
    //                         child: TextField(
    //                           maxLines: 5,
    //                           minLines: 1,
    //                           textInputAction: TextInputAction.next,
    //                           decoration: const InputDecoration(
    //                             border: OutlineInputBorder(
    //
    //                             ),
    //                             hintText: 'Write Your Comment Here....',
    //                           ),
    //                           onChanged: (value){
    //                             textnote = value;
    //                           }
    //                         ),),
    //                   ),
    //             Row(
    //
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               //crossAxisAlignment: CrossAxisAlignment.center,
    //               children: <Widget>[
    //                 Padding(padding: EdgeInsets.fromLTRB(0, 100, 0, 300) ),
    //                 ElevatedButton(onPressed: () async{
    //                   await ref.add({
    //                     'name': 'sajhd',
    //                     'age':16,
    //                     'notes':textnote
    //
    //                   }).then((value)=>print('user added'));
    //
    //                 },   style: ButtonStyle(
    //                   backgroundColor:  MaterialStateProperty.all<Color>(Colors.teal.shade400) ,
    //                   shadowColor: MaterialStateProperty.all<Color>(Colors.teal.shade200.withOpacity(1)),
    //                   elevation: MaterialStateProperty.resolveWith<double>(
    //                         (Set<MaterialState> states) {
    //                       if (states.contains(MaterialState.pressed))
    //                         return 10.0;
    //                       return 15.0;
    //                     },
    //                   ),
    //                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                     RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(10.0),
    //                       //side: BorderSide(color: Colors.red)
    //                     ),
    //                   ),
    //                 ),
    //                     child: Text('Confirm')),
    //                 SizedBox(width: 10,),
    //                 ElevatedButton(onPressed: ()=>Navigator.popAndPushNamed(context,'/home'),
    //                     style: ButtonStyle(
    //                       backgroundColor:  MaterialStateProperty.all<Color>(Colors.teal.shade400) ,
    //                       shadowColor: MaterialStateProperty.all<Color>(Colors.teal.shade200.withOpacity(1)),
    //                       elevation: MaterialStateProperty.resolveWith<double>(
    //                             (Set<MaterialState> states) {
    //                           if (states.contains(MaterialState.pressed))
    //                             return 10.0;
    //                           return 15.0;
    //                         },
    //                       ),
    //                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                         RoundedRectangleBorder(
    //                           borderRadius: BorderRadius.circular(10.0),
    //                           //side: BorderSide(color: Colors.red)
    //                         ),
    //                       ),
    //                     ),child: Text('Back'))
    //
    //             ],),
    //           ],
    //
    // ),
    //
    // ),
    );
  }
}