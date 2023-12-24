import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class CustomButton extends StatelessWidget {

  final String text;
  final tap;
   const CustomButton({super.key, required this.text,required this.tap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text(text,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold,color: Colors.white),),),
      ),
    );
  }
}
