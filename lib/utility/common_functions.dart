import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halal_scan/utility/halal_status.dart';

Color getHalalColor(HalalStatus halalStatus) {
  return halalStatus == HalalStatus.halal
      ? Colors.green
      : halalStatus == HalalStatus.haram
          ? Colors.red
          : CupertinoColors.systemGrey;
}

IconData getHalalIcon(HalalStatus halalStatus) {
  return halalStatus == HalalStatus.halal
      ? Icons.check_circle_rounded
      : halalStatus == HalalStatus.haram
          ? CupertinoIcons.clear_circled_solid
          : CupertinoIcons.question_circle_fill;
}
