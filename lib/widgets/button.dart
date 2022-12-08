import 'package:flutter/material.dart';

import '../models/config.dart';
import '../utility/common_functions.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Function onTap;
  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minimumSize: Size(MediaQuery.of(context).size.width - 60, 45),
          backgroundColor: CustomColor.buttonColor),
      onPressed: () => onTap,
      child: Text(
        text,
        style: bodyMedium().copyWith(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
