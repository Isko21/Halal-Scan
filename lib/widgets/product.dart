import 'package:flutter/material.dart';
import 'package:halal_scan/pages/home/product_details_page.dart';
import 'package:halal_scan/utility/common_functions.dart';
import 'package:halal_scan/utility/halal_status.dart';
import 'package:timeago/timeago.dart' as timeago;

class Product extends StatelessWidget {
  final String title;
  final String scanned;
  final String reviewed;
  final HalalStatus halalStatus;
  final DateTime dateTime;
  final String url;
  const Product({
    super.key,
    required this.title,
    required this.scanned,
    required this.reviewed,
    required this.url,
    required this.dateTime,
    this.halalStatus = HalalStatus.mushbooh,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(5),
          leading: Icon(
            getHalalIcon(halalStatus),
            color: getHalalColor(halalStatus),
            size: 40,
          ),
          title: Text(title),
          subtitle: Text(timeago.format(dateTime)),
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
