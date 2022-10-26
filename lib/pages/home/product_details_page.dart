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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: ProductDetailsAppBar(status: status),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Column(
            children: [
              Container(
                height: 150,
                color: getHalalColor(status),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: size.width,
            height: size.height / 3.5,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [ 
                    Image(image: NetworkImage(url)),
                    const SizedBox(width: 20),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.displayLarge,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
