import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class SquareTile extends StatelessWidget {
  final String path;
  const SquareTile({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200]
      ),
      child: Image.asset(path),
      height: 8.h,
    );
  }
}
