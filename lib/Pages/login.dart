import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/input_border.dart';
import 'package:paintracker/Pages/user.dart';

import 'package:simple_animations/simple_animations.dart';
import 'package:paintracker/Pages/forgetpassword.dart';
import 'package:paintracker/Pages/createnewaccount.dart';
import 'package:paintracker/Pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paintracker/Pages/Services/authservice.dart';
import 'package:provider/provider.dart';
import 'package:paintracker/Pages/wrapper.dart';
final TextEditingController emailcontroller = TextEditingController();
final TextEditingController passwordcontroller = TextEditingController();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>
{
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _rememberMe = false;
  bool _isObscure = true;

  String _email ='';
  String _password = '';
  // void _toggleVisibility(){
  //   setState(() {
  //     _isObscure = !_isObscure;
  //   });
  // }


  bool ValidateAndSave(){
    final form = _formkey.currentState;
    if (form!.validate()){
      form.save();
      return true;
      //
    }
    return false;
  }
  void ValidateAndSubmit() async{
    if(ValidateAndSave()){
      try{
        final AuthService authService = AuthService();
        await authService.signInWithEmailAndPassword(_email,_password);
        print(_email);
        Navigator.popAndPushNamed(context, '/home');
    }
    catch(e){
        print('error');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'No user found for that email.',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Stack(
        children: <Widget> [

          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.teal.shade400,
                  Colors.teal.shade600,
                  Colors.teal.shade700,
                  Colors.teal.shade900,
                ],
                stops: [0.1,0.4,0.7,0.9],
              ),
            ),
          ),
          Container(
            height: double.infinity,
            child: Form(
              key: _formkey,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.fromLTRB(30.0,150.0,30,150.0),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 30.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 60.0,
                          // decoration: BoxDecoration(
                          //   color: Colors.teal.shade200,
                          //  borderRadius: BorderRadius.circular(4.0),
                          //   boxShadow: [
                          //     BoxShadow(
                          //       color: Colors.teal.shade900.withOpacity(0.5),
                          //       spreadRadius: 5,
                          //       blurRadius: 7,
                          //       offset: Offset(0,3), // changes position of shadow
                          //     ),
                          //   ],
                          // ),

                          child: TextFormField(
                            controller: emailcontroller,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                              color: Colors.white,),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                              ),
                              errorStyle:
                              TextStyle(

                                color: Colors.red,
                                fontWeight: FontWeight. bold,
                                fontSize: 13,),
                              //border: InputBorder.none,
                              //contentPadding: EdgeInsets.only(top:14.0),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              hintText: 'Enter your Email',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            validator:(value){
                              if(value!.isEmpty){
                                return 'Please Enter an Email';
                            }
                            if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                              return 'Please Enter a Valid Email!!';
                            }
                            return null;
                            },
                              onSaved: (value){
                                _email = value!;
                              },
                          ),
                          ),

                      ],
                    ),
                    SizedBox(height: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        SizedBox(height: 10.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 60.0,
                          // decoration: BoxDecoration(
                          //   color: Colors.teal.shade200,
                          //
                          //   borderRadius: BorderRadius.circular(4.0),
                          //   boxShadow: [
                          //     BoxShadow(
                          //       color: Colors.teal.shade900.withOpacity(0.5),
                          //       spreadRadius: 5,
                          //       blurRadius: 7,
                          //       offset: Offset(0,3), // changes position of shadow
                          //     ),
                          //   ],
                          // ),
                            child: TextFormField(
                              controller: passwordcontroller,
                              obscureText: _isObscure,

                              keyboardType: TextInputType.visiblePassword,
                              style: TextStyle(
                                color: Colors.white,),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2.0,
                                  ),
                                ),
                                 errorStyle:
                                 TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight. bold,
                                  fontSize: 13,),

                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),

                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.white,
                                      fontFamily: 'OpenSans'),
                                  // suffixIcon: IconButton(
                                  //     icon: Icon(
                                  //         _isObscure ? Icons.visibility : Icons.visibility_off,
                                  //         color: Colors.white),
                                  //     onPressed: _toggleVisibility,
                                  // )
                              ),
                              validator: (value1){
                                if(value1!.isEmpty)
                                {
                                  return 'Please a Enter Password';
                                }
                                if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value1))
                                {
                                  return 'Please a Enter Password';
                                }
                                return null;
                              },
                              onSaved: (value1){
                                _password = value1!;
                              },
                            ),
                        ),
                      ],
                    ),
                    //SizedBox(height: 2.0),
                    Container(
                      alignment: Alignment.centerRight,

                      child: TextButton(
                        onPressed: ()=> Navigator.pushNamed(context, '/forgetpassword'),

                        child: Text('Forget Password?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'OpenSans',
                          ),),

                      ),
                    ),
                    Container(
                      //padding: EdgeInsets.only(bottom: 5),
                      height: 15.0,
                      child: Row(
                        children: <Widget>[
                          Theme(data: ThemeData(unselectedWidgetColor: Colors.white),
                            child: Checkbox(
                              value: _rememberMe,
                              checkColor: Colors.black,
                              activeColor: Colors.white,
                              onChanged: (value){
                                setState(() {
                                 _rememberMe = !_rememberMe;
                                 //_onChange(value!);

                                });}
                            ),
                          ),
                          Text(
                            'Remember me',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 15.0),

                    Container(
                      padding: EdgeInsets.symmetric(vertical: 1.0),
                      height: 55.0,
                      width: double.infinity,
                      child: ElevatedButton(onPressed: ()=> ValidateAndSubmit(),

                        style: ButtonStyle(
                          backgroundColor:  MaterialStateProperty.all<Color>(Colors.teal.shade900) ,
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
                        child: Text('LOGIN',
                            style: TextStyle(fontSize: 18,
                              fontFamily: 'OpenSans',
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/createnewaccount'),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Don\'t have an account? Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            //TextSpan(
                            //text: 'Sign Up',
                            // style: TextStyle(
                            //color: Colors.black,
                            //fontSize: 17.0,
                            // fontWeight: FontWeight.bold,
                            //),
                            //),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  // void _onChange(bool value) {
  //   setState(() {
  //     _rememberMe = value;
  //     savepref(value);
  //   });
  // }
//   void savepref(bool value) async{
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     SharedPreferences.setMockInitialValues({});
//     _email = emailcontroller.text;
//     _password = passwordcontroller.text;
//     if(value){
//       if(ValidateAndSave()){
//
//           await pref.setString('email', _email);
//           await pref.setString('password', _password);
//           print('prf stored');
//       }
//     else{
//       print('email not valid');}
//   }
//     else
//       {
//         print('pref removed');
//       }
 }

