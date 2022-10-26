import 'package:flutter/material.dart';
import 'package:halal_scan/utility/common_functions.dart';
import 'package:halal_scan/utility/halal_status.dart';

class ProductDetailsAppBar extends StatelessWidget with PreferredSizeWidget {
  final HalalStatus status;
  ProductDetailsAppBar({
    super.key,
    this.status = HalalStatus.mushbooh,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: getHalalColor(status),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Card(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
              ),
            ),
          ),
          Text(
            'Product Details',
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: Colors.white),
          ),
          InkWell(
            onTap: () {},
            child: const Card(
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.warning_rounded, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
