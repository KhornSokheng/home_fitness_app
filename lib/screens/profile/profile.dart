import 'dart:async';

import 'package:home_fitness/models/userprofile.dart';
import 'package:home_fitness/models/userdataprofile.dart';
import 'package:home_fitness/screens/profile/edit_password.dart';
import 'package:home_fitness/widgets/display_image_widget.dart';

import 'package:home_fitness/screens/profile/edit_desc.dart';
import 'package:home_fitness/screens/profile/edit_name.dart';
import 'package:home_fitness/screens/profile/edit_email.dart';
import 'package:home_fitness/screens/profile/edit_img.dart';
import 'package:home_fitness/screens/profile/edit_phone.dart';

import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
//bool showPassword = false;
//DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final userdataprofile = UserDataProfile.myUser;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Column(
        // color: Color.fromARGB(255, 255, 255, 255),
        // padding: EdgeInsets.only(left: 45, top: 25, right: 45),
        // child: GestureDetector(
        //   onTap: () {
        //     FocusScope.of(context).unfocus();
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 10,
          ),
          // Center(
          //     child: Padding(
          //         padding: EdgeInsets.only(bottom: 20),
          //         child: Text(
          //           'Profile',
          //           style: TextStyle(
          //             fontSize: 30,
          //             fontWeight: FontWeight.w700,
          //             color: Color.fromRGBO(64, 105, 225, 1),
          //           ),
          //         ))),
          InkWell(
              onTap: () {
                navigateSecondPage(EditImagePage());
              },
              child: DisplayImage(
                imagePath: userdataprofile.image,
                onPressed: () {},
              )),
          buildUserInfoDisplay(
              userdataprofile.name, 'Name', EditNameFormPage()),
          buildUserInfoDisplay(
              userdataprofile.phone, 'Phone', EditPhoneFormPage()),
          buildUserInfoDisplay(
              userdataprofile.email, 'Email', EditEmailFormPage()),
          buildUserInfoDisplay(
              userdataprofile.password, 'Password', EditPasswordFormPage()),
          Expanded(
            child: buildAbout(userdataprofile),
            flex: 4,
          )
        ],
      ),
    );
  }

  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
      Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                  width: 600,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ))),
                  child: Row(children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              navigateSecondPage(editPage);
                            },
                            child: Text(
                              getValue,
                              style: TextStyle(fontSize: 16, height: 1.4),
                            ))),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                      size: 40.0,
                    )
                  ]))
            ],
          ));

  // Widget builds the About Me Section
  Widget buildAbout(UserProflie user) => Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tell Us About Yourself',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 1),
          Container(
              width: 600,
              height: 100,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ))),
              child: Row(children: [
                Expanded(
                    child: TextButton(
                        onPressed: () {
                          navigateSecondPage(EditDescriptionFormPage());
                        },
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  user.aboutMeDescription,
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.0,
                                  ),
                                ))))),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 40.0,
                )
              ]))
        ],
      ));

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
