import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halal_scan/models/config.dart';
import 'package:halal_scan/utility/auth.dart';
import 'package:halal_scan/utility/common_functions.dart';
import 'package:halal_scan/widgets/appbar.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final authService = AuthService();
  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<CustomUser?>(context);

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
                const CircleAvatar(
                    radius: 50,
                    child: Image(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8sz484NbeS21UH8wlx9yDd0WROQsCMpS-mvXjkmY&s'),
                    )),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    currentUser!.fullName!,
                    style: titleMedium(),
                  ),
                ),
                Center(
                  child: Text(
                    currentUser.email!,
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
                      ListTile(
                        onTap: authService.signOut,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        leading: Text(
                          'Log out',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
