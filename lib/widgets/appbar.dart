import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_scan/models/config.dart';
import 'package:halal_scan/models/reports/wrong_ingredients.dart';
import 'package:halal_scan/models/reports/wrong_status.dart';
import 'package:halal_scan/pages/submain/notification_page.dart';
import 'package:halal_scan/pages/submain/save_page.dart';
import 'package:halal_scan/utility/common_functions.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../models/reports/wrong_image.dart';
import '../models/reports/wrong_name.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final CustomPageName name;
  const MainAppBar({super.key, required this.title, required this.name});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          const SizedBox(width: 20),
          Text(
            title,
            style: GoogleFonts.quicksand(
              color: CustomColor.darkBackColor,
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
        ],
      ),
      actions: [
        Visibility(
          visible: name != CustomPageName.save,
          child: IconButton(
            onPressed: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const SavePage(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            icon: Icon(
              CupertinoIcons.heart,
              color: CustomColor.buttonColor,
            ),
          ),
        ),
        Visibility(
          visible: name != CustomPageName.notification,
          child: IconButton(
            onPressed: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const NotificationPage(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            icon: Icon(
              Ionicons.notifications_outline,
              color: CustomColor.buttonColor,
            ),
          ),
        ),
        // const SizedBox(width: 6)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class DetailAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final CustomPageName name;
  final ScreenshotController? screenshotController;
  const DetailAppBar({
    super.key,
    required this.title,
    required this.name,
    this.screenshotController,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            'assets/back_icon.png',
            height: 20,
          ),
        ),
      ),
      backgroundColor: name == CustomPageName.productDetails
          ? CustomColor.lightBackColor.withOpacity(0.5)
          : Colors.transparent,
      actions: [
        IconButton(
          onPressed: () => shareScreenShot(screenshotController!, context),
          icon: Image.asset(
            'assets/share_icon.png',
            height: 20,
          ),
        ),
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              context: context,
              builder: (context) => Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    right: 30,
                    left: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 60,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: Image.asset('assets/line_icon.png'),
                    ),
                    Text(
                      'Report Inaccuracies',
                      style: bodyLarge(),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      onTap: () => showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30),
                            ),
                          ),
                          builder: (c) => const ReportWrongName()),
                      leading: Text(
                        'Wrong Product Name',
                        style: bodyMedium(),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: CustomColor.darkBackColor,
                        size: 20,
                      ),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      onTap: () => showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30),
                            ),
                          ),
                          builder: (c) => const ReportWrongImage()),
                      leading: Text(
                        'Wrong Product Image',
                        style: bodyMedium(),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: CustomColor.darkBackColor,
                        size: 20,
                      ),
                    ),
                    ListTile(
                      onTap: () => showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        builder: (c) => const ReportWrongIngredients(),
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      leading: Text(
                        'Wrong Ingredient Information',
                        style: bodyMedium(),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: CustomColor.darkBackColor,
                        size: 20,
                      ),
                    ),
                    ListTile(
                      onTap: () => showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        builder: (c) => const ReportWrongStatus(),
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      leading: Text(
                        'Wrong Product Halal Status',
                        style: bodyMedium(),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: CustomColor.darkBackColor,
                        size: 20,
                      ),
                    ),
                    const SizedBox(height: 10)
                  ],
                ),
              ),
            );
          },
          icon: Image.asset(
            'assets/error_icon.png',
            height: 25,
          ),
        ),
        const SizedBox(width: 6)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

void shareScreenShot(
    ScreenshotController screenshotController, BuildContext context) async {
  final imageFile = await screenshotController.capture(pixelRatio: 3);
  final buffer = imageFile!.buffer;
  await Share.shareXFiles(
    [
      XFile.fromData(
        buffer.asUint8List(),
        name: 'Look at this!',
      ),
    ],
  );
}
