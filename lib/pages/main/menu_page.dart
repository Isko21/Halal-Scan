import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halal_scan/models/config.dart';
import 'package:halal_scan/utility/common_functions.dart';
import 'package:halal_scan/widgets/appbar.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: 'MENU',
        name: CustomPageName.menu,
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Center(
                    child: Text(
                      '😁',
                      style: titleLarge(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    'Iskhak Suranov',
                    style: titleMedium(),
                  ),
                ),
                Center(
                  child: Text(
                    'iskhaksuranov@gmail.com',
                    style: bodyMedium(),
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  color: CustomColor.veryLightBackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 2,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'Info',
                        style: titleLarge().copyWith(fontSize: 24),
                      ),
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        leading: Text(
                          'Account Info',
                          style: bodyLarge()
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: CustomColor.darkBackColor,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  color: CustomColor.veryLightBackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 2,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'App',
                        style: titleLarge().copyWith(fontSize: 24),
                      ),
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        leading: Text(
                          'My Scan History',
                          style: bodyLarge()
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: CustomColor.darkBackColor,
                          size: 20,
                        ),
                      ),
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        leading: Text(
                          'Product Submissions',
                          style: bodyLarge()
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: CustomColor.darkBackColor,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  color: CustomColor.veryLightBackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 2,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'Settings ',
                        style: titleLarge().copyWith(fontSize: 24),
                      ),
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        leading: Text(
                          'Push Notification',
                          style: bodyLarge()
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                        trailing: SizedBox(
                          height: 20,
                          child: CupertinoSwitch(
                            activeColor: CustomColor.buttonColor,
                            trackColor: CustomColor.buttonColor,
                            thumbColor: Colors.white,
                            value: false,
                            onChanged: (val) {},
                          ),
                        ),
                      ),
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        leading: Text(
                          'Start app with Scanner',
                          style: bodyLarge()
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                        trailing: CupertinoSwitch(
                          activeColor: CustomColor.buttonColor,
                          trackColor: CustomColor.buttonColor,
                          thumbColor: Colors.white,
                          value: true,
                          onChanged: (val) {},
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
