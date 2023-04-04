import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nagi_network/appModule/ui/home_page.dart';

class AppNav extends StatefulWidget {
  const AppNav({super.key});

  static final List<Widget> currentPage = <Widget>[
    HomeBloc(),
    const Text("Explore"),
    const Text("Makterplace"),
    const Text("Settings"),
  ];

  @override
  State<AppNav> createState() => _AppNavState();
}

class _AppNavState extends State<AppNav> {
  int pageNow = 0;

  void onSelected(int index) {
    setState(() {
      pageNow = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppNav.currentPage.elementAt(pageNow),
      ),
      bottomNavigationBar: GNav(
        tabs: const [
          GButton(icon: Icons.home_outlined),
          GButton(icon: Icons.explore_outlined),
          GButton(icon: Icons.shopping_bag_outlined),
          GButton(icon: Icons.settings_outlined),
        ],
        onTabChange: onSelected,
        activeColor: const Color.fromARGB(255, 12, 76, 196),
      ),
    );
  }
}
