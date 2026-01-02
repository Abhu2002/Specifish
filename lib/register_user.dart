import 'package:Specifish/scene.dart';
import 'package:Specifish/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui';

import 'firebase_auth_service.dart';
import 'home_screen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      width: double.infinity,
      child: Container(
        // androidsmall77wv (39:4)
        width: double.infinity,
        height: 960 * fem,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 3, 6, 32),
          // borderRadius: BorderRadius.circular(25 * fem),
        ),
        child: Stack(
          children: [
            Positioned(
              // rectangle41661XW (39:5)
              left: 2 * fem,
              top: 206 * fem,
              child: Align(
                child: SizedBox(
                  width: 354 * fem,
                  height: 386 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45 * fem),
                      color: Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff5b6cff),
                          offset: Offset(0 * fem, -8 * fem),
                          blurRadius: 20 * fem,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // registeryourselfhere5XN (39:6)
              left: 18 * fem,
              top: 245 * fem,
              child: Align(
                child: SizedBox(
                  width: 218 * fem,
                  height: 23 * fem,
                  child: Text(
                    'Register yourself here',
                    style: SafeGoogleFont(
                      'Questrial',
                      fontSize: 22 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.03 * ffem / fem,
                      letterSpacing: 0.22 * fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle4167ZhS (39:8)
              left: 18 * fem,
              top: 382 * fem,
              child: Align(
                child: SizedBox(
                  width: 316 * fem,
                  height: 43 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10 * fem),
                      color: Color(0x385b6cff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle4168HNY (39:9)
              left: 18 * fem,
              top: 307 * fem,
              child: Align(
                child: SizedBox(
                  width: 316 * fem,
                  height: 43 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10 * fem),
                      color: Color(0x385b6cff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle4169znk (39:10)
              left: 35 * fem,
              top: 527 * fem,
              child: Align(
                child: SizedBox(
                  width: 282 * fem,
                  height: 37 * fem,
                  child: RawMaterialButton(
                      fillColor: const Color(0xff4457ff),
                      elevation: 0.0,
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      onPressed: () async {
                        try {
                          await FirebaseAuthService().signup(
                              _emailController.text.trim(),
                              _passwordController.text.trim());

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Splash())));
                        } on FirebaseException catch (e) {
                          if (kDebugMode) {
                            print(e.message);
                          }
                        }
                      },
                      child: Text(
                        "Register",
                        style: SafeGoogleFont('Questrial',
                            color: Colors.white, fontSize: 18.0),
                      )),
                ),
              ),
            ),
            Positioned(
                // backtologinH1A (39:13)
                left: 50 * fem,
                top: 604 * fem,
                child: Row(
                  children: [
                    Text(" Already have an account! ",
                        style: SafeGoogleFont(
                          'Questrial',
                          fontSize: 15 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.03 * ffem / fem,
                          letterSpacing: 0.225 * fem,
                          color: Color(0xffffffff),
                        )),
                    InkWell(
                      onTap: (() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Splash()));
                      }),
                      child: Container(
                        width: 94 * fem,
                        height: 16 * fem,
                        child: Text(
                          'Login Now',
                          style: SafeGoogleFont(
                            'Questrial',
                            fontSize: 15 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.03 * ffem / fem,
                            letterSpacing: 0.225 * fem,
                            color: Color.fromARGB(255, 30, 65, 223),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            /* Positioned(
              // registerZzG (39:14)
              left: 149 * fem,
              top: 538 * fem,
              child: Align(
                child: SizedBox(
                  width: 59 * fem,
                  height: 16 * fem,
                  child: Text(
                    'Register',
                    style: SafeGoogleFont(
                      'Questrial',
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.03 * ffem / fem,
                      letterSpacing: 0.3 * fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ), */
            Positioned(
              // nameGdn (39:15)
              left: 45 * fem,
              top: 307 * fem,
              child: Align(
                child: SizedBox(
                    width: 289 * fem,
                    height: 42 * fem,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Name",
                            hintStyle: TextStyle(fontSize: 18)),
                        style: TextStyle(fontSize: 18),
                        keyboardType: TextInputType.name,
                        controller: _usernameController,
                        textInputAction: TextInputAction.done,
                      ),
                    )),
              ),
            ),
            Positioned(
              // db40e5f1c83d4267864a220f7e5fef (39:19)
              left: 84 * fem,
              top: 0 * fem,
              child: Align(
                child: SizedBox(
                  width: 191 * fem,
                  height: 190 * fem,
                  child: Image.asset(
                    'assets/images/db40e5f1c83d4267864a220f7e5fef691-removebg-preview-1-oh2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle4170TiG (39:32)
              left: 18 * fem,
              top: 456 * fem,
              child: Align(
                child: SizedBox(
                  width: 316 * fem,
                  height: 43 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10 * fem),
                      color: Color(0x385b6cff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // passwordnVe (39:33)
              left: 64 * fem,
              top: 456 * fem,
              child: Align(
                child: SizedBox(
                    width: 269 * fem,
                    height: 43 * fem,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: TextField(
                        obscureText: true,
                        autocorrect: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.remove_red_eye,
                                  color: Colors.black),
                              onPressed: () {},
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Password",
                            hintStyle: TextStyle(fontSize: 18)),
                        style: TextStyle(fontSize: 18),
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                      ),
                    )),
              ),
            ),
            Positioned(
              // unlocklights1J (39:34)
              left: 31 * fem,
              top: 465.9015655518 * fem,
              child: Align(
                child: SizedBox(
                  width: 16 * fem,
                  height: 21.1 * fem,
                  child: Image.asset(
                    'assets/images/unlocklight-TyJ.png',
                    width: 16 * fem,
                    height: 21.1 * fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // emailideRN (39:39)
              left: 44 * fem,
              top: 380 * fem,
              child: Align(
                child: SizedBox(
                    width: 287 * fem,
                    height: 44 * fem,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Email ID",
                            hintStyle: TextStyle(fontSize: 18)),
                        style: TextStyle(fontSize: 18),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        textInputAction: TextInputAction.done,
                      ),
                    )),
              ),
            ),
            Positioned(
              // useraltlightjhi (39:17)
              left: 31.5 * fem,
              top: 320 * fem,
              child: Align(
                child: SizedBox(
                  width: 15 * fem,
                  height: 15.5 * fem,
                  child: Image.asset(
                    'assets/images/useraltlight-G4Q.png',
                    width: 15 * fem,
                    height: 15.5 * fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // messagelight3iQ (39:41)
              left: 27 * fem,
              top: 392 * fem,
              child: Align(
                child: SizedBox(
                  width: 24 * fem,
                  height: 24 * fem,
                  child: Image.asset(
                    'assets/images/messagelight.png',
                    width: 24 * fem,
                    height: 24 * fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // ellipse87Ao2 (49:168)
              left: 20 * fem,
              top: 448 * fem,
              child: Align(
                child: SizedBox(
                  width: 67 * fem,
                  height: 69 * fem,
                  child: Image.asset(
                    'assets/images/ellipse-87.png',
                    width: 67 * fem,
                    height: 69 * fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // ellipse88UYp (49:169)
              left: 253 * fem,
              top: 520 * fem,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 2 * fem,
                  sigmaY: 2 * fem,
                ),
                child: Align(
                  child: SizedBox(
                    width: 74 * fem,
                    height: 74 * fem,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(37 * fem),
                        border: Border.all(color: Color(0x7ff5f2ff)),
                        color: Color(0x51a0dbff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // ellipse89MMi (49:170)
              left: 27 * fem,
              top: 538 * fem,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 2 * fem,
                  sigmaY: 2 * fem,
                ),
                child: Align(
                  child: SizedBox(
                    width: 78 * fem,
                    height: 78 * fem,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(39 * fem),
                        border: Border.all(color: Color(0x7ff5f2ff)),
                        color: Color(0x51a0dbff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // ellipse861x4 (49:172)
              left: 161 * fem,
              top: 344 * fem,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 2 * fem,
                  sigmaY: 2 * fem,
                ),
                child: Align(
                  child: SizedBox(
                    width: 61 * fem,
                    height: 61 * fem,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.5 * fem),
                        border: Border.all(color: Color(0x7ff5f2ff)),
                        color: Color(0x51a0dbff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // ellipse83tkx (49:173)
              left: 18 * fem,
              top: 11 * fem,
              child: Align(
                child: Container(
                    width: 51 * fem,
                    height: 56 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 243, 240, 240), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      icon:
                          Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                    )),
              ),
            ),
            Positioned(
              // ellipse84od2 (49:174)
              left: 268 * fem,
              top: 261 * fem,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 2 * fem,
                  sigmaY: 2 * fem,
                ),
                child: Align(
                  child: SizedBox(
                    width: 75 * fem,
                    height: 75 * fem,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(37.5 * fem),
                        border: Border.all(color: Color(0x7ff5f2ff)),
                        color: Color(0x51a0dbff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // ellipse85sMz (49:175)
              left: 17 * fem,
              top: 160 * fem,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 2 * fem,
                  sigmaY: 2 * fem,
                ),
                child: Align(
                  child: SizedBox(
                    width: 81 * fem,
                    height: 81 * fem,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.5 * fem),
                        border: Border.all(color: Color(0x7ff5f2ff)),
                        color: Color(0x51a0dbff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // ellipse82NJk (49:176)
              left: 218 * fem,
              top: 5 * fem,
              child: Align(
                child: SizedBox(
                  width: 100 * fem,
                  height: 99 * fem,
                  child: Image.asset(
                    'assets/images/ellipse-82-xrL.png',
                    width: 100 * fem,
                    height: 99 * fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // ellipse80Guv (49:177)
              left: 253 * fem,
              top: 164 * fem,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 2 * fem,
                  sigmaY: 2 * fem,
                ),
                child: Align(
                  child: SizedBox(
                    width: 73 * fem,
                    height: 73 * fem,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36.5 * fem),
                        border: Border.all(color: Color(0x7ff5f2ff)),
                        color: Color(0x51a0dbff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // ellipse81AVW (49:178)
              left: 79 * fem,
              top: 97 * fem,
              child: Align(
                child: SizedBox(
                  width: 36 * fem,
                  height: 42 * fem,
                  child: Image.asset(
                    'assets/images/ellipse-81-eEt.png',
                    width: 36 * fem,
                    height: 42 * fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // fishremovebgpreview1TzQ (49:179)
              left: 5 * fem,
              top: 45 * fem,
              child: Align(
                child: SizedBox(
                  width: 142 * fem,
                  height: 103 * fem,
                  child: Image.asset(
                    'assets/images/fish-removebg-preview-1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              // fish2removebgpreview1Atp (49:180)
              left: 207 * fem,
              top: 116 * fem,
              child: Align(
                child: SizedBox(
                  width: 154 * fem,
                  height: 84 * fem,
                  child: Image.asset(
                    'assets/images/fish2-removebg-preview-1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 625 * fem,
              left: 0 * fem,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(children: [
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.height * 0.17,
                    color: Colors.grey,
                  ),
                  Text(
                    "Or Login With",
                    style: SafeGoogleFont('Questrial',
                        color: Colors.white, fontSize: 18),
                  ),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.height * 0.18,
                    color: Colors.grey,
                  ),
                ]),
              ),
            ),
            Positioned(
                top: 660 * fem,
                left: 25 * fem,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.facebookF,
                            color: Colors.white,
                          ),
                        )),
                    SizedBox(
                      height: 50,
                      width: 20,
                    ),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                        onPressed: () async {
                          await FirebaseAuthService().logininwithgoogle();
                          if (FirebaseAuth.instance.currentUser != null) {
                            if (!mounted) return;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homescreen()));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) => const AlertDialog(
                                      title: Text(
                                          "No user exist with this details please register first"),
                                    ));
                          }
                        },
                        icon: Icon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 20,
                    ),
                    Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.apple,
                              color: Colors.white,
                            )))
                  ],
                ))
          ],
        ),
      ),
    )));
  }
}
