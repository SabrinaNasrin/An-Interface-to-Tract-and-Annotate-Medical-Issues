import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paintracker/Pages/login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword>

{
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _isObscure = true;
  var _email ='';
  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Password Reset Email has been sent !',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.teal,
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
    final TextEditingController emailcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade400,
        elevation: 0.0,
        title: Text('Password Recovery',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.white), onPressed: () { Navigator.pop(context); },
        ),
      ),
      body: Stack(
        children: <Widget>[
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
                padding: EdgeInsets.fromLTRB(30.0,40.0,30,150.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('Enter your email address to reset the password',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 17.0,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 60.0,
                      // decoration: BoxDecoration(
                      //   color: Colors.teal.shade200,
                      //   borderRadius: BorderRadius.circular(16.0),
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
                            return 'Please Enter your Email';
                          }
                          if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                            return 'Please Enter a Valid Email!';
                          }
                          return null;
                        },

                      ),
                    ),
                    SizedBox(height: 20.0),

                    Container(
                      padding: EdgeInsets.symmetric(vertical: 1.0),
                      height: 50.0,
                      width: double.maxFinite,
                      child: ElevatedButton(onPressed: (){
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            _email = emailcontroller.text;
                          });
                          resetPassword();
                        }
                      },
                        style: ButtonStyle(
                          backgroundColor:  MaterialStateProperty.all<Color>(Colors.teal.shade900) ,
                          shadowColor: MaterialStateProperty.all<Color>(Colors.teal.shade200.withOpacity(0.8)),
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
                        child: Text('Send Email',
                            style: TextStyle(fontSize: 18,
                              fontFamily: 'OpenSans',
                              //letterSpacing: 1.5,
                              //fontWeight: FontWeight.bold,
                            )),
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
}
