import 'package:flutter/material.dart';
import 'package:halal_scan/models/config.dart';
import 'package:halal_scan/widgets/appbar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(
        title: 'NOTIFICATIONS',
        name: CustomPageName.notification,
      ),
      body: SizedBox(),
    );
  }
}
