import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Screen"),
      leading: InkWell(
          onTap: (){
            FirebaseAuth.instance.signOut();
          },
          child: Icon(Icons.logout)),
      ),
      body:  Center(
        child: Text("Logged IN "+ user.email.toString()),
      ),
    );
  }
}
