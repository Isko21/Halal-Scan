import 'package:flutter/material.dart';
import 'package:halal_scan/utility/common_functions.dart';
import 'package:halal_scan/utility/halal_status.dart';
import 'package:halal_scan/widgets/product_details_appbar.dart';

class ProductDetailPage extends StatelessWidget {
  final String title;
  final String url;
  final HalalStatus status;
  const ProductDetailPage(
      {super.key,
      required this.status,
      required this.title,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductDetailsAppBar(status: status),
      body: Stack(alignment: AlignmentDirectional.topCenter, children: [
        Column(
          children: [
            Container(
              height: 150,
              color: getHalalColor(status),
            )
          ],
        ),
        SizedBox(
          height: 200,
          width: 300,
          child: Card(
              child: Row(
            children: [
              Image.network(
                url,
              ),
              Text(title)
            ],
          )),
        ),
      ]),
    );
  }
}
