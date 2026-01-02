import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui';
import 'package:Specifish/register_user.dart';
import 'package:Specifish/firebase_auth_service.dart';
import 'package:Specifish/forgot_password.dart';
import 'package:Specifish/home_screen.dart';
import 'package:Specifish/utils.dart';

class Scene extends StatefulWidget {
  const Scene({Key? key}) : super(key: key);
  @override
  _Scene createState() => _Scene();
}

class _Scene extends State<Scene> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
          child: SizedBox(
              width: double.infinity,
              child: Container(
                // androidsmall1WcQ (2:3)
                width: double.infinity,
                height: 740 * fem,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 1, 3, 26),
                  // borderRadius: BorderRadius.circular(25 * fem),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      // rectangle4166Jgg (36:3)
                      left: 3 * fem,
                      top: 203 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 354 * fem,
                          height: 367 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45 * fem),
                              color: const Color(0xffffffff),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xff5b6cff),
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
                      // ellipse87Y5E (49:160)
                      left: 20 * fem,
                      top: 448 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 67 * fem,
                          height: 69 * fem,
                          child: Image.asset(
                            'assets/images/ellipse-87-FZz.png',
                            width: 67 * fem,
                            height: 69 * fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // ellipse88dMa (49:161)
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
                                border: Border.all(color: const Color(0x7ff5f2ff)),
                                color: const Color(0x51a0dbff),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // ellipse89toJ (49:162)
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
                                border: Border.all(color: const Color(0x7ff5f2ff)),
                                color: const Color(0x51a0dbff),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // letssignyouin7vx (36:4)
                      left: 19 * fem,
                      top: 245 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 167 * fem,
                          height: 23 * fem,
                          child: Text(
                            'Let’s sign you in  ',
                            style: SafeGoogleFont(
                              'Quest rial',
                              fontSize: 22 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.03 * ffem / fem,
                              letterSpacing: 0.22 * fem,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // welcomebackletscatchit9Mr (36:5)
                      left: 19 * fem,
                      top: 281 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 190 * fem,
                          height: 16 * fem,
                          child: Text(
                            'Welcome Back, Lets Catch it',
                            style: SafeGoogleFont(
                              'Questrial',
                              fontSize: 15 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.03 * ffem / fem,
                              letterSpacing: 0.15 * fem,
                              color: const Color(0xff33363f),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // rectangle41672Ak (36:6)
                      left: 19 * fem,
                      top: 320 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 316 * fem,
                          height: 43 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10 * fem),
                              color: const Color(0x385b6cff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // rectangle4168XdJ (36:7)
                      left: 19 * fem,
                      top: 390 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 316 * fem,
                          height: 43 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10 * fem),
                              color: const Color(0x385b6cff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // rectangle4169Qwz (36:9)
                      left: 19 * fem,
                      top: 489 * fem,
                      child: Align(
                        child: SizedBox(
                            width: 316 * fem,
                            height: 43 * fem,
                            child: RawMaterialButton(
                                fillColor: const Color(0xff4457ff),
                                elevation: 0.0,
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                onPressed: () async {
                                  try {
                                    await FirebaseAuthService().login(
                                        _emailController.text.trim(),
                                        _passwordController.text.trim());
                                    if (FirebaseAuth.instance.currentUser !=
                                        null) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Homescreen()));
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: const Text(
                                                    "Invalid Username or Password .Please Register again or make sure that username and password is correct"),
                                                actions: [
                                                  ElevatedButton(
                                                      onPressed: (() {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const Register()));
                                                      }),
                                                      child:
                                                          const Text("Register Now"))
                                                ],
                                              ));
                                    }
                                  } on FirebaseException catch (e) {
                                    if (kDebugMode) {
                                      if (kDebugMode) {
                                        print(e.message);
                                      }
                                    }
                                  }
                                },
                                child: Text(
                                  "Login",
                                  style: SafeGoogleFont('Questrial',
                                      color: Colors.white, fontSize: 18.0),
                                ))),
                      ),
                    ),
                    Positioned(
                      // forgotpasswordg8p (36:8)
                      left: 207 * fem,
                      top: 453 * fem,
                      child: Align(
                          child: InkWell(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => (const ForgotPassword())));
                        }),
                        child: SizedBox(
                          width: 128 * fem,
                          height: 16 * fem,
                          child: Text(
                            'Forgot password ?',
                            style: SafeGoogleFont(
                              'Questrial',
                              fontSize: 15 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.03 * ffem / fem,
                              letterSpacing: 0.225 * fem,
                              color: const Color.fromARGB(255, 41, 41, 83),
                            ),
                          ),
                        ),
                      )),
                    ),
                    Positioned(
                      // donthaveanaccountN1e (36:11)
                      left: 41 * fem,
                      top: 594 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 172 * fem,
                          height: 16 * fem,
                          child: Text(
                            'Don’t have an Account ? ',
                            style: SafeGoogleFont(
                              'Questrial',
                              fontSize: 15 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.03 * ffem / fem,
                              letterSpacing: 0.225 * fem,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        // registernowSGQ (36:13)
                        left: 215 * fem,
                        top: 594 * fem,
                        child: Align(
                          child: InkWell(
                            onTap: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Register()));
                            }),
                            child: SizedBox(
                              width: 94 * fem,
                              height: 16 * fem,
                              child: Text(
                                'Register now ',
                                style: SafeGoogleFont(
                                  'Questrial',
                                  fontSize: 15 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.03 * ffem / fem,
                                  letterSpacing: 0.225 * fem,
                                  color: const Color(0xff4457ff),
                                ),
                              ),
                            ),
                          ),
                        )),
                    // Positioned(
                    //   // loginuvg (36:14)
                    //   left: 160 * fem,
                    //   top: 502 * fem,
                    //   child: Align(
                    //     child: SizedBox(
                    //       width: 39 * fem,
                    //       height: 16 * fem,
                    //       child: Text(
                    //         'Login ',
                    //         style: SafeGoogleFont(
                    //           'Questrial',
                    //           fontSize: 15 * ffem,
                    //           fontWeight: FontWeight.w400,
                    //           height: 1.03 * ffem / fem,
                    //           letterSpacing: 0.3 * fem,
                    //           color: Color(0xffffffff),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Positioned(
                      // passwordB7W (36:16)
                      left: 48 * fem,
                      top: 389 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 287 * fem,
                          height: 46 * fem,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: TextField(
                                keyboardType: TextInputType.visiblePassword,
                                controller: _passwordController,
                                autocorrect: true,
                                obscureText: true,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.remove_red_eye,
                                          color: Colors.black),
                                      onPressed: () {},
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: "Password",
                                    hintStyle: const TextStyle(fontSize: 18)),
                                style: const TextStyle(fontSize: 18),
                                textInputAction: TextInputAction.done,
                              )),
                        ),
                      ),
                    ),
                    Positioned(
                      // usernameid3fW (36:15)
                      left: 48 * fem,
                      top: 320 * fem,
                      child: Align(
                        child: SizedBox(
                            width: 287 * fem,
                            height: 42 * fem,
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.black, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.black, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintText: "Username ID/ Email",
                                      hintStyle: const TextStyle(fontSize: 18)),
                                  style: const TextStyle(fontSize: 18),
                                  textInputAction: TextInputAction.done,
                                ))),
                      ),
                    ),
                    Positioned(
                      // useraltlightkZv (36:21)
                      left: 29 * fem,
                      top: 329 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 24 * fem,
                          height: 24 * fem,
                          child: Image.asset(
                            'assets/images/useraltlight.png',
                            width: 24 * fem,
                            height: 24 * fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // unlocklightfRz (36:24)
                      left: 29 * fem,
                      top: 399 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 24 * fem,
                          height: 24 * fem,
                          child: Image.asset(
                            'assets/images/unlocklight.png',
                            width: 24 * fem,
                            height: 24 * fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // db40e5f1c83d4267864a220f7e5fef (39:3)
                      left: 84 * fem,
                      top: 0 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 191 * fem,
                          height: 190 * fem,
                          child: Image.asset(
                            'assets/images/db40e5f1c83d4267864a220f7e5fef691-removebg-preview-1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // ellipse86e32 (49:159)
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
                                border: Border.all(color: const Color(0x7ff5f2ff)),
                                color: const Color(0x51a0dbff),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // ellipse83JtG (49:156)
                      left: 18 * fem,
                      top: 11 * fem,
                      child: Align(
                        child: Container(
                            width: 51 * fem,
                            height: 56 * fem,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(255, 243, 240, 240),
                                  width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back_ios_sharp,
                                  color: Colors.white),
                              onPressed: (() {
                                Navigator.pop(context);
                              }),
                            )),
                      ),
                    ),
                    Positioned(
                      // ellipse84oa8 (49:157)
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
                                border: Border.all(color: const Color(0x7ff5f2ff)),
                                color: const Color(0x51a0dbff),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // ellipse85h9i (49:158)
                      left: 15 * fem,
                      top: 191 * fem,
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
                                border: Border.all(color: const Color(0x7ff5f2ff)),
                                color: const Color(0x51a0dbff),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // ellipse82Yg8 (49:155)
                      left: 191 * fem,
                      top: 4 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 100 * fem,
                          height: 99 * fem,
                          child: Image.asset(
                            'assets/images/ellipse-82.png',
                            width: 100 * fem,
                            height: 99 * fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // ellipse80rwi (49:153)
                      left: 254 * fem,
                      top: 155 * fem,
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
                                border: Border.all(color: const Color(0x7ff5f2ff)),
                                color: const Color(0x51a0dbff),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // ellipse81ZbE (49:154)
                      left: 102 * fem,
                      top: 95 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 36 * fem,
                          height: 42 * fem,
                          child: Image.asset(
                            'assets/images/ellipse-81.png',
                            width: 36 * fem,
                            height: 42 * fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // fishremovebgpreview1rqE (49:166)
                      left: 220 * fem,
                      top: 19 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 142 * fem,
                          height: 103 * fem,
                          child: Image.asset(
                            'assets/images/fish-removebg-preview-1-iHN.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // fish2removebgpreview1Yxx (49:167)
                      left: 0 * fem,
                      top: 116 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 154 * fem,
                          height: 84 * fem,
                          child: Image.asset(
                            'assets/images/fish2-removebg-preview-1-Pwv.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 625 * fem,
                      left: 0 * fem,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(children: [
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.height * 0.18,
                            color: Colors.grey,
                          ),
                          Text(
                            "Or Login With",
                            style: SafeGoogleFont('Questrial',
                                color: Colors.white, fontSize: 18),
                          ),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.height * 0.15,
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
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                  onPressed: () async {
                                    await FirebaseAuthService()
                                        .signInWithFacebook();
                                    if (FirebaseAuth.instance.currentUser !=
                                        null) {
                                      if (!mounted) return;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Homescreen()));
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              const AlertDialog(
                                                title: Text(
                                                    "No user exist with this details please register first"),
                                              ));
                                    }
                                  },
                                  icon: const Icon(
                                    FontAwesomeIcons.facebookF,
                                    color: Colors.white,
                                  ),
                                )),
                            const SizedBox(
                              height: 50,
                              width: 20,
                            ),
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: IconButton(
                                onPressed: () async {
                                  await FirebaseAuthService()
                                      .logininwithgoogle();
                                  if (FirebaseAuth.instance.currentUser !=
                                      null) {
                                    if (!mounted) return;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Homescreen()));
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => const AlertDialog(
                                              title: Text(
                                                  "No user exist with this details please register first"),
                                            ));
                                  }
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.google,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                              width: 20,
                            ),
                            Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      FontAwesomeIcons.apple,
                                      color: Colors.white,
                                    )))
                          ],
                        ))
                  ],
                ),
              ))),
    );
  }
}
