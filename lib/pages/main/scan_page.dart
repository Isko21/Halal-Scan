import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:halal_scan/models/config.dart';
import 'package:halal_scan/utility/common_functions.dart';
import 'package:halal_scan/widgets/appbar.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String? barcodeScanRes;

  Future<void> scanBarcodeNormal() async {
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      barcodeScanRes = barcodeScanRes;
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  Barcode? result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'SCAN', name: CustomPageName.scan),
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: QRView(
              key: qrKey,
              cameraFacing: CameraFacing.back, // Use the rear camera
              onQRViewCreated:
                  _onQRViewCreated, // Function to call after the QR View is created
              overlay: QrScannerOverlayShape(
                // Configure the overlay to look nice
                borderRadius: 10,
                borderWidth: 5,
                borderColor: Colors.white,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LottieBuilder.asset('assets/scan_animation.json',
                      height: 150),
                  AutoSizeText('Align camera with barcode',
                      maxLines: 1, style: bodyLarge().copyWith(fontSize: 30)),
                  TextField(
                    autofocus: false,
                    // controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.qr_code_scanner_sharp, size: 20),
                        onPressed: () {
                          scanBarcodeNormal();
                        },
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: CustomColor.lightBackColor),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: CustomColor.lightBackColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Or type in the barcode',
                      hintStyle: bodyMedium(),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen(
      (scanData) {
        controller.stopCamera();
        setState(() {
          barcodeScanRes = scanData.code;
        });
        showModalBottomSheet(
          context: context,
          builder: (context) => Container(
            margin: const EdgeInsets.all(40),
            child: Text(
              scanData.code.toString(),
              style: titleLarge(),
            ),
          ),
        );
      },
    );
  }
}
