import 'dart:ui';

import 'package:Specifish/scene.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';
import 'home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, child) => MaterialApp(
        title: 'Flutter Demo ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            scrollbarTheme: ScrollbarThemeData(
                thumbColor: MaterialStateProperty.all(Colors.black26)),
            primarySwatch: Colors.blueGrey,
            textTheme: const TextTheme(
                displayLarge:
                    TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                titleMedium: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
                titleSmall: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Colors.lightGreen))),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Homescreen();
            } else {
              return const MyHomePage();
            }
          },
        ),
      ),
      designSize: const Size(340, 640),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    var arrNames = [
      'Raman',
      'Ramnaujan',
      'Rajesh',
      'James',
      'John',
      'Rahim',
      'Jerry',
      'Abhay'
    ];

    return Scaffold(
        /*  appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Flutter Container"),
        ), */
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: const BoxDecoration(
                color: Color(0xffffffff),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/image-4-bg.png',
                  ),
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // theoceanitssecretsMP6 (5:30)
                      margin: EdgeInsets.fromLTRB(
                          20 * fem, 20 * fem, 49 * fem, 315 * fem),
                      constraints: BoxConstraints(
                        maxWidth: 287 * fem,
                      ),
                      child: Text(
                        'THE OCEAN \n& ITS SECRETS',
                        style: TextStyle(
                          fontSize: 47 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.1725 * ffem / fem,
                          color: Color(0xc1f8f8f8),
                        ),
                      ),
                    ),
                    Container(
                      // welcometothedepthsoftheoceanle (5:31)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 7 * fem, 23 * fem),
                      constraints: BoxConstraints(
                        maxWidth: 340 * fem,
                      ),
                      child: Text(
                        'welcome to the depths of the ocean. let’s explore\n the world under the waterand witness the different water species.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w300,
                          height: 1.2941176471 * ffem / fem,
                          letterSpacing: 0.17 * fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        // autogroupkrsh6V6 (3fmEGKxahPn4dB4v4rkrsh)
                        margin: EdgeInsets.fromLTRB(
                            38.5 * fem, 0 * fem, 38.5 * fem, 0 * fem),
                        width: double.infinity,
                        height: 44 * fem,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xfff2f2f4)),
                          color: Color(0x44080808),
                          borderRadius: BorderRadius.circular(34 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'Let’s swim',
                            style: TextStyle(
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.1725 * ffem / fem,
                              letterSpacing: 0.2 * fem,
                              color: Color(0xfff5f5f5),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>  Splash()));

                      },
                    )
                  ]),
            )
            // Column(
            //   children: [
            //     Text('Text 1',
            //         style: Theme.of(context)
            //             .textTheme
            //             .headline1!
            //             .copyWith(color: Colors.orange)),
            //     Text('Text 2', style: Theme.of(context).textTheme.subtitle1),
            //     Text('Text 3',
            //         style: Theme.of(context)
            //             .textTheme
            //             .headline1!
            //             .copyWith(color: Colors.red)),
            //     Text('Text 4', style: Theme.of(context).textTheme.subtitle2)
            //   ],
            // )

            /* Text(
          "Hello World",
          style: TextStyle(fontFamily: 'NotoSans-Black', fontSize: 25),
        ) */

            /*  Center(
          child: CircleAvatar(
            child: Container(
              child: Column(
                children: [
                  Container(
                      width: 60,
                      height: 60,
                      child: Image.asset('assets/images/boy_icon.png')),
                  Text(
                    'Abhay',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            /* Text('Name',
                style: TextStyle(color: Colors.white, fontSize: 25)), */
            backgroundColor: Colors.black87,
            // minRadius: 50,
            maxRadius: 50,
          ),
        ) */
            /*  backgroundImage: AssetImage('assets/images/boy_icon.png'), */

            /* ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text('${index + 1}'),
              title: Text(arrNames[index]),
              subtitle: Text('Number'),
              trailing: Icon(Icons.add),
            );
          },
          itemCount: arrNames.length,
          separatorBuilder: ((context, index) {
            return Divider(
              height: 20,
              thickness: 1,
            );
          }),
        ) */

            /*  Container(
            color: Colors.blueGrey,
            margin: EdgeInsets.all(11),
            child: Padding(
                padding:
                    EdgeInsets.only(top: 21, bottom: 11, left: 34, right: 34),
                child: Text(
                  "Hello World",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ))) */

            /*  Column (
          children: [
            Expanded(
              flex: 2,
              child:
                  Container(/* width: 50, */ height: 100, color: Colors.orange),
            ),
            Expanded(
              flex: 4,
              child: Container(/* width: 50 */ height: 100, color: Colors.blue),
            ),
            Expanded(
              flex: 3,
              child: Container(/* width: 50 */ height: 100, color: Colors.grey),
            ),
            Expanded(
              flex: 1,
              child:
                  Container(/* width: 50 */ height: 100, color: Colors.green),
            )
          ],
        ) */

            /* Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blue.shade50,
          child: Center(
              child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      // borderRadius: BorderRadius.circular(21),
                      border: Border.all(color: Colors.black, width: 2),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 51,
                            color: Colors.grey,
                            spreadRadius: 11)
                      ],
                      shape: BoxShape.circle))),
        ) */

            /*  ListView.separated(
          itemBuilder: (context, index) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    arrNames[index],
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    arrNames[index],
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    arrNames[index],
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            );
          },
          itemCount: arrNames.length,
          // reverse: true,
          separatorBuilder: (context, index) {
            return Divider(
              height: 100,
              thickness: 3,
            );
          },
        ) */

            /* ListView.builder(
          itemBuilder: (context, index) {
            return Text(
              arrNames[index],
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
            );
          },
          itemCount: arrNames.length,
          itemExtent: 100,
          // reverse: true,
          scrollDirection: Axis.horizontal,
        ) */

            /* ListView(
          scrollDirection: Axis.horizontal,
          reverse: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "One",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Two",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Three",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Four",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Five",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ) */

            /* Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 11),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 11),
                            height: 200,
                            width: 200,
                            color: Colors.lightGreen,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 11),
                            height: 200,
                            width: 200,
                            color: Colors.tealAccent,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 11),
                            height: 200,
                            width: 200,
                            color: Colors.deepOrange,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 11),
                            height: 200,
                            width: 200,
                            color: Colors.black87,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 11),
                            height: 200,
                            width: 200,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(bottom: 11),
                  height: 200,
                  color: Colors.redAccent,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 11),
                  height: 200,
                  color: Colors.yellowAccent,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 11),
                  height: 200,
                  color: Colors.blueGrey,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 11),
                  height: 200,
                  color: Colors.pinkAccent,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 11),
                  height: 200,
                  color: Colors.black87,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 11),
                  height: 200,
                  color: Colors.deepPurple,
                )
              ],
            ))) */

            /* Center(
          child: InkWell(
              onTap: (() {
                print("Tapped on Container");
              }),
              onLongPress: (() {
                print("Long Pressed on Container");
              }),
              onDoubleTap: () {
                print("Double Tapped on Container");
              },
              child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.amber,
                  child: Center(
                      child: InkWell(
                          onTap: () {
                            print("Text Widget Tapped!");
                          },
                          child: Text(
                            "Click Here",
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.w700),
                          )))))), */

            /* Container(
          /* width: 300, */
          height: 500,
          child: Row(
            /* mainAxisAlignment: MainAxisAlignment.spaceEvenly,  */ //It start with gap from  both the sides of half the size of the gaps between childern widget
            /* mainAxisAlignment: MainAxisAlignment.spaceBetween, */ //It have no space from both the side of edge
            // mainAxisAlignment: MainAxisAlignment.center, //It align all the widget in the center
            mainAxisAlignment:
                MainAxisAlignment.start, //It place all the widget at the start
            /*  mainAxisAlignment: MainAxisAlignment.spaceAround, */ // It start with equal space on both edges of size gap which conatained between widget
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('A', style: TextStyle(fontSize: 25)),
              Text('B', style: TextStyle(fontSize: 25)),
              Text('C', style: TextStyle(fontSize: 25)),
              Text('D', style: TextStyle(fontSize: 25)),
              Text('E', style: TextStyle(fontSize: 25)),
              ElevatedButton(onPressed: () {}, child: Text('Click Me!'))
            ],
          ),
        ) */
            /* Container(
                height: 300,
                /*  width: 300, */
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  /* mainAxisAlignment: MainAxisAlignment.spaceAround, */
                  /* crossAxisAlignment: CrossAxisAlignment.center, */
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  /* crossAxisAlignment: CrossAxisAlignment.end */
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'R1',
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          'R2',
                          style: TextStyle(fontSize: 25),
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                                onPressed: () {}, child: Text('Button1')),
                            ElevatedButton(
                                onPressed: () {}, child: Text("Button2"))
                          ],
                        ),
                        Text(
                          'R3',
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          'R4',
                          style: TextStyle(fontSize: 25),
                        )
                      ],
                    ),
                    Text('A', style: TextStyle(fontSize: 25)),
                    Text('B', style: TextStyle(fontSize: 25)),
                    Text('C', style: TextStyle(fontSize: 25)),
                    Text('D', style: TextStyle(fontSize: 25)),
                    Text('E', style: TextStyle(fontSize: 25)),
                    ElevatedButton(onPressed: () {}, child: Text('Click Me!'))
                  ],
                )) */

/*             Center(
          child: Container(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/flutter_icon.jpg')),
        ) */

            /* OutlinedButton(
          child: Text("Outlined Button"),
          onPressed: () {
            print("Outlined Button is clicked");
          },
          onLongPress: () {
            print("Outlined pressed too long");
          },
        ) */

            /* ElevatedButton(
          child: Text("Elevated Button"),
          onPressed: () {
            print("Elevated Button is clicked");
          },
          onLongPress: () {
            print("Elevated Button is pressed too long");
          },
        ) */

            /* TextButton(
          child: Text("Text Button"),
          onPressed: () {
            print("Text Button Clicked");
          },
          onLongPress: () {
            print("Text Button pressed too long!!");
          },
        ) */

            /* Text(
          "Hello Flutter Developer",
          style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              backgroundColor: Colors.black),
        ) */

            /*Center(
          child:Text('Hello World',style: TextStyle(fontSize: 25))
       )*/
            /* Center(
        child:Container(
        width: 200,
        height: 100,
        color:Colors.black38,
        child:Center(child:Text("Hello Devops!!!",style: TextStyle(color: Colors.white),))
    )
    ), */
            // we are doing object calling means constructor is called and optional parameters can be used
            ));
  }
}
