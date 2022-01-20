import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:paintracker/Pages/login.dart';
import 'package:paintracker/Pages/wrapper.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState(){
    super.initState();
    _navigatetologin();

  }
  _navigatetologin() async{
    await Future.delayed(Duration(milliseconds: 3000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login()));
  }
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Image(
          image: AssetImage('Assets/stethoscope.png'),
        ),
        duration: 4000,
        splashTransition: SplashTransition.sizeTransition,
        backgroundColor: Colors.teal.shade600,
        nextScreen: Login());

  }
}