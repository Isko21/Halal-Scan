import 'package:flutter/material.dart';
import 'package:halal_scan/widgets/appbar.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(
      title: 'Scanner',
    ));
  }
}
