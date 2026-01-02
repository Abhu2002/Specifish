import 'dart:math';
import 'package:Specifish/utils.dart';
import 'enums_specifish.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/material.dart';
import 'package:Specifish/recent.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image/image.dart' as img;
import 'package:Specifish/classifier/classifier.dart';
import 'package:Specifish/fish_details.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



const _labelsFileName = 'assets/models/labels.txt';
const _mobilenetPath = 'models/mobilenet_specifish.tflite';
const _inceptionPath = 'models/inception_specifish.tflite';
const _resnetPath = 'models/model_unquant.tflite';
const _apiKey = 'AxTd5ubFstpfPrPrxRpMv4Pd';
const _url = "https://api.remove.bg/v1.0/removebg";

enum _ResultStatus {
  notStarted,
  notFound,
  found,
}

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _hometabState();
}

class _hometabState extends State<HomeTab> {
  bool _loading = false;
  final String? username = FirebaseAuth.instance.currentUser!.displayName;

  // late Classifier classifier;

  late Classifier _mobilenet, _inception, _resnet;

  File? pickedImage;
  XFile? photo;
  var baseUrl = Uri.parse(_url);

  Future<List<int>?> removebg(String imagePath) async {
    var req = http.MultipartRequest("POST", baseUrl);
    req.headers.addAll({"X-API-Key": _apiKey});
    req.files.add(await http.MultipartFile.fromPath("image_file", imagePath));
    final res = await req.send();

    if (res.statusCode == 200) {
      http.Response img = await http.Response.fromStream(res);
      return img.bodyBytes;
    } else {
      print("Failed to fetch data");
      print(res.statusCode);
      print(res.reasonPhrase);
      return null;
    }
  }

  double sigmoid(double x) {
    return 1 / (1 + pow(2.7182, -x));
  }

  Future<String> _analyzeImage(File imag) async {
    // #1
    final image = img.decodeImage(imag.readAsBytesSync())!;

    // #2
    final resultCategoryMobileNet = await _mobilenet.predict(image);
    final resultCategoryInception = await _inception.predict(image);
    final resultCategoryResNet = await _resnet.predict(image);

    print("MobileNet Output : ${resultCategoryMobileNet.label}");
    print("ResNet Output : ${resultCategoryResNet.label}");
    print("Inception Output : ${resultCategoryInception.label}");
    var mobilenet_score = sigmoid(resultCategoryMobileNet.score);
    var inception_score = sigmoid(resultCategoryInception.score);
    var resnet_score = resultCategoryResNet.score;
    print("MobileNet Score :  $mobilenet_score");
    print("Inception Score :  $inception_score");
    print("ResNet Score :  $resnet_score");
    // #3
    if (resultCategoryMobileNet.label == resultCategoryInception.label) {
      return resultCategoryMobileNet.label;
    } else if (resultCategoryMobileNet.label == resultCategoryResNet.label) {
      return resultCategoryResNet.label;
    } else if (resultCategoryInception.label == resultCategoryResNet.label) {
      return resultCategoryInception.label;
    } else if (resultCategoryMobileNet.label.split(' ')[0] ==
        resultCategoryResNet.label.split(' ')[0]) {
      return resultCategoryMobileNet.label;
    } else {
      return classification_enum.NO_OUTPUT.toString();
      // if (mobilenet_score > resnet_score && mobilenet_score > inception_score) {
      //   return resultCategoryMobileNet.label;
      // } else if (resnet_score > mobilenet_score &&
      //     resnet_score > inception_score) {
      //   return resultCategoryResNet.label;
      // } else {
      //   return resultCategoryInception.label;
      // }
    }
  }

  pickImage(ImageSource imageType, BuildContext con) async {
    try {
      final XFile? photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      var backupimage = tempImage;
      // _predict(tempImage);
      // classifyImage(tempImage);

      setState(() {
        _loading = true;
      });
      var bglessBytes = await removebg(tempImage.path);
      if (bglessBytes != null) {
        await tempImage.writeAsBytes(bglessBytes);
      }
      var species = await _analyzeImage(tempImage);
      print(species);
      if (species == classification_enum.NO_OUTPUT.toString()) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => RecentTab(
                image: backupimage,
                species: "TRY AGAIN",
                detected: false,
                fd: FishDetails(scientific_name: species))));
      } else {
        FishDetails fd = FishDetails(scientific_name: species);
        await fd.fetchAndSetDetails();
        if (fd.threatTohumans.contains('Venomous') ||
            fd.threatTohumans.contains('Poisoning') ||
            fd.threatTohumans.contains('Traumatogenic')) {
          Future.delayed(
              Duration.zero,
              () => Alert(
                    context: context,
                    type: AlertType.warning,
                    title: "Danger",
                    desc:
                        "Fish  caught by you is harmful to humans,release it immediately",
                    buttons: [
                      DialogButton(
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                        child:const  Text(
                          "OK",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )
                    ],
                  ).show());
        }
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => RecentTab(
                image: backupimage, species: species, detected: true, fd: fd)));
      }

      setState(() {
        pickedImage = tempImage;
        _loading = false;
      });

      //Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  // loadModel() async {
  //   final interpreter =
  //       await tfl.Interpreter.fromAsset('mobilenet_specifish.tflite');
  //   // await Tflite.loadModel(
  //   //   model: 'assets/models/mobilenet_specifish.tflite',
  //   //   labels: 'assets/models/labels.txt',
  //   // );
  // }

  Future _loadClassifier() async {
    debugPrint(
      'Start loading of Classifier with '
      'labels at $_labelsFileName, '
      'models at $_inceptionPath,$_mobilenetPath and $_resnetPath',
    );

    // #2
    _mobilenet = (await Classifier.loadWith(
      labelsFileName: _labelsFileName,
      modelFileName: _mobilenetPath,
    ))!;
    _resnet = (await Classifier.loadWith(
      labelsFileName: _labelsFileName,
      modelFileName: _resnetPath,
    ))!;
    _inception = (await Classifier.loadWith(
      labelsFileName: _labelsFileName,
      modelFileName: _inceptionPath,
    ))!;

    // void _predict(File iImage) async {
    //   img.Image imageInput = img.decodeImage(iImage.readAsBytesSync())!;
    //   var pred = classifier.predict(imageInput);

    //   print(pred);
    // }

    // @override
    // void initState() {
    //   super.initState();
    //   /* _loading = true; */
    //   classifier = Classifier(numThreads: 2);
    // }

    // #3
  }

  @override
  void initState() {
    setState(() {
      _loading = true;
    });
    super.initState();
    _loadClassifier();
    setState(() {
      _loading = false;
    });
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   // Tflite.close();
  // }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
          body: SingleChildScrollView(
              child: Container(
        width: double.infinity,
        child: Container(
          // androidsmall8mQU (46:9)
          width: double.infinity,
          height: 960 * fem,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 3, 6, 32),
            // borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(0),
            //     topRight: Radius.circular(0),
            //     bottomLeft: Radius.circular(30),
            //     bottomRight: Radius.circular(30)),
          ),
          child: Stack(
            children: [
              Positioned(
                // autogroupcfryfVr (3fmFFoJpW2H623K34JCFRy)
                left: 0 * fem,
                top: 0 * fem,
                child: Container(
                  width: 356 * fem,
                  height: 572 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // rectangle4171ZLL (46:22)
                        left: 4 * fem,
                        top: 4 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 358 * fem,
                            height: 568 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                    bottomLeft: Radius.circular(60),
                                    bottomRight: Radius.circular(60)),
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle41723WQ (46:42)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 356 * fem,
                            height: 182 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0x195b6cff),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30 * fem),
                                  topRight: Radius.circular(30 * fem),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // lampk9v (46:49)
                        left: 321.5 * fem,
                        top: 34.3333435059 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 13 * fem,
                            height: 17.94 * fem,
                            child: Image.asset(
                              'assets/images/lamp-DTe.png',
                              width: 13 * fem,
                              height: 17.94 * fem,
                            ),
                          ),
                        ),
                      ),
                      /* Positioned(
                        // widgetSYY (46:44)
                        left: 27 * fem,
                        top: 36 * fem,
                        child: Container(
                          width: 18 * fem,
                          height: 18 * fem,
                          child:
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // autogroup19fmAUY (3fmFjxAaR8DpZapK6D19fm)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 4 * fem),
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // rectangle4006SaU (I46:44;11:4)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 4 * fem, 0 * fem),
                                      width: 7 * fem,
                                      height: 7 * fem,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1 * fem),
                                        border:
                                            Border.all(color: Color(0xff001c86)),
                                      ),
                                    ),
                                    Container(
                                      // rectangle4007Lvk (I46:44;11:6)
                                      width: 7 * fem,
                                      height: 7 * fem,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1 * fem),
                                        border:
                                            Border.all(color: Color(0xff001c86)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // autogroupzhmy5NY (3fmFqcfoiL4Euf6VsCzHmy)
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // rectangle4008Dje (I46:44;11:5)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 4 * fem, 0 * fem),
                                      width: 7 * fem,
                                      height: 7 * fem,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1 * fem),
                                        border:
                                            Border.all(color: Color(0xff001c86)),
                                      ),
                                    ),
                                    Container(
                                      // rectangle4009wfe (I46:44;11:7)
                                      width: 7 * fem,
                                      height: 7 * fem,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1 * fem),
                                        border:
                                            Border.all(color: Color(0xff001c86)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ), */
                      Positioned(
                        // rectangle4173Gxp (46:43)
                        left: 26 * fem,
                        top: 154 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 310 * fem,
                            height: 57 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7 * fem),
                                border: Border.all(color: Color(0x7f5b6cff)),
                                color: Color(0xffffffff),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x3f5b6cff),
                                    offset: Offset(0 * fem, 4 * fem),
                                    blurRadius: 2 * fem,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // ellipse85Lhn (46:54)
                        left: 24 * fem,
                        top: 73 * fem,
                        child: Align(
                          child: CircleAvatar(
                              backgroundColor: Colors.grey.shade800,
                              radius: 40,
                              child: ClipOval(
                                child: (FirebaseAuth
                                            .instance.currentUser!.photoURL !=
                                        null)
                                    ? Image.network(
                                        FirebaseAuth
                                            .instance.currentUser!.photoURL!,
                                        width: 79,
                                        height: 79,
                                        fit: BoxFit.cover)
                                    : Image.asset('assets/images/profile.png',
                                        height: 79, width: 79),
                                //Text
                              )),
                        ),
                      ),
                      Positioned(
                        // helloT1i (46:55)
                        left: 100 * fem,
                        top: 76 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 39 * fem,
                            height: 21 * fem,
                            child: Text(
                              'Hello,',
                              style: SafeGoogleFont(
                                'Questrial',
                                fontSize: 15 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.371875 * ffem / fem,
                                letterSpacing: 0.3 * fem,
                                color: Color(0xfff74c70),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // usernamehwe (46:56)
                        left: 100 * fem,
                        top: 97 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 97 * fem,
                            height: 28 * fem,
                            child: Text(
                              "$username",
                              style: SafeGoogleFont(
                                'Questrial',
                                fontSize: 20 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.371875 * ffem / fem,
                                letterSpacing: 0.4 * fem,
                                color: Color(0xff001c86),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // line1aVe (46:84)
                        left: 126 * fem,
                        top: 172 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 1 * fem,
                            height: 26 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // line2Vcc (46:85)
                        left: 244 * fem,
                        top: 172 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 1 * fem,
                            height: 26 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // takeaphotouploadaphotoshareRWG (46:86)
                        left: 42 * fem,
                        top: 156 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 271 * fem,
                            height: 16 * fem,
                            child: Text(
                              'take a photo                upload a photo                       share',
                              style: SafeGoogleFont(
                                'Questrial',
                                fontSize: 11 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3718750694 * ffem / fem,
                                letterSpacing: 0.22 * fem,
                                color: Color(0xfff74c70),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // popularplacesforfishingUzL (8:8)
                        left: 27 * fem,
                        top: 238 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 172 * fem,
                            height: 21 * fem,
                            child: Text(
                              'Popular places for fishing ',
                              style: SafeGoogleFont(
                                'Questrial',
                                fontSize: 15 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.371875 * ffem / fem,
                                color: Color(0xff001c86),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // seemoreZkt (8:17)
                        left: 263 * fem,
                        top: 241 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 64 * fem,
                            height: 18 * fem,
                            child: Text(
                              'See more...',
                              style: SafeGoogleFont(
                                'Questrial',
                                fontSize: 13 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3718750293 * ffem / fem,
                                color: Color(0xbff74c70),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // seemore4Br (8:28)
                        left: 265 * fem,
                        top: 402 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 64 * fem,
                            height: 18 * fem,
                            child: Text(
                              'See more...',
                              style: SafeGoogleFont(
                                'Questrial',
                                fontSize: 13 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3718750293 * ffem / fem,
                                color: Color(0xbff74c70),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle8xY8 (8:20)
                        left: 34 * fem,
                        top: 271 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 80 * fem,
                            height: 110 * fem,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(17 * fem),
                              child: Image.asset(
                                'assets/images/rectangle-8-Ly6.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle8rtQ (8:21)
                        left: 142 * fem,
                        top: 271 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 80 * fem,
                            height: 110 * fem,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(17 * fem),
                              child: Image.asset(
                                'assets/images/rectangle-8-DJ8.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle8N64 (8:22)
                        left: 244 * fem,
                        top: 271 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 80 * fem,
                            height: 110 * fem,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(17 * fem),
                              child: Image.asset(
                                'assets/images/rectangle-8.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // whatyoucaughthistoryt4Q (8:27)
                        left: 27 * fem,
                        top: 399 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 176 * fem,
                            height: 21 * fem,
                            child: Text(
                              'What You Caught (History)',
                              style: SafeGoogleFont(
                                'Questrial',
                                fontSize: 15 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.371875 * ffem / fem,
                                color: Color(0xff001c86),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle11MTn (8:32)
                        left: 33 * fem,
                        top: 441 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 81 * fem,
                            height: 82 * fem,
                            child: TextButton(
                              onPressed:
                                  () {} /*  () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          recenttab(image: photo),
                                    ));
                              } */
                              ,
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10 * fem),
                                child: pickedImage != null
                                    ? Image.file(pickedImage!,
                                        fit: BoxFit.cover)
                                    : Image.asset(
                                        'assets/images/rectangle-11.png',
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle9T12 (8:30)
                        left: 141 * fem,
                        top: 441 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 81 * fem,
                            height: 82 * fem,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10 * fem),
                              child: Image.asset(
                                'assets/images/rectangle-9.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle10m1i (8:31)
                        left: 241 * fem,
                        top: 442 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 81 * fem,
                            height: 82 * fem,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10 * fem),
                              child: Image.asset(
                                'assets/images/rectangle-10.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Positioned(
              //   // autogroup3m19GUG (3fmG5C7Wy8LWcxBBLu3M19)
              //   left: 24 * fem,
              //   top: 585 * fem,
              //   child: Container(
              //     padding: EdgeInsets.fromLTRB(
              //         19 * fem, 4.25 * fem, 4 * fem, 7 * fem),
              //     width: 290 * fem,
              //     height: 52 * fem,
              //     decoration: BoxDecoration(
              //       color: Color.fromARGB(255, 3, 6, 32),
              //       borderRadius: BorderRadius.circular(50 * fem),
              //     ),
              //     child: SingleChildScrollView(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.end,
              //         children: [
              //           Container(
              //             // autogroupcu5mYAt (3fmGCXEdwWUaqHMtanCU5m)
              //             margin: EdgeInsets.fromLTRB(
              //                 8.42 * fem, 0 * fem, 7.17 * fem, 2.17 * fem),
              //             width: double.infinity,
              //             child: SingleChildScrollView(
              //               scrollDirection: Axis.horizontal,
              //               child: Row(
              //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                 children: [
              //                   Container(
              //                     // homerxG (46:26)
              //                     margin: EdgeInsets.fromLTRB(0 * fem,
              //                         1.03 * fem, 140.67 * fem, 0 * fem),
              //                     width: 15.17 * fem,
              //                     height: 17.39 * fem,
              //                     child: Image.asset(
              //                       'assets/images/home.png',
              //                       width: 15.17 * fem,
              //                       height: 17.39 * fem,
              //                     ),
              //                   ),
              //                   Container(
              //                     // usercicrleduotonelinempL (46:27)
              //                     margin: EdgeInsets.fromLTRB(0 * fem,
              //                         0 * fem, 54.42 * fem, 0.38 * fem),
              //                     width: 19.5 * fem,
              //                     height: 22.21 * fem,
              //                     child: Image.asset(
              //                       'assets/images/usercicrleduotoneline.png',
              //                       width: 19.5 * fem,
              //                       height: 22.21 * fem,
              //                     ),
              //                   ),
              //                   Container(
              //                     // settinglineUTr (46:28)
              //                     margin: EdgeInsets.fromLTRB(
              //                         0 * fem, 0.92 * fem, 0 * fem, 0 * fem),
              //                     width: 21.67 * fem,
              //                     height: 21.67 * fem,
              //                     child: Image.asset(
              //                       'assets/images/settingline-tqN.png',
              //                       width: 20.67 * fem,
              //                       height: 20.67 * fem,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //           Text(
              //             // homerecentprofilesettingszSC (46:41)
              //             'Home                       Recent                     Profile               Settings',
              //             style: SafeGoogleFont(
              //               'Questrial',
              //               fontSize: 11 * ffem,
              //               fontWeight: FontWeight.w400,
              //               height: 1.3718750694 * ffem / fem,
              //               color: Color(0xfff74c70),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              Positioned(
                // instalightHgC (46:70)
                left: 55 * fem,
                top: 172 * fem,
                child: Align(
                  child: SizedBox(
                    width: 28 * fem,
                    height: 28 * fem,
                    child: IconButton(
                      icon: Icon(Icons.photo_camera_back_rounded, size: 30),
                      onPressed: () {
                        pickImage(ImageSource.camera, context);
                      },
                    ),
                    /*  Image.asset(
                      'assets/images/instalight.png',
                      width: 28 * fem,
                      height: 28 * fem,
                    ), */
                  ),
                ),
              ),
              Positioned(
                // imgboxduotonelinePUL (46:64)
                left: 171 * fem,
                top: 172 * fem,
                child: Align(
                  child: SizedBox(
                    width: 28 * fem,
                    height: 28 * fem,
                    child: IconButton(
                      icon: Icon(Icons.insert_photo_outlined, size: 30),
                      onPressed: () {
                        pickImage(ImageSource.gallery, context);
                      },
                    ), /* Image.asset(
                      'assets/images/imgboxduotoneline.png',
                      width: 28 * fem,
                      height: 28 * fem,
                    ), */
                  ),
                ),
              ),
              Positioned(
                // groupaddlightfgk (46:74)
                left: 282 * fem,
                top: 173 * fem,
                child: Align(
                  child: SizedBox(
                    width: 31 * fem,
                    height: 31 * fem,
                    child: IconButton(
                      icon: Icon(Icons.share_outlined, size: 30),
                      onPressed: () {},
                    ),
                    /*  Image.asset(
                      'assets/images/groupaddlight.png',
                      width: 31 * fem,
                      height: 31 * fem,
                    ), */
                  ),
                ),
              ),
              // Positioned(
              //   // timelightANc (46:93)
              //   left: 131 * fem,
              //   top: 586 * fem,
              //   child: Align(
              //     child: SizedBox(
              //       width: 26 * fem,
              //       height: 26 * fem,
              //       child: Image.asset(
              //         'assets/images/timelight.png',
              //         width: 26 * fem,
              //         height: 26 * fem,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ))),
    );
  }
}
