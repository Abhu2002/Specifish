import 'dart:io';
import 'package:Specifish/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'fish_details.dart';
import 'home.dart';

class RecentTab extends StatefulWidget {
  late File image;
  String species;
  FishDetails fd;
  bool detected;
  RecentTab(
      {super.key,
      required this.image,
      required this.species,
      required this.fd,
      required this.detected});

  @override
  State<RecentTab> createState() => _RecentTabState();
}

class _RecentTabState extends State<RecentTab> {
  String selectionUrl =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Antu_insert-image.svg/2048px-Antu_insert-image.svg.png';
  bool showResults = false, showAlert = false, showMessage = true;
  get image => null;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.detected == true) {
      showMessage = false;
      showResults = true;
    } else if (widget.species != "" && widget.detected == false) {
      showAlert = true;
      showMessage = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupzr8lM2Q (N9XatacEnXgq8xjGcHZR8L)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 5 * fem),
              padding: EdgeInsets.fromLTRB(
                  23 * fem, 30.33 * fem, 21.5 * fem, 33 * fem),
              width: double.infinity,
              height: 800 * fem,
              decoration: BoxDecoration(
                // color: Color.fromARGB(255, 1, 3, 26),
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/result_page_background_2.jpg'),
                  fit: BoxFit.cover,
                ),
                //borderRadius: BorderRadius.circular(30 * fem),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // autogroupe4bj3fv (N9Xb9jqeS3f586medKE4BJ)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 20 * fem),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 246.5 * fem, 0 * fem),
                              width: 40 * fem,
                              height: 40 * fem,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 241, 239, 239),
                                    width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.arrow_back_ios_sharp,
                                    color: Color.fromARGB(255, 19, 18, 18)),
                                onPressed: (() {
                                  Navigator.pop(context);
                                }),
                              )),
                          Container(
                            // lamp68Q (176:124)
                            width: 13 * fem,
                            height: 17.94 * fem,
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 16 * fem, 0 * fem, 0 * fem),
                            child: Image.asset(
                              'assets/images/lamp-ewa.png',
                              width: 13 * fem,
                              height: 17.94 * fem,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // speciesnameRAg (176:127)
                      margin: EdgeInsets.fromLTRB(
                          20 * fem, 0 * fem, 0 * fem, 13 * fem),
                      child: Text(
                        showResults
                            ? widget.fd.fishbaseName
                            : showAlert
                                ? 'TRY AGAIN'
                                : "SPECIES NAME",
                        style: SafeGoogleFont(
                          'Questrial',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 0.8 * ffem / fem,
                          color: Color.fromARGB(255, 237, 238, 240),
                        ),
                      ),
                    ),
                    Container(
                      // autogrouproycivU (N9XbZUf6JpzdDmB8jPRoYC)
                      margin: EdgeInsets.fromLTRB(
                          6 * fem, 0 * fem, 3.5 * fem, 0 * fem),
                      padding: EdgeInsets.fromLTRB(
                          14 * fem, 8 * fem, 14 * fem, 0 * fem),
                      width: double.infinity,
                      height: 470 * fem,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 237, 237, 240)),
                        color: Color.fromARGB(255, 3, 6, 32),
                        borderRadius: BorderRadius.circular(25 * fem),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // autogroupfgggDcL (N9XbmtU5bCfLdH2FHTfGgg)
                              margin: EdgeInsets.fromLTRB(
                                  43 * fem, 0 * fem, 47 * fem, 10 * fem),
                              width: double.infinity,
                              height: 150 * fem,
                              decoration: BoxDecoration(
                                color: Color(0xffd9d9d9),
                                borderRadius: BorderRadius.circular(38 * fem),
                              ),
                              child: widget.image.path == ""
                                  ? Image.network(selectionUrl)
                                  : ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(38 * fem),
                                      child: Image.file(
                                        widget.image,
                                        height: 150 * fem,
                                        width: 600,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                              /* Center(
                                child: Text(
                                  'Image',
                                  style: SafeGoogleFont(
                                    'Questrial',
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.371875 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ) */
                              ,
                            ),
                            Container(
                              // autogroup7b2xgkp (N9Xbw3sUogLRth18qK7B2x)
                              padding: EdgeInsets.fromLTRB(
                                  7 * fem, 35 * fem, 7 * fem, 5 * fem),
                              width: double.infinity,
                              height: 280 * fem,
                              decoration: BoxDecoration(
                                color: Color(0xffd9d9d9),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.elliptical(20, 20),
                                    topRight: Radius.elliptical(20, 20),
                                    bottomLeft: Radius.elliptical(20, 20),
                                    bottomRight: Radius.elliptical(20, 20)),
                              ),
                              child: Scrollbar(
                                controller: _scrollController,
                                thumbVisibility: true,
                                thickness: 4.0,
                                trackVisibility: true,
                                child: SingleChildScrollView(
                                  child: showMessage
                                      ? Center(
                                          child: Text(
                                            "Scan or upload an image for the further result",
                                            style: SafeGoogleFont(
                                              'Questrial',
                                              fontSize: 17 * ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 1.371875 * ffem / fem,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        )
                                      : showAlert
                                          ? Center(
                                              child: Text(
                                                "No fish or Out of scope fish detected.Try Again ",
                                                style: SafeGoogleFont(
                                                  'Questrial',
                                                  fontSize: 17 * ffem,
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.371875 * ffem / fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            )
                                          : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  // speciesNtY (176:158)
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      0 * fem,
                                                      20 * fem),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        child: Icon(
                                                            FontAwesomeIcons
                                                                .fishFins),
                                                        margin:
                                                            EdgeInsets.all(10),
                                                      ),
                                                      Text(
                                                        'Species       : ',
                                                        style: SafeGoogleFont(
                                                          'Questrial',
                                                          fontSize: 15 * ffem,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.371875 *
                                                              ffem /
                                                              fem,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          widget.fd
                                                              .scientific_name,
                                                          maxLines: 2,
                                                          style: SafeGoogleFont(
                                                            'Questrial',
                                                            fontSize: 17 * ffem,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            height: 1.371875 *
                                                                ffem /
                                                                fem,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    1,
                                                                    3,
                                                                    26),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  // orderJGQ (176:157)
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      0 * fem,
                                                      20 * fem),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        child: Icon(Icons
                                                            .reorder_outlined),
                                                        margin:
                                                            EdgeInsets.all(10),
                                                      ),
                                                      Text(
                                                        'Order            : ',
                                                        style: SafeGoogleFont(
                                                          'Questrial',
                                                          fontSize: 15 * ffem,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.371875 *
                                                              ffem /
                                                              fem,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                      Text(
                                                        widget.fd.order,
                                                        style: SafeGoogleFont(
                                                          'Questrial',
                                                          fontSize: 17 * ffem,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          height: 1.371875 *
                                                              ffem /
                                                              fem,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  // familypVe (176:156)
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      0 * fem,
                                                      20 * fem),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        child:
                                                            Icon(Icons.group),
                                                        margin:
                                                            EdgeInsets.all(10),
                                                      ),
                                                      Text(
                                                        'Family           : ',
                                                        style: SafeGoogleFont(
                                                          'Questrial',
                                                          fontSize: 15 * ffem,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.371875 *
                                                              ffem /
                                                              fem,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                      Text(
                                                        widget.fd.family,
                                                        style: SafeGoogleFont(
                                                          'Questrial',
                                                          fontSize: 17 * ffem,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          height: 1.371875 *
                                                              ffem /
                                                              fem,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                    // nameincountryezU (176:159)
                                                    margin: EdgeInsets.fromLTRB(
                                                        0 * fem,
                                                        0 * fem,
                                                        0 * fem,
                                                        20 * fem),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          child: Icon(
                                                              FontAwesomeIcons
                                                                  .locationPin),
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10),
                                                        ),
                                                        Text(
                                                          'Name in \nCountry         : ',
                                                          style: SafeGoogleFont(
                                                            'Questrial',
                                                            fontSize: 15 * ffem,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1.371875 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                        Text(
                                                          widget.fd.localName,
                                                          style: SafeGoogleFont(
                                                            'Questrial',
                                                            fontSize: 15 * ffem,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            height: 1.371875 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        )
                                                      ],
                                                    )),
                                                Container(
                                                    // nameincountryezU (176:159)
                                                    margin: EdgeInsets.fromLTRB(
                                                        0 * fem,
                                                        0 * fem,
                                                        0 * fem,
                                                        20 * fem),
                                                    //width: 100 * fem,
                                                    child: Row(children: [
                                                      Container(
                                                        child: Icon(
                                                            Icons.description),
                                                        margin:
                                                            EdgeInsets.all(10),
                                                      ),
                                                      Text(
                                                        'Short \nDescription : ',
                                                        style: SafeGoogleFont(
                                                          'Questrial',
                                                          fontSize: 15 * ffem,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.371875 *
                                                              ffem /
                                                              fem,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          widget.fd.description,
                                                          maxLines: 15,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: SafeGoogleFont(
                                                            'Questrial',
                                                            fontSize: 17 * ffem,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            height: 1.371875 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                      ),
                                                    ])),
                                                Container(
                                                    // nameincountryezU (176:159)
                                                    margin: EdgeInsets.fromLTRB(
                                                        0 * fem,
                                                        0 * fem,
                                                        0 * fem,
                                                        20 * fem),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          child: Icon(
                                                              FontAwesomeIcons
                                                                  .researchgate),
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10),
                                                        ),
                                                        Text(
                                                          '  Biology      : ',
                                                          style: SafeGoogleFont(
                                                            'Questrial',
                                                            fontSize: 15 * ffem,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1.371875 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: Text(
                                                            widget.fd.biology,
                                                            maxLines: 10,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style:
                                                                SafeGoogleFont(
                                                              'Questrial',
                                                              fontSize:
                                                                  17 * ffem,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              height: 1.371875 *
                                                                  ffem /
                                                                  fem,
                                                              color: Color(
                                                                  0xff000000),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    )),
                                                Container(
                                                  // nameincountryezU (176:159)
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      0 * fem,
                                                      20 * fem),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        child: Icon(
                                                            Icons.dangerous),
                                                        margin:
                                                            EdgeInsets.all(10),
                                                      ),
                                                      Text(
                                                        'Threat to     : \nHumans    ',
                                                        style: SafeGoogleFont(
                                                          'Questrial',
                                                          fontSize: 15 * ffem,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.371875 *
                                                              ffem /
                                                              fem,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          widget
                                                              .fd.threatTohumans
                                                              .split('(')[0],
                                                          maxLines: 3,
                                                          style: SafeGoogleFont(
                                                            'Questrial',
                                                            fontSize: 17 * ffem,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            height: 1.371875 *
                                                                ffem /
                                                                fem,
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  // nameincountryezU (176:159)
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      0 * fem,
                                                      20 * fem),
                                                  child: Row(children: [
                                                    Container(
                                                      child: Icon(
                                                          FontAwesomeIcons
                                                              .flag),
                                                      margin:
                                                          EdgeInsets.all(10),
                                                    ),
                                                    Text(
                                                      'IUCN Red \nList Status  : ',
                                                      style: SafeGoogleFont(
                                                        'Questrial',
                                                        fontSize: 15 * ffem,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1.371875 *
                                                            ffem /
                                                            fem,
                                                        color:
                                                            Color(0xff000000),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        widget.fd
                                                            .iucnRedListStatus,
                                                        maxLines: 5,
                                                        style: SafeGoogleFont(
                                                          'Questrial',
                                                          fontSize: 17 * ffem,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          height: 1.371875 *
                                                              ffem /
                                                              fem,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                    )
                                                  ]),
                                                ),
                                              ],
                                            ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  _navigationandDisplaySelection(BuildContext context) async {
    final result = Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeTab()));

    if (result != null) {
      setState(() {});
    }
  }
}
