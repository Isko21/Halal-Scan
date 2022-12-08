import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halal_scan/pages/submain/product_details_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../models/config.dart';
import '../models/product.dart';
import '../utility/common_functions.dart';

class CustomProductWidget extends StatefulWidget {
  final CustomProductModel model;

  const CustomProductWidget({
    super.key,
    required this.model,
  });

  @override
  State<CustomProductWidget> createState() => _CustomProductWidgetState();
}

class _CustomProductWidgetState extends State<CustomProductWidget>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: CustomProductDetailPage(model: widget.model),
        withNavBar: false,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      ),
      child: Card(
        color: CustomColor.veryLightBackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.all(10),
                    color: CustomColor.lightBackColor,
                    child: Image.network(
                      widget.model.faceUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: 35,
                  margin: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7),
                      topRight: Radius.circular(7),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(7),
                    ),
                    color: Colors.white,
                  ),
                  child: IconButton(
                      iconSize: 20,
                      onPressed: () => print('hello'),
                      icon: Icon(
                        CupertinoIcons.heart,
                        color: CustomColor.darkBackColor,
                      )),
                )
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 100,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 10),
                        Text(widget.model.name, style: titleMedium()),
                        Text(
                          widget.model.company,
                          style: bodyMedium(),
                        ),
                      ],
                    ),
                    Text(
                      widget.model.price,
                      style: bodyLarge().copyWith(fontSize: 21),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 13),
              decoration: BoxDecoration(
                color: getHalalColor(widget.model.status),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(30),
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(100),
                ),
              ),
              height: 100,
              width: 70,
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(getHalalIcon(widget.model.status),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
