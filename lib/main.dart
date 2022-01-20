import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:paintracker/Pages/Services/authservice.dart';
import 'package:paintracker/Pages/doctorappointment.dart';
import 'package:paintracker/Pages/loading.dart';
import 'package:paintracker/Pages/home.dart';
import 'package:paintracker/Pages/login.dart';
import 'package:paintracker/Pages/forgetpassword.dart';
import 'package:paintracker/Pages/createnewaccount.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paintracker/Pages/painlevel.dart';
import 'package:provider/provider.dart';
import 'package:paintracker/Pages/wrapper.dart';
import 'package:paintracker/Pages/Services/authservice.dart';
import 'package:paintracker/Pages/updateprofile.dart';
import 'Pages/female.dart';
import 'Pages/male.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_)=>AuthService(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => Loading(),
          '/Wrapper':(context)=> Wrapper(),
          '/home': (context) => Home(),
          '/login': (context) => Login(),
          '/forgetpassword': (context) => ForgotPassword(),
          '/createnewaccount': (context)=> CreateNewAccount(),
          '/updateprofile':(context)=> UpdateProfile(),
          '/male' : (context) => Male(),
          '/female': (context) => Female(),
          '/painlevel':(context) => PainLevel(),
          '/doctorappointment' : (context) => DoctorAppointment(),


        },

      ),
    );
  }
}

