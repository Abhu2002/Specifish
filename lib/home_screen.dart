import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:Specifish/navbar.dart';
import 'package:Specifish/fish_details.dart';
import 'dart:ui';
import 'package:Specifish/profile.dart';
import 'package:Specifish/setting.dart';
import 'package:Specifish/recent.dart';
import 'package:Specifish/home.dart';
import 'dart:io';

File empty = File("");

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final String? username = FirebaseAuth.instance.currentUser!.displayName;

  int _selectedIndex = 0;
  // File empty=File("");
  final List<Widget> _tabs = [
    const HomeTab(),
    RecentTab(
      image: empty,
      species: "",
      detected: false,
      fd: FishDetails(scientific_name: ""),
    ),
    const ProfileTab(),
    const SettingTab()
  ];

  final List<String> _titles = const [
    'Home',
    'Recent',
    'Profile',
    'Setting',
  ];

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(_titles[_selectedIndex]),
          backgroundColor: const Color.fromARGB(255, 3, 6, 32),
        ),
        bottomNavigationBar: Container(
          color: const Color.fromARGB(255, 3, 6, 32),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GNav(
              backgroundColor: const Color.fromARGB(255, 3, 6, 32),
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: const Color.fromARGB(255, 3, 68, 104),
              gap: 10,
              tabs: const [
                GButton(icon: Icons.home, text: "Home"),
                GButton(
                  icon: Icons.timelapse_outlined,
                  text: "Recent",
                ),
                GButton(icon: Icons.account_circle, text: "Profile"),
                GButton(icon: Icons.settings, text: "Settings"),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (newIndex) => setState(() {
                _selectedIndex = newIndex;
              }),
            ),
          ),
        ),
        body: _tabs[_selectedIndex]);
  }
}
