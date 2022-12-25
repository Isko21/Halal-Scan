import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halal_scan/pages/main/place_page.dart';
import 'package:halal_scan/pages/main/search_page.dart';
import 'package:halal_scan/pages/onboarding/choose_role.dart';
import 'package:halal_scan/pages/onboarding/create_user.dart';
import 'package:halal_scan/pages/onboarding/halal_info.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../pages/main/home_page.dart';
import '../pages/main/menu_page.dart';
import '../pages/main/scan_page.dart';

List<PersistentBottomNavBarItem> navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home_filled),
      title: ('Home'),
      activeColorPrimary: CustomColor.darkBackColor,
      inactiveColorPrimary: CustomColor.buttonColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.search),
      title: ('Search'),
      activeColorPrimary: CustomColor.darkBackColor,
      inactiveColorPrimary: CustomColor.buttonColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Ionicons.barcode_outline, size: 30),
      title: ('Scan'),
      activeColorPrimary: CustomColor.darkBackColor,
      inactiveColorPrimary: CustomColor.buttonColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.map),
      title: ('Places'),
      activeColorPrimary: CustomColor.darkBackColor,
      inactiveColorPrimary: CustomColor.buttonColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Ionicons.menu),
      title: ('Menu'),
      activeColorPrimary: CustomColor.darkBackColor,
      inactiveColorPrimary: CustomColor.buttonColor,
    ),
  ];
}

List<Widget> navBarScreens() {
  return [
    const HomePage(),
    const SearchPage(),
    const ScanPage(),
    const PlacePage(),
    const MenuPage(),
  ];
}

mixin CustomColor {
  static Color buttonColor = const Color(0xFF97BA85);
  static Color darkBackColor = const Color(0xFF516746);
  static Color lightBackColor = const Color(0xFFDEEAD8);
  static Color veryLightBackColor = const Color(0xFFF4F8F2);
}

enum CustomPageName {
  home,
  search,
  productDetails,
  scan,
  save,
  map,
  menu,
  notification,
  category,
}

const mapApiKey = 'AIzaSyA3HIYw4qLbEPMArqsPHCZoOxpWU9yjvaE';
