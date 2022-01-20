import 'package:checkbox_formfield/checkbox_list_tile_formfield.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:paintracker/Pages/doctorappointment.dart';
import 'package:paintracker/Pages/preview.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';

final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
var currentUser = auth.FirebaseAuth.instance.currentUser;
//String? uid = _firebaseAuth.currentUser?.uid.toString();
final CollectionReference ref =  FirebaseFirestore.instance.collection("users") ;
class PainLevel extends StatefulWidget {
  const PainLevel({Key? key}) : super(key: key);

  @override
  _PainLevelState createState() => _PainLevelState();
}

class _PainLevelState extends State<PainLevel> {
  String textnote= '';
  double _value = 0.0;
  double _value1= 0.0;
  double _value2= 0.0;double _value3= 0.0;double _value4= 0.0;double _value5= 0.0;double _value6= 0.0;
  double _value7= 0.0;double _value8= 0.0;double _value9= 0.0;double _value10= 0.0;double _value11= 0.0;
  double _value12= 0.0;double _value13= 0.0;double _value14= 0.0;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final List<String> pain = ['Head','Neck','Chest','Upper Abdomen','Lower Abdomen','Left Shoulder','Right Shoulder','Left Elbow',
    'Right Elbow','Left Hand','Right Hand','Left Pulm', 'Right Pulm', 'Left Thigh','Right Thigh','Left Knee', 'Right Knee',
  'Left Leg','Right Leg','Left Feet','Right Feet'];
  final List<String> pain1 = ['Head','Neck','Chest','Upper Abdomen','Lower Abdomen','Left Shoulder','Right Shoulder','Left Elbow',
    'Right Elbow','Left Hand','Right Hand','Left Pulm', 'Right Pulm', 'Left Thigh','Right Thigh','Left Knee', 'Right Knee',
    'Left Leg','Right Leg','Left Feet','Right Feet'];
  final List<String> pain2 = ['Head','Neck','Chest','Upper Abdomen','Lower Abdomen','Left Shoulder','Right Shoulder','Left Elbow',
    'Right Elbow','Left Hand','Right Hand','Left Pulm', 'Right Pulm', 'Left Thigh','Right Thigh','Left Knee', 'Right Knee',
    'Left Leg','Right Leg','Left Feet','Right Feet'];
  String _currentpain1 = '';
  String _currentpain2 = '';
  String _currentpain3 = '';
  String _diabetes = 'No';
  String _heart = 'No';
  String _thyroid = 'No';
  String _bloodpressure = 'No';
  String _arthritis = 'No';
  String _yes = 'Yes';
  String _no = 'No';


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
      body:
      SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Text('Pain Levels',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
               Form(
                 key: _formkey,
                   child: Container(
                     padding: EdgeInsets.all(10),
                     child: Column(
                       children: [
                         SingleChildScrollView(
                           physics: AlwaysScrollableScrollPhysics(),
                           child: DropdownButtonFormField<String>(
                             hint: Text('Place of Pain 1'),
                             decoration: InputDecoration(
                               border: OutlineInputBorder() ,),
                             items: pain.map((sugar1) {
                               return DropdownMenuItem(
                                 value: sugar1,
                                 child: Text("$sugar1"),);}).toList(),
                             onChanged: (val) => setState(() => _currentpain1 = val!),),),

                         const SizedBox(
                           height: 8,
                         ),
                         SingleChildScrollView(
                           physics: AlwaysScrollableScrollPhysics(),
                           child: DropdownButtonFormField<String>(
                             hint: Text('Place of Pain 2'),
                             decoration: InputDecoration(
                               border: OutlineInputBorder() ,),
                             items: pain1.map((sugar1) {
                               return DropdownMenuItem(
                                 value: sugar1,
                                 child: Text("$sugar1"),);}).toList(),
                             onChanged: (val) => setState(() => _currentpain2 = val!),),
                         ),

                         const SizedBox(
                           height: 8,
                         ),
                         SingleChildScrollView(
                           physics: AlwaysScrollableScrollPhysics(),
                           child: DropdownButtonFormField<String>(
                             hint: Text('Place of Pain 3'),
                             decoration: InputDecoration(
                               border: OutlineInputBorder() ,),
                             items: pain2.map((sugar1) {
                               return DropdownMenuItem(
                                 value: sugar1,
                                 child: Text("$sugar1"),);}).toList(),
                             onChanged: (val) => setState(() => _currentpain3 = val!),),
                         ),
                         SizedBox(height: 8,),
                         Text('Please slide the levels to let us know how you are feeling...',style: TextStyle(fontWeight: FontWeight.bold),),
                         SizedBox(height: 8,),
                         Text('Level 0: None, Level 1: Mild, Level 2: Moderate, Level 3: Severe, Level 4: Worst',),
                         //throbbing
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           mainAxisSize: MainAxisSize.max,
                           children: [
                             Text('Throbbing',style: TextStyle(fontWeight: FontWeight.bold)),
                             Expanded(
                               child: Slider(
                                 min: 0.0,
                                 max: 4,
                                 divisions: 4,
                                 label: _value.round().toString(),
                                 activeColor: Colors.teal.shade400,
                                 inactiveColor: Colors.teal.shade200,
                                 value: _value,
                                 onChanged: (newvalue) {
                                   setState(() {
                                     _value = newvalue;

                                   });
                                 },
                               ),
                             ),
                           ],
                         ),
                         //shooting
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           mainAxisSize: MainAxisSize.max,
                           children: [
                             Text('Shooting  ',style: TextStyle(fontWeight: FontWeight.bold)),
                             Expanded(
                               child: Slider(
                                 min: 0.0,
                                 max: 4,
                                 divisions: 4,
                                 label: _value1.round().toString(),
                                 activeColor: Colors.teal.shade400,
                                 inactiveColor: Colors.teal.shade200,
                                 value: _value1,
                                 onChanged: (newvalue) {
                                   setState(() {
                                     _value1 = newvalue;

                                   });
                                 },
                               ),
                             ),
                           ],
                         ),
                         //stabbing
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           mainAxisSize: MainAxisSize.max,
                           children: [
                             Text('Stabbing  ',style: TextStyle(fontWeight: FontWeight.bold)),
                             Expanded(
                               child: Slider(
                                 min: 0.0,
                                 max: 4,
                                 divisions: 4,
                                 label: _value2.round().toString(),
                                 activeColor: Colors.teal.shade400,
                                 inactiveColor: Colors.teal.shade200,
                                 value: _value2,
                                 onChanged: (newvalue) {
                                   setState(() {
                                     _value2 = newvalue;
                                   });
                                 },
                               ),
                             ),
                           ],
                         ),
                         //SHarp
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           mainAxisSize: MainAxisSize.max,
                           children: [
                             Text('Sharp        ',style: TextStyle(fontWeight: FontWeight.bold)),
                             Expanded(
                               child: Slider(
                                 min: 0.0,
                                 max: 4,
                                 divisions: 4,
                                 label: _value3.round().toString(),
                                 activeColor: Colors.teal.shade400,
                                 inactiveColor: Colors.teal.shade200,
                                 value: _value3,
                                 onChanged: (newvalue) {
                                   setState(() {
                                     _value3 = newvalue;
                                   });
                                 },
                               ),
                             ),
                           ],
                         ),
                         //Cramping
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           mainAxisSize: MainAxisSize.max,
                           children: [
                             Text('Cramping ',style: TextStyle(fontWeight: FontWeight.bold)),
                             Expanded(
                               child: Slider(
                                 min: 0.0,
                                 max: 4,
                                 divisions: 4,
                                 label: _value4.round().toString(),
                                 activeColor: Colors.teal.shade400,
                                 inactiveColor: Colors.teal.shade200,
                                 value: _value4,
                                 onChanged: (newvalue) {
                                   setState(() {
                                     _value4 = newvalue;

                                   });
                                 },
                               ),
                             ),
                           ],
                         ),
                         //Gnawing
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           mainAxisSize: MainAxisSize.max,
                           children: [
                             Text('Gnawing   ',style: TextStyle(fontWeight: FontWeight.bold)),
                             Expanded(
                               child: Slider(
                                 min: 0.0,
                                 max: 4,
                                 divisions: 4,
                                 label: _value5.round().toString(),
                                 activeColor: Colors.teal.shade400,
                                 inactiveColor: Colors.teal.shade200,
                                 value: _value5,
                                 onChanged: (newvalue) {
                                   setState(() {
                                     _value5 = newvalue;
                                   });
                                 },
                               ),
                             ),
                           ],
                         ),
                         //Hot/Burning
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           mainAxisSize: MainAxisSize.max,
                           children: [
                             Text('Burning    ',style: TextStyle(fontWeight: FontWeight.bold)),
                             Expanded(
                               child: Slider(
                                 min: 0.0,
                                 max: 4,
                                 divisions: 4,
                                 label: _value6.round().toString(),
                                 activeColor: Colors.teal.shade400,
                                 inactiveColor: Colors.teal.shade200,
                                 value: _value6,
                                 onChanged: (newvalue) {
                                   setState(() {
                                     _value6 = newvalue;
                                   });
                                 },
                               ),
                             ),
                           ],
                         ),
                         //Ache
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           mainAxisSize: MainAxisSize.max,
                           children: [
                             Text('Aching     ',style: TextStyle(fontWeight: FontWeight.bold)),
                             Expanded(
                               child: Slider(
                                 min: 0.0,
                                 max: 4,
                                 divisions: 4,
                                 label: _value7.round().toString(),
                                 activeColor: Colors.teal.shade400,
                                 inactiveColor: Colors.teal.shade200,
                                 value: _value7,
                                 onChanged: (newvalue) {
                                   setState(() {
                                     _value7 = newvalue;
                                   });
                                 },
                               ),
                             ),
                           ],
                         ),
                         //heavy
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           mainAxisSize: MainAxisSize.max,
                           children: [
                             Text('Heavy      ',style: TextStyle(fontWeight: FontWeight.bold)),
                             Expanded(
                               child: Slider(
                                 min: 0.0,
                                 max: 4,
                                 divisions: 4,
                                 label: _value8.round().toString(),
                                 activeColor: Colors.teal.shade400,
                                 inactiveColor: Colors.teal.shade200,
                                 value: _value8,
                                 onChanged: (newvalue) {
                                   setState(() {
                                     _value8 = newvalue;

                                   });
                                 },
                               ),
                             ),
                           ],
                         ),
                         //Tender
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           mainAxisSize: MainAxisSize.max,
                           children: [
                             Text('Tender    ',style: TextStyle(fontWeight: FontWeight.bold)),
                             Expanded(
                               child: Slider(
                                 min: 0.0,
                                 max: 4,
                                 divisions: 4,
                                 label: _value9.round().toString(),
                                 activeColor: Colors.teal.shade400,
                                 inactiveColor: Colors.teal.shade200,
                                 value: _value9,
                                 onChanged: (newvalue) {
                                   setState(() {
                                     _value9 = newvalue;
                                   });
                                 },
                               ),
                             ),
                           ],
                         ),
                         //Splitting
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           mainAxisSize: MainAxisSize.max,
                           children: [
                             Text('Splitting  ',style: TextStyle(fontWeight: FontWeight.bold)),
                             Expanded(
                               child: Slider(
                                 min: 0.0,
                                 max: 4,
                                 divisions: 4,
                                 label: _value10.round().toString(),
                                 activeColor: Colors.teal.shade400,
                                 inactiveColor: Colors.teal.shade200,
                                 value: _value10,
                                 onChanged: (newvalue) {
                                   setState(() {
                                     _value10 = newvalue;

                                   });
                                 },
                               ),
                             ),
                           ],
                         ),
                         //Tiring
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           mainAxisSize: MainAxisSize.max,
                           children: [
                             Text('Tiring      ',style: TextStyle(fontWeight: FontWeight.bold)),
                             Expanded(
                               child: Slider(
                                 min: 0.0,
                                 max: 4,
                                 divisions: 4,
                                 label: _value11.round().toString(),
                                 activeColor: Colors.teal.shade400,
                                 inactiveColor: Colors.teal.shade200,
                                 value: _value11,
                                 onChanged: (newvalue) {
                                   setState(() {
                                     _value11 = newvalue;

                                   });
                                 },
                               ),
                             ),
                           ],
                         ),
                         //Sickening
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           mainAxisSize: MainAxisSize.max,
                           children: [
                             Text('Sickening',style: TextStyle(fontWeight: FontWeight.bold)),
                             Expanded(
                               child: Slider(
                                 min: 0.0,
                                 max: 4,
                                 divisions: 4,
                                 label: _value12.round().toString(),
                                 activeColor: Colors.teal.shade400,
                                 inactiveColor: Colors.teal.shade200,
                                 value: _value12,
                                 onChanged: (newvalue) {
                                   setState(() {
                                     _value12 = newvalue;

                                   });
                                 },
                               ),
                             ),
                           ],
                         ),
                         //fearful
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           mainAxisSize: MainAxisSize.max,
                           children: [
                             Text('Fearful     ',style: TextStyle(fontWeight: FontWeight.bold)),
                             Expanded(
                               child: Slider(
                                 min: 0.0,
                                 max: 4,
                                 divisions: 4,
                                 label: _value13.round().toString(),
                                 activeColor: Colors.teal.shade400,
                                 inactiveColor: Colors.teal.shade200,
                                 value: _value13,
                                 onChanged: (newvalue) {
                                   setState(() {
                                     _value13 = newvalue;

                                   });
                                 },
                               ),
                             ),
                           ],
                         ),
                         //Punishing
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           mainAxisSize: MainAxisSize.max,
                           children: [
                             Text('Punishing',style: TextStyle(fontWeight: FontWeight.bold)),
                             Expanded(
                               child: Slider(
                                 min: 0.0,
                                 max: 4,
                                 divisions: 4,
                                 label: _value14.round().toString(),
                                 activeColor: Colors.teal.shade400,
                                 inactiveColor: Colors.teal.shade200,
                                 value: _value14,
                                 onChanged: (newvalue) {
                                   setState(() {
                                     _value14 = newvalue;

                                   });
                                 },
                               ),
                             ),
                           ],
                         ),
                         TextField(
                             maxLines: 5,
                             minLines: 1,
                             textInputAction: TextInputAction.next,
                             decoration: const InputDecoration(
                               border: OutlineInputBorder(

                               ),
                               hintText: 'Write Your Comment Here....',
                             ),
                             onChanged: (value){
                               textnote = value;
                             }
                         ),
                         const SizedBox(
                           height: 8,
                         ),
                         ElevatedButton(
                           onPressed: (){
                             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Preview(place1: _currentpain1, place2:_currentpain2, place3: _currentpain3, throbbing: _value, shooting: _value1, stabbing: _value2, sharp: _value3,
                                 cramping: _value4, gnawing: _value5, burning: _value6, aching: _value7, heavy: _value8, tender: _value9, splitting: _value10, tiring: _value11, sickening: _value12, fearful: _value13, punishing: _value14,textnote: textnote)));
                             ref.doc(currentUser?.email).update({
                               'uid': currentUser?.uid,
                               'Place of Pain 1': _currentpain1,
                               'Place of pain 2': _currentpain2,
                               'Place of pain 3': _currentpain3,
                               'throbbing': _value,
                               'shooting': _value1,
                               'stabbing': _value2,
                               'sharp': _value3,
                               'cramping': _value4,
                               'gnawing': _value5,
                               'burning': _value6,
                               'aching': _value7,
                               'heavy': _value8,
                               'tender': _value9,
                               'splitting': _value10,
                               'tiring': _value11,
                               'sickening': _value12,
                               'fearful': _value13,
                               'punishing': _value14,
                               'Comment': textnote


                             }).then((value)=>print('user added') );
                             },
                             style: ButtonStyle(
                               backgroundColor:  MaterialStateProperty.all<Color>(Colors.teal.shade400) ,
                               shadowColor: MaterialStateProperty.all<Color>(Colors.teal.shade200.withOpacity(1)),
                               elevation: MaterialStateProperty.resolveWith<double>(
                                     (Set<MaterialState> states) {
                                   if (states.contains(MaterialState.pressed))
                                     return 10.0;
                                   return 15.0;
                                 },
                               ),
                               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                 RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(10.0),
                                   //side: BorderSide(color: Colors.red)
                                 ),
                               ),
                             ),
                             child: Text('Complete')),

                         const SizedBox(
                           height: 8,
                         ),

                         Text('Do you want doctor\'s appointment?', style: TextStyle(fontSize: 17)),

                         ElevatedButton(onPressed: (){
                           Navigator.pushNamed(context, '/home');
                           ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                               backgroundColor: Colors.teal,
                               content: Text(
                                 'Your Appointment is Confirmed!',
                                 style: TextStyle(fontSize: 18.0),
                               ),
                             ),
                           );
                           },

                             style: ButtonStyle(
                               backgroundColor:  MaterialStateProperty.all<Color>(Colors.teal.shade400) ,
                               shadowColor: MaterialStateProperty.all<Color>(Colors.teal.shade200.withOpacity(1)),
                               elevation: MaterialStateProperty.resolveWith<double>(
                                     (Set<MaterialState> states) {
                                   if (states.contains(MaterialState.pressed))
                                     return 10.0;
                                   return 15.0;
                                 },
                               ),
                               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                 RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(10.0),
                                   //side: BorderSide(color: Colors.red)
                                 ),
                               ),
                             ),
                             child: Text('Confirm'),
                           )

                       ],
                     ),
                   ),), ],
          ),
        ),
      ),
    );
  }
}

