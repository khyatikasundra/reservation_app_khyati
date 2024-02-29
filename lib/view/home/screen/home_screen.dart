import 'package:flutter/material.dart';
import 'package:reservation_app/view/home/widget/custom_bottom_navigation_bar.dart';
import 'package:reservation_app/view/promo/screen/promo_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;
  final List _pages = [
    const Center(
      child: Text("Home"),
    ),
    const Center(
      child: Text("About"),
    ),
    const PromoPage(),
    const Center(
      child: Text("Contact"),
    ),
  ];
  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "notifications"),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard), label: "card gift"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2), label: "person"),
          ]),
      body: _pages[_selectedTab],
    );
  }
}

Widget _bottomNavigation() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.card_giftcard)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_outline)),
        ],
      ),
    );
