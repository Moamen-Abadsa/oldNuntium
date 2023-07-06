import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/resorces/manager_assets.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/features/home/presentation/view/home_view.dart';
import 'package:nuntium/features/profile/presentation/view/profile_view.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MainController extends GetxController {
  PersistentTabController persistentTabController = PersistentTabController(initialIndex: 0);

  Color color = ManagerColors.black;
  List<Widget> screens = [
    const HomeView(),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.yellowAccent,
    ),
    // CategoryView(),
    // AppointmentView(),
    const ProfileView()
  ];

  List<PersistentBottomNavBarItem> bottomNavBarItems = [
    PersistentBottomNavBarItem(
      icon: const ImageIcon(
        AssetImage(
          ManagerIcons.home,
        ),
      ),
      activeColorPrimary: ManagerColors.purplePrimary,
      inactiveColorPrimary: ManagerColors.greyLight,
      iconSize: ManagerIconSize.s24,
    ),
    PersistentBottomNavBarItem(
      icon: const ImageIcon(
        AssetImage(
          ManagerIcons.category,
        ),
      ),
      activeColorPrimary: ManagerColors.purplePrimary,
      inactiveColorPrimary: ManagerColors.greyLight,
      iconSize: ManagerIconSize.s24,
    ),
    PersistentBottomNavBarItem(
      icon: const ImageIcon(
        AssetImage(
          ManagerIcons.bookmark,
        ),
      ),
      activeColorPrimary: ManagerColors.purplePrimary,
      inactiveColorPrimary: ManagerColors.greyLight,
      iconSize: ManagerIconSize.s24,
    ),
    PersistentBottomNavBarItem(
      icon: const ImageIcon(
        AssetImage(
          ManagerIcons.user,
        ),
      ),
      iconSize: ManagerIconSize.s24,
      activeColorPrimary: ManagerColors.purplePrimary,
      inactiveColorPrimary: ManagerColors.greyLight,
    ),
  ];
}
