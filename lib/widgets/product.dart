import 'package:flutter/material.dart';
import 'package:halal_scan/pages/home/product_details_page.dart';
import 'package:halal_scan/utility/common_functions.dart';
import 'package:halal_scan/utility/halal_status.dart';

class Product extends StatelessWidget {
  final String title;
  final String scanned;
  final String reviewed;
  final HalalStatus halalStatus;
  final String url;
  const Product({
    super.key,
    required this.title,
    required this.scanned,
    required this.reviewed,
    required this.url,
    this.halalStatus = HalalStatus.mushbooh,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(5),
          leading: Icon(
            getHalalIcon(halalStatus),
            color: getHalalColor(halalStatus),
            size: 40,
          ),
          title: Text(title),
          subtitle: Text('Scanned by $scanned, and reviewed by $reviewed'),
          trailing: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            child: Image(
              image: NetworkImage(url),
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(
                status: halalStatus,
                title: title,
                url: url,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
