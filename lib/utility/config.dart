import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../pages/home/home_page.dart';
import '../pages/home/menu_page.dart';
import '../pages/home/save_page.dart';
import '../pages/home/scan_page.dart';
import '../pages/home/search_page.dart';

List<PersistentBottomNavBarItem> navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home_filled),
      activeColorPrimary: Colors.cyan,
      title: ('Home'),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.search),
      activeColorPrimary: Colors.cyan,
      title: ('Search'),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Ionicons.barcode_outline, size: 30),
      activeColorPrimary: Colors.cyan,
      title: ('Scan'),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.heart),
      activeColorPrimary: Colors.cyan,
      title: ('Favourites'),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Ionicons.menu),
      activeColorPrimary: Colors.cyan,
      title: ('Menu'),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}

List<Widget> navBarscreens() {
  return [
    const HomePage(),
    const SearchPage(),
    const ScanPage(),
    const SavePage(),
    const MenuPage(),
  ];
}
