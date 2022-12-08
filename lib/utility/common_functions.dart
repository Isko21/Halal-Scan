import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

Color getHalalColor(CustomProductStatus status) {
  return status == CustomProductStatus.halal
      ? const Color(0xFFDEEED6)
      : status == CustomProductStatus.haram
          ? const Color(0xFFF4D6CE)
          : status == CustomProductStatus.mushbooh
              ? const Color(0xFFF9D978).withOpacity(0.5)
              : const Color(0xFFC3C6C2);
}

String getHalalIcon(CustomProductStatus status) {
  return status == CustomProductStatus.halal
      ? 'assets/halal_icon.png'
      : status == CustomProductStatus.haram
          ? 'assets/haram_icon.png'
          : status == CustomProductStatus.mushbooh
              ? 'assets/unknown_icon.png'
              : 'assets/mushbooh_icon.png';
}

TextStyle bodyLarge() =>
    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

TextStyle bodyMedium() => const TextStyle(fontSize: 16);

TextStyle titleMedium() =>
    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

TextStyle titleLarge() =>
    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
