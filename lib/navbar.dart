import 'package:Specifish/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final String? username = FirebaseAuth.instance.currentUser!.displayName;
  final String? email = FirebaseAuth.instance.currentUser!.email;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              '$username',
              style: SafeGoogleFont(
                'Questrial',
                fontSize: 15 * ffem,
                fontWeight: FontWeight.w900,
                height: 1.371875 * ffem / fem,
                letterSpacing: 0.4 * fem,
                color: Color.fromARGB(255, 234, 234, 236),
              ),
            ),
            accountEmail: Text('$email',
                style: SafeGoogleFont(
                  'Questrial',
                  fontSize: 15 * ffem,
                  fontWeight: FontWeight.w900,
                  height: 1.371875 * ffem / fem,
                  letterSpacing: 0.4 * fem,
                  color: Color.fromARGB(255, 246, 246, 248),
                )),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                radius: 40,
                child: ClipOval(
                  child: (FirebaseAuth.instance.currentUser!.photoURL != null)
                      ? Image.network(
                          FirebaseAuth.instance.currentUser!.photoURL!,
                          width: 79,
                          height: 79,
                          fit: BoxFit.cover)
                      : Image.asset('assets/images/profile.png',
                          height: 79, width: 79),
                  //Text
                )),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 3, 6, 32),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://images.alphacoders.com/277/277253.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.help,
              color: Color.fromARGB(255, 3, 6, 32),
            ),
            title: Text('Help',
                style: SafeGoogleFont(
                  'Questrial',
                  fontSize: 13 * ffem,
                  fontWeight: FontWeight.w800,
                  height: 1.371875 * ffem / fem,
                  letterSpacing: 0.4 * fem,
                  color: const Color.fromARGB(255, 3, 6, 32),
                )),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.group, color: Color.fromARGB(255, 3, 6, 32)),
            title: Text('About Us',
                style: SafeGoogleFont(
                  'Questrial',
                  fontSize: 13 * ffem,
                  fontWeight: FontWeight.w800,
                  height: 1.371875 * ffem / fem,
                  letterSpacing: 0.4 * fem,
                  color: const Color.fromARGB(255, 3, 6, 32),
                )),
            onTap: () => null,
          ),
          /* ListTile(
            leading: Icon(Icons.share, color: Color.fromARGB(255, 3, 6, 32)),
            title: Text('Share',
                style: SafeGoogleFont(
                  'Questrial',
                  fontSize: 13 * ffem,
                  fontWeight: FontWeight.w800,
                  height: 1.371875 * ffem / fem,
                  letterSpacing: 0.4 * fem,
                  color: Color.fromARGB(255, 3, 6, 32),
                )),
            onTap: () => null,
          ), */
          /* ListTile(
            leading:
                Icon(Icons.notifications, color: Color.fromARGB(255, 3, 6, 32)),
            title: Text('Request',
                style: SafeGoogleFont(
                  'Questrial',
                  fontSize: 13 * ffem,
                  fontWeight: FontWeight.w800,
                  height: 1.371875 * ffem / fem,
                  letterSpacing: 0.4 * fem,
                  color: Color.fromARGB(255, 3, 6, 32),
                )),
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ), */
          Divider(),
          /*  ListTile(
            leading: Icon(Icons.settings, color: Color.fromARGB(255, 3, 6, 32)),
            title: Text('Settings',
                style: SafeGoogleFont(
                  'Questrial',
                  fontSize: 13 * ffem,
                  fontWeight: FontWeight.w800,
                  height: 1.371875 * ffem / fem,
                  letterSpacing: 0.4 * fem,
                  color: Color.fromARGB(255, 3, 6, 32),
                )),
            onTap: () => null,
          ), */
          ListTile(
            leading:
                Icon(Icons.description, color: Color.fromARGB(255, 3, 6, 32)),
            title: Text('Policies',
                style: SafeGoogleFont(
                  'Questrial',
                  fontSize: 13 * ffem,
                  fontWeight: FontWeight.w800,
                  height: 1.371875 * ffem / fem,
                  letterSpacing: 0.4 * fem,
                  color: Color.fromARGB(255, 3, 6, 32),
                )),
            onTap: () => null,
          ),
          const Divider(),
          ListTile(
            title: Text('Logout',
                style: SafeGoogleFont(
                  'Questrial',
                  fontSize: 13 * ffem,
                  fontWeight: FontWeight.w800,
                  height: 1.371875 * ffem / fem,
                  letterSpacing: 0.4 * fem,
                  color: const Color.fromARGB(255, 3, 6, 32),
                )),
            leading:
                const Icon(Icons.exit_to_app, color: Color.fromARGB(255, 3, 6, 32)),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return const MyHomePage();
              })));
            },
          ),
        ],
      ),
    );
  }
}
