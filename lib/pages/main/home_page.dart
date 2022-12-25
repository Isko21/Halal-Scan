import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:halal_scan/models/config.dart';
import 'package:halal_scan/widgets/appbar.dart';
import 'package:halal_scan/widgets/product_widget.dart';

import '../../models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  String scanBarcode = '';
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      scanBarcode = barcodeScanRes;
    });
  }

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'SCANHALAL', name: CustomPageName.home),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/halal-scan-91706.appspot.com/o/adImages%2Fad.jpg?alt=media&token=aab42c92-9356-461f-8645-61e6a39e0df8',
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            const SizedBox(height: 10),
            StreamBuilder<List<CustomProductModel>>(
              stream: readAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return SizedBox(
                    child: Text('${snapshot.error}'),
                  );
                } else if (snapshot.hasData) {
                  final products = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: products.map(buildProduct).toList(),
                  );
                } else {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildProduct(CustomProductModel product) =>
      CustomProductWidget(model: product);

  Stream<List<CustomProductModel>> readAllProducts() =>
      FirebaseFirestore.instance.collection('products').snapshots().map(
          (snapshot) => snapshot.docs
              .map((e) => CustomProductModel.fromJson(e.data()))
              .toList());
}
