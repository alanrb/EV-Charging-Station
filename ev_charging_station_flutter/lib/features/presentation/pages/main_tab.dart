import 'package:ev_charging_station_flutter/features/presentation/pages/profile/profile.dart';
import 'package:ev_charging_station_flutter/features/presentation/pages/vehicle/vehicle.dart';
import 'package:ev_charging_station_flutter/features/presentation/styles.dart';
import 'package:flutter/material.dart';

import 'bookmark/bookmark.dart';
import 'home/home.dart';

class MainBottomTabPage extends StatefulWidget {
  const MainBottomTabPage({Key? key}) : super(key: key);

  @override
  State<MainBottomTabPage> createState() => _MainBottomTabPageState();
}

class _MainBottomTabPageState extends State<MainBottomTabPage> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomePage(),
          BookmarkPage(),
          VehiclePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label:
            "Bookmark",
          ),
          BottomNavigationBarItem(
            icon:
            Icon(Icons.car_rental),
            label:
            "Vehicle",
          ),
          BottomNavigationBarItem(
            icon:
            Icon(Icons.person),
            label:
            "Me",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Styles.colorAccent,
        selectedLabelStyle: const TextStyle(
          fontFamily: Styles.fontPrimary,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: Styles.fontPrimary,
        ),
        unselectedItemColor: Styles.grey,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Styles.scaffoldBackground,
    );
  }
}
