import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:halal_scan/models/config.dart';
import 'package:halal_scan/models/product.dart';
import 'package:halal_scan/widgets/appbar.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  final title = TextEditingController();
  final barcode = TextEditingController();
  final reviewer = TextEditingController();
  final halal = TextEditingController();
  final category = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');

    return Scaffold(
      appBar: const DetailAppBar(
        title: 'SAVED CART',
        name: CustomPageName.save,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          TextField(
            controller: title,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              labelText: 'Title',
              hintText: 'Tymbark Banana',
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.cyan),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: barcode,
            decoration: const InputDecoration(
              labelText: 'Barcode',
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.cyan),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: halal,
            autofillHints: const ['halal', 'haram', 'mushbooh'],
            decoration: const InputDecoration(
              labelText: 'Status',
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.cyan),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: category,
            autofillHints: const ['bread', 'milk', 'dessert', 'drink', 'other'],
            decoration: const InputDecoration(
              labelText: 'Category',
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.cyan),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: reviewer,
            decoration: const InputDecoration(
              labelText: 'Reviewer',
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.cyan),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                final newProduct = CustomProductModel(
                  category: getCustomProductCategory(category.text),
                  id: barcode.text,
                  name: title.text,
                  status: getCustomProductStatus(halal.text),
                  company: '',
                  price: '16',
                  reviewedBy: reviewer.text,
                  reviewedAt: Timestamp.now(),
                  faceUrl:
                      'https://www.carrefour.pl/images/product/org/oreo-original-ciastka-kakaowe-z-nadzieniem-o-smaku-waniliowym-176-g-16-sztuk-83gjgp.jpg',
                  backUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqicTD5oW1cjTlhIFjTckUYLqsXH3tdpQrUA&usqp=CAU',
                );
                addProduct(products, newProduct);
              },
              child: const Text('Write Data'))
        ]),
      ),
    );
  }
}
