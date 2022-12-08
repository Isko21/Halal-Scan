import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:halal_scan/models/config.dart';
import 'package:halal_scan/models/product.dart';
import 'package:halal_scan/utility/common_functions.dart';
import 'package:halal_scan/widgets/appbar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../widgets/product_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
      resizeToAvoidBottomInset: true,
      appBar: const MainAppBar(
        title: 'EXPLORER',
        name: CustomPageName.search,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              autofocus: false,
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(CupertinoIcons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.qr_code_scanner_sharp, size: 20),
                  onPressed: () {
                    scanBarcodeNormal();
                  },
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: CustomColor.lightBackColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Search',
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: const [
                  CustomCategoryWidget(
                      name: 'Bakery', asset: 'assets/bread_icon.png'),
                  CustomCategoryWidget(
                      name: 'Dairy', asset: 'assets/milk_icon.png'),
                  CustomCategoryWidget(
                      name: 'Snacks', asset: 'assets/snack_icon.png'),
                  CustomCategoryWidget(
                      name: 'Drinks', asset: 'assets/drink_icon.png'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomCategoryWidget extends StatelessWidget {
  final String name;
  final String asset;
  const CustomCategoryWidget(
      {super.key, required this.name, required this.asset});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: CustomCategoryPage(title: name.toUpperCase()),
        withNavBar: false,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      ),
      child: Card(
        color: CustomColor.veryLightBackColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: CustomColor.lightBackColor),
          ),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    asset,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  name,
                  style: bodyLarge().copyWith(fontSize: 21),
                ),
              ]),
        ),
      ),
    );
  }
}

class CustomCategoryPage extends StatefulWidget {
  final String title;
  const CustomCategoryPage({super.key, required this.title});

  @override
  State<CustomCategoryPage> createState() => _CustomCategoryPageState();
}

class _CustomCategoryPageState extends State<CustomCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(name: CustomPageName.category, title: widget.title),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            StreamBuilder<List<CustomProductModel>>(
                stream: readCategoryProducts(widget.title.toLowerCase()),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return SizedBox(
                      child: Text('Something went wrong. ${snapshot.error}'),
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
                })
          ])),
    );
  }
}

Widget buildProduct(CustomProductModel product) =>
    CustomProductWidget(model: product);

Stream<List<CustomProductModel>> readCategoryProducts(String category) {
  final ref = FirebaseFirestore.instance.collection('products');
  final filter = ref.where('category', isEqualTo: category).snapshots();
  return filter.map((event) =>
      event.docs.map((e) => CustomProductModel.fromJson(e.data())).toList());
}
