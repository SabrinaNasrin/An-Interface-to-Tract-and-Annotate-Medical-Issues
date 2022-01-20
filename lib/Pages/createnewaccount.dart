import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paintracker/Pages/login.dart';
import 'Services/authservice.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({Key? key}) : super(key: key);

  @override
  _CreateNewAccountState createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _isObscure = true;
  String _email ='';
  String _password = '';
  String _username = '';
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
        await authService.createUserWithEmailAndPassword(_email,_password);
        print(_email);
        Navigator.popAndPushNamed(context, '/home');
      }
      catch(e){
        print('error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();
    final TextEditingController confirmpasswordcontroller = TextEditingController();
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 60.0,
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 15.0,),
                      Icon(
                        Icons.account_circle_sharp,
                        color: Colors.white,
                        size: 80,
                      ),
                      SizedBox(height: 15.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          SizedBox(height: 10.0),
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
                              keyboardType: TextInputType.name,
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

                                //contentPadding: EdgeInsets.only(top:14.0),
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.white,
                                ),
                                hintText: 'Username',
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                              validator: (value){
                                if(value!.isEmpty)
                                {
                                  return 'Please Enter Name';

                                }
                                if(value.length<3)
                                {
                                  return 'Name is too short';
                                }

                                return null;
                              },
                              onSaved: (value){
                                _username = value!;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          SizedBox(height: 10.0),
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
                            //       offset: Offset(0,3),
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

                                //contentPadding: EdgeInsets.only(top:14.0),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                hintText: 'Email',
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                              validator:(value){
                                if(value!.isEmpty){
                                  return 'Please Enter an Email';
                                }
                                if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                                  return 'Please Enter a Valid Email';
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
                      SizedBox(height: 5.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          SizedBox(height: 10.0),
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
                            //       offset: Offset(0,3),
                            //     ),
                            //   ],
                            // ),
                            child: TextFormField(
                              controller: passwordcontroller,
                              obscureText: _isObscure,
                              keyboardType: TextInputType.name,
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
                                  //     onPressed: () {
                                  //       setState(() {
                                  //         _isObscure = !_isObscure;
                                  //       });
                                  //     })
                              ),
                              validator: (value){
                                if(value!.isEmpty)
                                {
                                  return 'Please a Enter Password';
                                }
                                if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value))
                                {
                                  return 'Please Enter a Valid Password';
                                }
                                return null;
                              },
                              onSaved: (value){
                                _password = value!;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
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
                              controller: confirmpasswordcontroller,
                              obscureText:_isObscure,
                              keyboardType: TextInputType.name,
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
                                 // contentPadding: EdgeInsets.only(top:14.0),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(color: Colors.white,
                                      fontFamily: 'OpenSans'),
                                  // suffixIcon: IconButton(
                                  //     icon: Icon(
                                  //         _isObscure ? Icons.visibility : Icons.visibility_off,
                                  //         color: Colors.white),
                                  //     onPressed: () {
                                  //       setState(() {
                                  //         _isObscure = !_isObscure;
                                  //       });
                                  //     })
                              ),
                              validator: (value){
                                if(value!.isEmpty)
                                {
                                  return 'Please a Enter Password';
                                }
                                if(passwordcontroller.text!=confirmpasswordcontroller.text){
                                  return "Password does not match";
                                }

                                return null;
                              },
                              onSaved: (value){
                                _password = value!;
                              },
                            ),
                          ),
                        ],
                      ),
                      //SizedBox(height: 2.0),


                      SizedBox(height: 15.0),

                      Container(
                        padding: EdgeInsets.symmetric(vertical: 1.0),
                        height: 55.0,
                        width: double.infinity,
                        child: ElevatedButton(onPressed: ()=> ValidateAndSubmit(),
                          style: ButtonStyle(
                            backgroundColor:  MaterialStateProperty.all<Color>(Colors.teal.shade900.withOpacity(0.8)) ,
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
                          child: Text('Register',
                              style: TextStyle(fontSize: 18,
                                fontFamily: 'OpenSans',
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      GestureDetector(
                        onTap: () => Navigator.popAndPushNamed(context, '/login'),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Already have an account?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
      ),
    );
  }
}
