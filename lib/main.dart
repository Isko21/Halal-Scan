import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:halal_scan/utility/wrapper.dart';
import 'package:halal_scan/utility/config.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Halal Scan',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        textTheme: GoogleFonts.fredokaTextTheme(
          const TextTheme(
            headline1: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: const Wrapper(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _controller = PersistentTabController(initialIndex: 2);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: navBarscreens(),
      items: navBarsItems(),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      navBarStyle: NavBarStyle.style13,
    );
  }
}
