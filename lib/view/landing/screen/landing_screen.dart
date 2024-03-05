import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/strings/ui_string.dart';
import 'package:reservation_app/view/home/screen/home_page.dart';
import 'package:reservation_app/view/landing/bloc/landing_bloc.dart';
import 'package:reservation_app/view/notification/screen/notification_page.dart';
import 'package:reservation_app/view/profile/screen/profile_page.dart';
import 'package:reservation_app/view/promo/screen/promo_page.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late LandingBloc _landingBloc;
  int _selectedTab = 0;

  final List _pages = [
    const HomePage(),
    const NotificationPage(),
    const PromoPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    _landingBloc = context.read<LandingBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandingBloc, LandingState>(
      builder: (context, state) {
        if (state is OnTabChangeState) {
          _selectedTab = state.index;
        }
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              currentIndex: _selectedTab,
              onTap: (index) => _landingBloc.add(TabChangeEvent(index: index)),
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.grey,
              items: _tabItem),
          body: _pages.elementAt(_selectedTab),
        );
      },
    );
  }

  final List<BottomNavigationBarItem> _tabItem = [
    BottomNavigationBarItem(
        icon: const Icon(Icons.home), label: UiString.stringAsset.kHome),
    BottomNavigationBarItem(
        icon: const Icon(Icons.notifications),
        label: UiString.stringAsset.kNotification),
    BottomNavigationBarItem(
        icon: const Icon(Icons.card_giftcard),
        label: UiString.stringAsset.kPromo),
    BottomNavigationBarItem(
        icon: const Icon(Icons.person_2), label: UiString.stringAsset.kProfile),
  ];
}
