import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/view/screens/loginScreen.dart';

import 'homeScreen.dart';
import 'loginOrRegister.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData ){
            return HomeScreen();
          }else{
            return LoginOrRegister();
          }
        },
      ),
    );
  }
}
