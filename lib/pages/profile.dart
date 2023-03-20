import 'dart:io';

import 'package:face_net_authentication/pages/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class Profile extends StatelessWidget {
  const Profile(this.username, {Key? key, required this.imagePath})
      : super(key: key);
  final String username;
  final String imagePath;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(File(imagePath)),
                      ),
                    ),
                    margin: EdgeInsets.all(20),
                    width: 50,
                    height: 50,
                  ),

                ],
              ),
              Column(
                children: [
                  Text(
                    'Hi ' + username ,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Welcome to BDTask',
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Spacer(),
              AppButton(
                text: "LOG OUT",
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  MyHomePage(),), (route) => false);
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                color: Colors.red,
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
