import 'package:checkbox_formfield/checkbox_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';
import 'package:firebase_core/firebase_core.dart';
import 'package:paintracker/Pages/preview.dart';
import 'package:paintracker/Pages/user.dart';

//void main() => runApp(const UpdateProfile());

final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
var currentUser = auth.FirebaseAuth.instance.currentUser;
//String? uid = _firebaseAuth.currentUser?.uid.toString();
final CollectionReference ref =  FirebaseFirestore.instance.collection("users") ;

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade400,
          elevation: 0.0,
          title: Text('Health Profile', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body:

          const MyStatelessWidget(),

      ),
    );
  }
}

class MyStatelessWidget extends StatefulWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  State<MyStatelessWidget> createState() => _MyStatelessWidgetState();

}
class _MyStatelessWidgetState extends State<MyStatelessWidget> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formkey1 = GlobalKey<FormState>();
  int _activeStepIndex = 0;
  final List<String> Gender = ['Male','Female','Third Gender'];
  final List<String> BloodGroup = ['A+','A-','B+','B-','AB+','AB-','0+','0-'];
  String _currentbloodgroup ='';
  String _currentgender = '';
  String _diabetes = 'No';
  String _heart = 'No';
  String _thyroid = 'No';
  String _bloodpressure = 'No';
  String _arthritis = 'No';
  String _yes = 'Yes';
  String _no = 'No';


  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();




  List<Step> stepList() => [

    Step(
      state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
      isActive: _activeStepIndex >= 0,
      title: const Text('Patient Info'),
      content: Form(
        key: _formkey,
        child: Container(
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full Name',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Age',
                ),

              ),
              const SizedBox(height: 8,),
              DropdownButtonFormField<String>(

                hint: Text('Gender'),
                decoration: InputDecoration(
                  border: OutlineInputBorder() ,
                ),
                items: Gender.map((sugar1) {
                  return DropdownMenuItem(
                    value: sugar1,
                    child: Text("$sugar1"),);}).toList(),
                onChanged: (val) => setState(() => _currentgender = val!),

              ),
              const SizedBox(height: 8,),
              DropdownButtonFormField<String>(
                hint:  Text('Blood Group'),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  //labelText: 'Age',
                ),
                items: BloodGroup.map((sugar){
                  return DropdownMenuItem(
                    value: sugar,child: Text("$sugar"),);
                }).toList(),
                onChanged: (val) => setState(() => _currentbloodgroup = val!),),

            ],
          ),
        ),
      ),
    ),
    Step(
        state:
        _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 1,
        title: const Text('Comorbidity'),
        content: Form(
          key: _formkey1,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(
                  height: 8,
                ),
                Text('Please check all that applies:', style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),),
                CheckboxListTileFormField(
                  title: Text('Diabetes'),
                  onChanged: (value) {
                    if (value) {
                      print("ListTile Checked :)");
                      setState(() {
                        _diabetes = _yes;
                      });
                    } else {
                      print("ListTile Not Checked :(");
                      setState(() {
                        _diabetes = _no;
                      });
                    }
                  },
                ),
                CheckboxListTileFormField(
                  title: Text('Heart Disease'),
                  onChanged: (value) {
                    if (value) {
                      print("ListTile Checked :)");
                      setState(() {
                        _heart = _yes;
                      });
                    } else {
                      print("ListTile Not Checked :(");
                      setState(() {
                        _heart = _no;
                      });
                    }
                  },
                ),
                CheckboxListTileFormField(
                  title: Text('Arthritis'),
                  onChanged: (value) {
                    if (value) {
                      print("ListTile Checked :)");
                      setState(() {
                        _arthritis = _yes;
                      });
                    } else {
                      print("ListTile Not Checked :(");
                      setState(() {
                        _arthritis = _no;
                      });
                    }
                  },
                ),
                CheckboxListTileFormField(
                  title: Text('Thyroid'),
                  onChanged: (value) {
                    if (value) {
                      print("ListTile Checked :)");
                      setState(() {
                        _thyroid = _yes;
                      });
                    } else {
                      print("ListTile Not Checked :(");
                      setState(() {
                        _thyroid = _no;
                      });
                    }
                  },
                ),
                CheckboxListTileFormField(
                  title: Text('Blood Pressure'),
                  onChanged: (value) {
                    if (value) {
                      print("ListTile Checked :)");
                      setState(() {
                        _bloodpressure = _yes;
                      });
                    } else {
                      print("ListTile Not Checked :(");
                      setState(() {
                        _bloodpressure = _no;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        )),
    Step(
        state: StepState.complete,
        isActive: _activeStepIndex >= 2,
        title: const Text('Confirm'),
        content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Name: ${name.text}',style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold),),
                const SizedBox(height: 8,),
                Text('Age: ${email.text}',style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold),),
                const SizedBox(height: 8,),
                Text('Gender : $_currentgender',style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold),),
                const SizedBox(height: 8,),
                Text('BloodGroup : $_currentbloodgroup',style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold),),
                const SizedBox(height: 8,),
                Text('Diabetes: $_diabetes',style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold),),
                const SizedBox(height: 8,),
                Text('Heart Disease: $_heart',style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold),),
                const SizedBox(height: 8,),
                Text('Arthritis: $_arthritis',style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold),),
                const SizedBox(height: 8,),
                Text('Thyroid: $_thyroid',style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold),),
                const SizedBox(height: 8,),
                Text('Blood Pressure: $_bloodpressure',style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold),),
              ],
            )))
  ];


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.light(primary: Colors.teal),
      ),

      child: Stepper(
          steps: stepList(),
           type: StepperType.horizontal,
           currentStep: _activeStepIndex,
            onStepContinue: ()  {
            //final isLastStep = _activeStepIndex == stepList().length - 1;
            if (_activeStepIndex < (stepList().length- 1))
            {
              setState((){
                _activeStepIndex += 1;});}
            else {
              print('Submited');

              ref.doc(currentUser?.email).set({
                   'uid': currentUser?.uid,
                  'name': name.text,
                   'age': email.text,
                    'Gender' : _currentgender,
                    'Blood Group': _currentbloodgroup,
                    'Diabetes': _diabetes,
                    'Heart Disease': _heart,
                    'Arthritis': _arthritis,
                    'Thyroid':_thyroid,
                    'Blood pressure' : _bloodpressure
              }).then((value)=>print('user added') );

            }
            },
            onStepCancel: () {
                if (_activeStepIndex == 0)
                   {return;}
                setState(() {
                  _activeStepIndex -= 1;});
                },
           onStepTapped: (int index) {
                   setState(() {
                     _activeStepIndex = index;  });
                   },
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            final isLastStep = _activeStepIndex == stepList().length - 1;
            return Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed:
                        details.onStepContinue,

                     child: (isLastStep)? const Text('Submit'): const Text('Next'),
                  ),),
            const SizedBox(width: 1,height: 60.0),
            if (_activeStepIndex > 0)
              Expanded(
                child: ElevatedButton(
                  onPressed: details.onStepCancel,
                  child: const Text('Back'),
                ),
              )
          ],
        ),
      );
          }
          ),

    );

  }

}

