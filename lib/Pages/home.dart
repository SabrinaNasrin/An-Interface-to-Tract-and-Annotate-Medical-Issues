import 'package:flutter/material.dart';
import 'package:paintracker/Pages/login.dart';
import 'package:paintracker/Pages/createnewaccount.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:paintracker/Pages/Services/authservice.dart';
import 'package:paintracker/Pages/painlevel.dart';

import 'Services/authservice.dart';
final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
var currentUser = auth.FirebaseAuth.instance.currentUser;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        title: Text('Pain Tracker'),
        centerTitle: true,

      ),
      drawer: Drawer(

        child: ListView(
          padding: EdgeInsets.only(bottom:0.0),
          children:<Widget> [
            DrawerHeader(child: Icon(Icons.account_circle_sharp,
                color: Colors.white,
                size: 70),
              decoration: BoxDecoration(
                color:Colors.teal.shade400,
              ),
            ),

            ListTile(

              title: Text('Profile',
                  style: TextStyle(fontSize: 15.0,
                      color: Colors.black87)),
              onTap: (){
                Navigator.pushNamed(context,'/updateprofile');
              },
            ),
            ListTile(

              title: Text('Male',
                  style: TextStyle(fontSize: 15.0,
                      color: Colors.black87)),
              onTap: (){Navigator.pushNamed(context,'/male'); },
            ),

            ListTile(

              title: Text('Female',
                  style: TextStyle(fontSize: 15.0,
                      color: Colors.black87)),
              onTap: () {
                Navigator.pushNamed(context,'/female');
              } ,
            ),
            ListTile(

              title: Text('Feedback',
                  style: TextStyle(fontSize: 15.0,
                      color: Colors.black87)),
              onTap: (){ Navigator.pushNamed(context,'/doctorappointment');},
            ),
            ListTile(

              title: Text('Sign Out',
                  style: TextStyle(fontSize: 15.0,
                      color: Colors.black87)),
              onTap: () async {

                await authService.signOut();
                Navigator.popAndPushNamed(context, '/login' );
              } ,

            ),


          ],
        ),
      ),
      body:
        Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.teal.shade100,
                    Colors.teal.shade200,
                    Colors.teal.shade200,
                    Colors.teal.shade100,
                  ],
                  stops: [0.1,0.4,0.7,0.9],
                ),
              ),
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.fromLTRB(10,120, 10, 150),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                SizedBox.fromSize(
                size: Size(156, 156),
                child: InkWell(
                  splashColor: Colors.white,
                  child: ElevatedButton(onPressed: ()=> Navigator.pushNamed(context, '/updateprofile'),
                    style: ButtonStyle(
                      backgroundColor:  MaterialStateProperty.all<Color>(Colors.teal.shade400) ,
                      shadowColor: MaterialStateProperty.all<Color>(Colors.teal.shade300.withOpacity(1)),
                      elevation: MaterialStateProperty.resolveWith<double>((Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return 10.0;
                        return 15.0;
                      },),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),),),),
                    //side: BorderSide(color: Colors.red)),),),
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Icon(Icons.account_circle_sharp,
                        size: 50),
                        SizedBox(height:5),

                        Text('Profile',style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,)),

                      ],
                    ),

                  ),
                ),
              ),
                        SizedBox.fromSize(
                          size: Size(156, 156),
                          child: ElevatedButton(onPressed: ()=> Navigator.pushNamed(context, '/male'),
                            style: ButtonStyle(
                              backgroundColor:  MaterialStateProperty.all<Color>(Colors.teal.shade400) ,
                              shadowColor: MaterialStateProperty.all<Color>(Colors.black.withOpacity(1)),
                              elevation: MaterialStateProperty.resolveWith<double>((Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return 10.0;
                                return 15.0;
                              },),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),),),),
                            //side: BorderSide(color: Colors.red)),),),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.male,
                                    size: 50),
                                SizedBox(height:5),

                                Text('Male',style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'OpenSans',
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,))
                              ],
                            ),

                          ),
                        ),
                            ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox.fromSize(
                          size: Size(156, 156),
                          child: ElevatedButton(onPressed: ()=> Navigator.pushNamed(context, '/female'),
                            style: ButtonStyle(
                              backgroundColor:  MaterialStateProperty.all<Color>(Colors.teal.shade400) ,
                              shadowColor: MaterialStateProperty.all<Color>(Colors.teal.shade200.withOpacity(1)),
                              elevation: MaterialStateProperty.resolveWith<double>((Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return 10.0;
                                return 15.0;
                              },),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),),),),
                            //side: BorderSide(color: Colors.red)),),),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.female,
                                size: 50),
                                SizedBox(height:5),
                                Text('Female',style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'OpenSans',
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,)),
                              ],
                            ),

                          ),
                        ),

                        SizedBox.fromSize(
                          size: Size(156, 156),
                          child: ElevatedButton(onPressed: ()=> Navigator.pushNamed(context, '/doctorappointment'),
                            style: ButtonStyle(
                              backgroundColor:  MaterialStateProperty.all<Color>(Colors.teal.shade400) ,
                              shadowColor: MaterialStateProperty.all<Color>(Colors.teal.shade200.withOpacity(1)),
                              elevation: MaterialStateProperty.resolveWith<double>((Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return 10.0;
                                return 15.0;
                              },),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),),),),
                            //side: BorderSide(color: Colors.red)),),),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.feedback,
                                size: 50),
                                SizedBox(height:5),
                                Text('Feedback',style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'OpenSans',
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,)),
                              ],
                            ),

                          ),
                        ),
                      ],),
                  ],
                ),
              ),
            ),

          ],
        ),





    );
  }

}
