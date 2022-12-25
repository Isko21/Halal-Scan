import 'package:flutter/material.dart';

import '../models/config.dart';
import '../utility/common_functions.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double height;
  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          minimumSize: Size(MediaQuery.of(context).size.width, height),
          backgroundColor: CustomColor.buttonColor),
      onPressed:  onTap,
      child: Text(
        text,
        style: bodyMedium().copyWith(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
