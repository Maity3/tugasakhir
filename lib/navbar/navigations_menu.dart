import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sobatternak_application/features/home/Home.dart';
import 'package:sobatternak_application/features/edukasi/Edukasi.dart';
import 'package:sobatternak_application/features/profile/Profile.dart';
import 'package:sobatternak_application/features/statistik/Statistik.dart';


class NavigationsBar extends StatefulWidget {
  const NavigationsBar({Key? key}) : super(key: key);

  @override
  _NavigationsBarState createState() => _NavigationsBarState();
}

class _NavigationsBarState extends State<NavigationsBar> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    HomeScreen(),
    EdukasiScreen(),
    StatistikScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        height: 80,
        elevation: 0,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
          NavigationDestination(icon: Icon(Iconsax.heart), label: "Edukasi"),
          NavigationDestination(icon: Icon(Iconsax.book), label: "Statistik"),
          NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
        ],
      ),
    );
  }
}
