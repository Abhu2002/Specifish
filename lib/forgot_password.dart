import 'dart:ui';
import 'package:Specifish/utils.dart';
import 'package:flutter/material.dart';
import 'package:Specifish/login_user.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailController = TextEditingController();

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
                    // ellipse83tkx (49:173)
                    left: 18 * fem,
                    top: 11 * fem,
                    child: Align(
                      child: Container(
                          width: 51 * fem,
                          height: 56 * fem,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 243, 240, 240),
                                width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_ios_sharp,
                                color: Colors.white),
                            onPressed: (() {
                              Navigator.pop(context);
                            }),
                          )),
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
                      left: 20 * fem,
                      top: 270 * fem,
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Column(children: [
                            Container(
                              height: 60,
                              width: 400,
                              child: Text("Forgot Password?",
                                  style: SafeGoogleFont('Questrial',
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              height: 100,
                              width: 400,
                              child: Text(
                                  "Don't worry! It occurs.Please enter the mail address linked with your account",
                                  style: SafeGoogleFont('Questrial',
                                      color: Colors.white, fontSize: 25)),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                child: Container(
                                    height: 50,
                                    width: 380,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: TextField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          controller: _emailController,
                                          decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 236, 234, 234),
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromARGB(
                                                          255, 17, 16, 16),
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              hintText: "Enter your Email",
                                              hintStyle: TextStyle(
                                                  fontSize: 18,
                                                  color: Color.fromARGB(255, 10, 10, 10))),
                                          style: TextStyle(fontSize: 18),
                                          textInputAction: TextInputAction.done,
                                        )))),
                            SizedBox(height: 30),
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: Container(
                                  width: 330 * fem,
                                  height: 37 * fem,
                                  child: RawMaterialButton(
                                      fillColor:
                                          Color.fromARGB(255, 77, 88, 207),
                                      elevation: 0.0,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      onPressed: () {},
                                      child: Text(
                                        "Send Code",
                                        style: SafeGoogleFont('Questrial',
                                            color: Colors.white,
                                            fontSize: 18.0),
                                      )),
                                )),
                          ]))),
                  Positioned(
                      // backtologinH1A (39:13)
                      left: 50 * fem,
                      top: 604 * fem,
                      child: Row(
                        children: [
                          Text(" Remember Password? ",
                              style: SafeGoogleFont(
                                'Questrial',
                                fontSize: 17 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.03 * ffem / fem,
                                letterSpacing: 0.225 * fem,
                                color: Color(0xffffffff),
                              )),
                          InkWell(
                            child: Container(
                              width: 94 * fem,
                              height: 16 * fem,
                              child: Text(
                                'Login Now',
                                style: SafeGoogleFont(
                                  'Questrial',
                                  fontSize: 17 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.03 * ffem / fem,
                                  letterSpacing: 0.225 * fem,
                                  color: Color.fromARGB(255, 30, 65, 223),
                                ),
                              ),
                            ),
                            onTap: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (Scene())));
                            }),
                          )
                        ],
                      ))
                ],
              ))),
    ));
  }
}
