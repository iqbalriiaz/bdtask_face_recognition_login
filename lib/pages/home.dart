import 'package:face_net_authentication/locator.dart';
import 'package:face_net_authentication/pages/sign-in.dart';
import 'package:face_net_authentication/pages/sign-up.dart';
import 'package:face_net_authentication/services/camera.service.dart';
import 'package:face_net_authentication/services/ml_service.dart';
import 'package:face_net_authentication/services/face_detector_service.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MLService _mlService = locator<MLService>();
  FaceDetectorService _mlKitService = locator<FaceDetectorService>();
  CameraService _cameraService = locator<CameraService>();
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _initializeServices();
  }

  _initializeServices() async {
    setState(() => loading = true);
    await _cameraService.initialize();
    await _mlService.initialize();
    _mlKitService.initialize();
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body:
              !loading
                  ?
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 300,
                        width: 500,
                        child: Image(image: AssetImage('assets/bdtask.jpg'))),
                    // Container(
                    //   width: MediaQuery.of(context).size.width * 0.8,
                    //   child: Column(
                    //     children: [
                    //       Text(
                    //         "Welcome to BDTask App",
                    //         style: TextStyle(
                    //             fontSize: 25, fontWeight: FontWeight.bold),
                    //         textAlign: TextAlign.center,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => SignIn(),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),

                              color: Colors.green,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.1),
                                  blurRadius: 1,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            padding:
                                EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'LOGIN',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.login, color:Colors.white)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => SignUp(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFF0F0BDB),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.1),
                                  blurRadius: 1,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            padding:
                                EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'SIGN UP',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.person_add, color: Colors.white)
                              ],
                            ),
                          ),
                        ),

                        // InkWell(
                        //   onTap: _launchURL,
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //       color: Colors.black,
                        //       boxShadow: <BoxShadow>[
                        //         BoxShadow(
                        //           color: Colors.blue.withOpacity(0.1),
                        //           blurRadius: 1,
                        //           offset: Offset(0, 2),
                        //         ),
                        //       ],
                        //     ),
                        //     alignment: Alignment.center,
                        //     padding: EdgeInsets.symmetric(
                        //         vertical: 14, horizontal: 16),
                        //     width: MediaQuery.of(context).size.width * 0.8,
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Text(
                        //           'CONTRIBUTE',
                        //           style: TextStyle(color: Colors.white),
                        //         ),
                        //         SizedBox(
                        //           width: 10,
                        //         ),
                        //         FaIcon(
                        //           FontAwesomeIcons.github,
                        //           color: Colors.white,
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    )
                  ],
                ),
              )
          : Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
