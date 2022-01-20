import 'package:flutter/material.dart';
import 'package:paintracker/Pages/Services/authservice.dart';
import 'package:provider/provider.dart';
import 'package:paintracker/Pages/user.dart';
import 'package:paintracker/Pages/home.dart';
import 'package:paintracker/Pages/login.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_,AsyncSnapshot<User?> snapshot){
        if (snapshot.connectionState == ConnectionState.active){
          final User? user = snapshot.data;
          return user == null? Login() : Home();

        }
        else{
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
    }
    );


  }
}
