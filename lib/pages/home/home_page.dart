import 'package:flutter/material.dart';
import 'package:halal_scan/widgets/appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: CustomAppBar(title: 'Halal-Scan'));
  }
}
