import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';

import '../../utility/common_functions.dart';

class NoSuchProduct extends StatefulWidget {
  const NoSuchProduct({super.key});

  @override
  State<NoSuchProduct> createState() => _NoSuchProductState();
}

class _NoSuchProductState extends State<NoSuchProduct>
    with TickerProviderStateMixin {
  late FlutterGifController controller;

  @override
  void initState() {
    super.initState();
    controller = FlutterGifController(vsync: this);
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        bottom: 30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset('assets/line_icon.png'),
          ),
          Text(
            'Add Product',
            style: bodyLarge(),
          ),
          const SizedBox(height: 30),
          Text(
            'We do not have this product yet! Please submit this to us so we can verify this product.',
            style: bodyMedium(),
          ),
          const SizedBox(height: 30),
          Center(
            child: GifImage(
              height: 100,
              width: 100,
              controller: controller,
              image: const AssetImage("assets/no_product.gif"),
            ),
          )
        ],
      ),
    );
  }
}
