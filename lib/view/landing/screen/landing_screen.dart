import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:reservation_app/strings/ui_string.dart';
import 'package:reservation_app/view/home/screen/home_page.dart';
import 'package:reservation_app/view/notification/screen/notification_page.dart';
import 'package:reservation_app/view/profile/screen/profile_page.dart';
import 'package:reservation_app/view/promo/screen/promo_page.dart';

class LandingScreen extends StatelessWidget {
  static const String tag = "LandingScreen";

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  final List<Widget> _pages = [
    const HomePage(),
    const NotificationPage(),
    const PromoPage(),
    const ProfilePage(),
  ];

  LandingScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _pages,
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style3,
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: UiString.stringAsset.kHome,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications),
        title: UiString.stringAsset.kNotification,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.card_giftcard),
        title: UiString.stringAsset.kPromo,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_2),
        title: UiString.stringAsset.kProfile,
      ),
    ];
  }
}
