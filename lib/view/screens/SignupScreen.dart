import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:untitled/view/components/customButton.dart';
import 'package:untitled/view/components/customTextField.dart';
import 'package:untitled/view/components/squareTile.dart';
import 'package:untitled/view/screens/homeScreen.dart';

import 'loginScreen.dart';

class SignupScreen extends StatefulWidget {
  var ontap;
   SignupScreen({super.key,required this.ontap});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 6.h,
                ),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Lets create an account for you",
                  style: TextStyle(color: Colors.grey[700], fontSize: 17.sp),
                ),
                SizedBox(
                  height: 4.h,
                ),
                CustomTextField(
                  controller: emailController,
                  hint: "Enter your email",
                  obsecureText: false,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextField(
                    controller: passwordController,
                    hint: "Enter your password",
                    obsecureText: true),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextField(
                    controller: confirmPasswordController,
                    hint: "Confirm your password",
                    obsecureText: true),
                SizedBox(
                  height: 2.h,
                ),

                SizedBox(
                  height: 2.h,
                ),
                CustomButton(
                  text: "Sign Up",
                  tap: signUp,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Divider(
                        thickness: 2,
                      )),
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 4.w),
                              child: Text(
                                "Or continue with",
                                style: TextStyle(color: Colors.grey[700]),
                              ))),
                      const Expanded(
                          child: Divider(
                        thickness: 2,
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 3.w),
                      child: SquareTile(path: "assets/images/apple.png"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w, left: 3.w),
                      child: SquareTile(path: "assets/images/google.png"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                InkWell(
                  onTap: widget.ontap,
                  child: RichText(
                    text: TextSpan(
                      text: 'Already  a member ? ',
                      style: TextStyle(color: Colors.grey[700]),
                      children: const <TextSpan>[
                        TextSpan(
                            text: 'Login now',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  signUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        Get.snackbar("Required", "Please enter credentials !",
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            icon: Icon(Icons.warning_amber_rounded));
      }

      if (passwordController.text != confirmPasswordController.text) {
        Get.snackbar("Required", "Please confirm your password !",
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            icon: Icon(Icons.warning_amber_rounded));
      }
      else{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

      }
      Navigator.pop(context);

    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException caught: ${e.code}");
      if (e.code == 'invalid-email') {
        Get.snackbar("Required", "Invalid email  !",
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            icon: Icon(Icons.warning_amber_rounded));
      } else if (e.code == "invalid-credential") {
        Get.snackbar("Incorrect", " Please enter correct credentials!",
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            icon: Icon(Icons.warning_amber_rounded));
      }
      Navigator.pop(context);
    }


  }
}
