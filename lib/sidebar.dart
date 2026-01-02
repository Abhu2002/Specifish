import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'about_us.dart';
import 'help.dart';

class SideBarScreen extends StatefulWidget {
  const SideBarScreen({super.key});

  @override
  State<SideBarScreen> createState() => _SideBarScreenState();
}

class _SideBarScreenState extends State<SideBarScreen> {
  //final String? username = FirebaseAuth.instance.currentUser!.displayName;
  final List drawerMenuListname = const [
    {
      "leading": Icon(
        Icons.animation_rounded,
        color: Color.fromARGB(255, 3, 6, 32),
      ),
      "title": "About Us",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 1,
    },
    {
      "leading": Icon(
        Icons.help,
        color: Color.fromARGB(255, 3, 6, 32),
      ),
      "title": "Help",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 2,
    },
    {
      "leading": Icon(
        Icons.exit_to_app,
        color: Color.fromARGB(255, 3, 6, 32),
      ),
      "title": "Log Out",
      "trailing": Icon(Icons.chevron_right),
      "action_id": 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final String? username = FirebaseAuth.instance.currentUser!.displayName;
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SafeArea(
        child: SizedBox(
      width: 280,
      child: Drawer(
        child: ListView(children: [
          const ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://www.channelfutures.com/files/2019/10/Focus-877x432.jpg"),
            ),
            title: SizedBox(
                child: Text(
              "Abhay",
              style: TextStyle(color: Colors.black),
            )),
            subtitle: Text(
              "abhay.a.kapadnis@gmail.com",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          ...drawerMenuListname.map((sideMenuData) {
            return ListTile(
              leading: sideMenuData['leading'],
              title: Text(
                sideMenuData['title'],
              ),
              trailing: sideMenuData['trailing'],
              onTap: () {
                Navigator.pop(context);
                if (sideMenuData['action_id'] == 2) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AboutUs(),
                    ),
                  );
                } else if (sideMenuData['action_id'] == 3) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Help(),
                    ),
                  );
                }
              },
            );
          }).toList()
        ]),
      ),
    ));
  }
}
